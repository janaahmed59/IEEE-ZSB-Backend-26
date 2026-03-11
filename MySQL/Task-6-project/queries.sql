-- ============================================================
-- FOOD DELIVERY APP — BUSINESS LOGIC QUERIES
-- Each query is labelled with the app screen/feature it powers
-- ============================================================

USE food_delivery;


-- ============================================================
-- QUERY 1: Home Screen — "Restaurants Near You"
-- Powers the home screen listing of restaurants available to
-- a specific customer based on their saved address location.
-- Shows restaurant name, image, average rating, and whether
-- they are currently open based on operating hours.
-- ============================================================
SELECT
    r.id                                        AS restaurant_id,
    r.name                                      AS restaurant_name,
    r.image,
    b.id                                        AS branch_id,
    b.location                                  AS branch_location,
    ROUND(AVG(gr.restaurant_rating), 1)         AS avg_rating,
    COUNT(DISTINCT gr.order_id)                 AS total_reviews,
    oh.open_time,
    oh.close_time,
    CASE
        WHEN CURTIME() BETWEEN oh.open_time AND oh.close_time
        THEN 'Open'
        ELSE 'Closed'
    END                                         AS status
FROM Restaurant r
JOIN Branch b          ON b.restaurant_id = r.id
JOIN Delivery_Zone dz  ON dz.branch_id    = b.id
JOIN Operating_Hours oh ON oh.branch_id   = b.id
LEFT JOIN Orders o     ON o.branch_id     = b.id
LEFT JOIN General_Rating gr ON gr.order_id = o.id
WHERE dz.location = 'Garden City'   -- replace with customer's resolved zone
GROUP BY r.id, r.name, r.image, b.id, b.location, oh.open_time, oh.close_time
ORDER BY avg_rating DESC;


-- ============================================================
-- QUERY 2: Restaurant Menu Screen
-- Powers the full menu page for a specific branch.
-- Returns every category, its items, price, availability,
-- and all applicable modifiers so the frontend can render
-- the menu tree in one round-trip.
-- ============================================================
SELECT
    c.id                        AS category_id,
    c.name                      AS category_name,
    i.id                        AS item_id,
    i.name                      AS item_name,
    i.price                     AS base_price,
    i.is_available,
    m.id                        AS modifier_id,
    m.name                      AS modifier_name,
    m.over_price                AS modifier_extra_cost
FROM Category c
JOIN Item i                  ON i.category_id  = c.id
JOIN Menu mn                 ON mn.id          = c.menu_id
LEFT JOIN Item_Modifier im   ON im.item_id     = i.id
LEFT JOIN Modifiers m        ON m.id           = im.modifier_id
WHERE mn.branch_id = 1           -- replace with selected branch id
ORDER BY c.id, i.id, m.id;


-- ============================================================
-- QUERY 3: Item Detail Screen — Average Item Rating & Reviews
-- Powers the star rating and review count shown on an item's
-- detail page, and surfaces the top-rated items per branch
-- to highlight popular dishes.
-- ============================================================
SELECT
    i.id                            AS item_id,
    i.name                          AS item_name,
    i.price,
    ROUND(AVG(ir.rating), 1)        AS avg_rating,
    COUNT(ir.rating)                AS review_count
FROM Item i
JOIN Category c     ON c.id       = i.category_id
JOIN Menu mn        ON mn.id      = c.menu_id
LEFT JOIN Item_Rating ir ON ir.item_id = i.id
WHERE mn.branch_id = 1             -- replace with branch
GROUP BY i.id, i.name, i.price
HAVING review_count > 0
ORDER BY avg_rating DESC, review_count DESC;


-- ============================================================
-- QUERY 4: Checkout Screen — Validate & Apply Promo Code
-- Called when a customer submits a promo code at checkout.
-- Checks: code exists, not expired, not past expiration date,
-- customer hasn't exceeded their personal usage limit.
-- Returns the discount rate if valid, or a rejection reason.
-- ============================================================
SELECT
    p.id                    AS promo_id,
    p.code,
    p.discount,
    p.expiration_date,
    p.is_expired,
    COALESCE(cpl.usage_per_user, 0)  AS times_used_by_customer,
    CASE
        WHEN p.is_expired = TRUE
            THEN 'EXPIRED'
        WHEN p.expiration_date < CURDATE()
            THEN 'EXPIRED'
        WHEN COALESCE(cpl.usage_per_user, 0) >= 3
            THEN 'USAGE_LIMIT_REACHED'
        ELSE 'VALID'
    END                     AS validation_status
FROM Promocode p
LEFT JOIN Cust_Promo_Limit cpl
       ON cpl.promo_id = p.id
      AND cpl.cust_id  = 1          -- replace with logged-in customer id
WHERE p.code = 'IFTAR20';           -- replace with submitted code


-- ============================================================
-- QUERY 5: Order Tracking Screen — Live Order Status
-- Powers the real-time order tracking screen.
-- Returns full order details: items ordered with modifiers,
-- the delivery captain's info, and current order status.
-- ============================================================
SELECT
    o.id                        AS order_id,
    o.current_status,
    o.timestamp                 AS placed_at,
    o.address,
    o.total_price,
    o.delivery_fee,
    o.is_donation,
    r.name                      AS restaurant_name,
    b.location                  AS branch_location,
    -- items
    i.name                      AS item_name,
    oi.quantity,
    oi.final_price,
    md.name                     AS modifier,
    -- captain
    dc.id                       AS captain_id,
    dc.vehicle_details,
    dc.current_status           AS captain_status
FROM Orders o
JOIN Branch b           ON b.id         = o.branch_id
JOIN Restaurant r       ON r.id         = b.restaurant_id
JOIN Order_Item oi      ON oi.order_id  = o.id
JOIN Item i             ON i.id         = oi.item_id
LEFT JOIN Modifiers md  ON md.id        = oi.modifier_id
LEFT JOIN Delivery_Cap dc ON dc.id      = o.cap_id
WHERE o.id = 5                          -- replace with active order id
ORDER BY i.name;


-- ============================================================
-- QUERY 6: Order History Screen — Customer Past Orders
-- Powers the "My Orders" screen showing all past orders for
-- a customer with a summary per order: restaurant, total,
-- status, and a comma-separated list of items ordered.
-- ============================================================
SELECT
    o.id                                            AS order_id,
    o.timestamp,
    o.current_status,
    o.total_price,
    o.delivery_fee,
    o.is_donation,
    r.name                                          AS restaurant_name,
    b.location                                      AS branch_location,
    pr.code                                         AS promo_used,
    pr.discount,
    GROUP_CONCAT(i.name ORDER BY i.name SEPARATOR ', ') AS items_ordered
FROM Orders o
JOIN Branch b          ON b.id          = o.branch_id
JOIN Restaurant r      ON r.id          = b.restaurant_id
JOIN Order_Item oi     ON oi.order_id   = o.id
JOIN Item i            ON i.id          = oi.item_id
LEFT JOIN Promocode pr ON pr.id         = o.promocode_id
WHERE o.cust_id = 5                                 -- replace with customer id
GROUP BY o.id, o.timestamp, o.current_status, o.total_price,
         o.delivery_fee, o.is_donation,
         r.name, b.location, pr.code, pr.discount
ORDER BY o.timestamp DESC;


-- ============================================================
-- QUERY 7: Admin Dashboard — Top Performing Restaurants
-- Powers the admin analytics panel showing which restaurants
-- generate the most revenue, have the most orders, and hold
-- the highest average customer satisfaction score.
-- ============================================================
SELECT
    r.id                                AS restaurant_id,
    r.name                              AS restaurant_name,
    COUNT(DISTINCT o.id)                AS total_orders,
    SUM(o.total_price)                  AS total_revenue,
    ROUND(AVG(gr.restaurant_rating), 2) AS avg_restaurant_rating,
    ROUND(AVG(gr.captain_rating), 2)    AS avg_captain_rating,
    COUNT(DISTINCT o.cust_id)           AS unique_customers,
    SUM(CASE WHEN o.is_donation THEN 1 ELSE 0 END) AS charity_orders
FROM Restaurant r
JOIN Branch b           ON b.restaurant_id  = r.id
JOIN Orders o           ON o.branch_id      = b.id
LEFT JOIN General_Rating gr ON gr.order_id  = o.id
WHERE o.current_status = 'Delivered'
GROUP BY r.id, r.name
ORDER BY total_revenue DESC;


-- ============================================================
-- QUERY 8: Admin Dashboard — Captain Performance & Earnings
-- Powers the delivery captain management screen.
-- Shows each captain's total deliveries, total earnings
-- (base pay per delivery + bonuses), and average rating
-- from customers.
-- ============================================================
SELECT
    dc.id                                       AS captain_id,
    dc.vehicle_details,
    dc.current_status,
    dc.base_pay,
    COUNT(DISTINCT o.id)                        AS total_deliveries,
    ROUND(COUNT(DISTINCT o.id) * dc.base_pay
          + COALESCE(SUM(DISTINCT db.bonus), 0), 2)  AS total_earnings,
    COALESCE(SUM(db.bonus), 0)                  AS total_bonuses,
    ROUND(AVG(gr.captain_rating), 2)            AS avg_customer_rating
FROM Delivery_Cap dc
LEFT JOIN Orders o          ON o.cap_id         = dc.id
                           AND o.current_status  = 'Delivered'
LEFT JOIN General_Rating gr ON gr.order_id       = o.id
LEFT JOIN Delivery_Bonus db ON db.cap_id         = dc.id
GROUP BY dc.id, dc.vehicle_details, dc.current_status, dc.base_pay
ORDER BY total_deliveries DESC;


-- ============================================================
-- QUERY 9: Reorder Screen — "Order Again" Feature
-- When a customer taps "Order Again" on a past order,
-- this query fetches the exact items + modifiers from that
-- order so the app can pre-populate the cart, also checking
-- current item availability so unavailable items can be
-- flagged before checkout.
-- ============================================================
SELECT
    o.id                        AS original_order_id,
    o.branch_id,
    r.name                      AS restaurant_name,
    i.id                        AS item_id,
    i.name                      AS item_name,
    i.price                     AS current_price,
    i.is_available,
    oi.quantity,
    oi.final_price              AS original_price,
    md.id                       AS modifier_id,
    md.name                     AS modifier_name,
    md.over_price               AS modifier_cost,
    CASE
        WHEN i.is_available = FALSE THEN 'Unavailable — removed from cart'
        WHEN i.price > oi.final_price / oi.quantity
             THEN CONCAT('Price increased by EGP ',
                  ROUND(i.price - (oi.final_price / oi.quantity), 2))
        ELSE 'OK'
    END                         AS reorder_notice
FROM Orders o
JOIN Branch b           ON b.id         = o.branch_id
JOIN Restaurant r       ON r.id         = b.restaurant_id
JOIN Order_Item oi      ON oi.order_id  = o.id
JOIN Item i             ON i.id         = oi.item_id
LEFT JOIN Modifiers md  ON md.id        = oi.modifier_id
WHERE o.id      = 5                     -- replace with order to reorder
  AND o.cust_id = 5;                    -- security check: must own the order


-- ============================================================
-- QUERY 10: Charity / Donation Screen — Impact Summary
-- Powers the charity page showing a customer how much they
-- have donated in total, how many charity orders they placed,
-- and which organisations received their donations.
-- ============================================================
SELECT
    c.id                            AS customer_id,
    c.name                          AS customer_name,
    COUNT(o.id)                     AS total_charity_orders,
    SUM(o.total_price)              AS total_donated_egp,
    GROUP_CONCAT(DISTINCT o.address ORDER BY o.timestamp SEPARATOR ' | ')
                                    AS organisations_supported,
    MIN(o.timestamp)                AS first_donation,
    MAX(o.timestamp)                AS latest_donation
FROM Customer c
JOIN Orders o ON o.cust_id = c.id AND o.is_donation = TRUE
GROUP BY c.id, c.name
ORDER BY total_donated_egp DESC;


-- ============================================================
-- QUERY 11: Iftar Pre-Order Screen — Scheduled Orders Report
-- Powers the operations dashboard showing all scheduled
-- Iftar pre-orders grouped by branch and delivery slot,
-- so kitchen staff can prepare in advance.
-- Also shows how many orders are pending per captain.
-- ============================================================
SELECT
    DATE(o.timestamp)               AS order_date,
    TIME(o.timestamp)               AS delivery_slot,
    r.name                          AS restaurant,
    b.location                      AS branch,
    COUNT(o.id)                     AS total_iftar_orders,
    SUM(o.total_price)              AS slot_revenue,
    dc.id                           AS captain_id,
    dc.vehicle_details              AS captain_vehicle,
    COUNT(o.id)                     AS orders_assigned_to_captain,
    GROUP_CONCAT(
        CONCAT(cu.name, ' → ', o.address)
        ORDER BY o.id
        SEPARATOR ' | '
    )                               AS customer_delivery_manifest
FROM Orders o
JOIN Branch b           ON b.id         = o.branch_id
JOIN Restaurant r       ON r.id         = b.restaurant_id
JOIN Delivery_Cap dc    ON dc.id        = o.cap_id
JOIN Customer cu        ON cu.id        = o.cust_id
WHERE o.delivery_factor > 1.0          -- scheduled / pre-orders only
  AND o.current_status != 'Cancelled'
GROUP BY DATE(o.timestamp), TIME(o.timestamp),
         r.name, b.location, dc.id, dc.vehicle_details
ORDER BY order_date, delivery_slot, branch;


-- ============================================================
-- QUERY 12: Search & Discovery — Most Popular Items
-- Powers the "Trending Now" or search results ranking.
-- Ranks items by number of times ordered across all branches,
-- filtered to only currently available items.
-- ============================================================
SELECT
    i.id                            AS item_id,
    i.name                          AS item_name,
    r.name                          AS restaurant,
    b.location                      AS branch,
    i.price,
    SUM(oi.quantity)                AS times_ordered,
    ROUND(AVG(ir.rating), 1)        AS avg_rating,
    COUNT(DISTINCT ir.order_id)     AS rated_by
FROM Item i
JOIN Category c         ON c.id         = i.category_id
JOIN Menu mn            ON mn.id        = c.menu_id
JOIN Branch b           ON b.id         = mn.branch_id
JOIN Restaurant r       ON r.id         = b.restaurant_id
JOIN Order_Item oi      ON oi.item_id   = i.id
LEFT JOIN Item_Rating ir ON ir.item_id  = i.id
WHERE i.is_available = TRUE
GROUP BY i.id, i.name, r.name, b.location, i.price
ORDER BY times_ordered DESC, avg_rating DESC
LIMIT 20;


-- ============================================================
-- QUERY 13: Notifications / Loyalty Screen — Customer Spend
-- Powers a loyalty or spend-tracker feature showing each
-- customer's lifetime spend, number of orders, favourite
-- restaurant, and whether they qualify for a loyalty reward
-- (e.g. every 10 delivered orders earns a reward).
-- ============================================================
SELECT
    c.id                                        AS customer_id,
    c.name,
    COUNT(o.id)                                 AS total_orders,
    SUM(o.total_price)                          AS lifetime_spend_egp,
    ROUND(AVG(o.total_price), 2)                AS avg_order_value,
    SUM(CASE WHEN o.is_donation THEN 1 ELSE 0 END) AS charity_orders,
    -- favourite restaurant (most orders)
    (
        SELECT r2.name
        FROM Orders o2
        JOIN Branch b2 ON b2.id = o2.branch_id
        JOIN Restaurant r2 ON r2.id = b2.restaurant_id
        WHERE o2.cust_id = c.id AND o2.current_status = 'Delivered'
        GROUP BY r2.id
        ORDER BY COUNT(*) DESC
        LIMIT 1
    )                                           AS favourite_restaurant,
    FLOOR(COUNT(CASE WHEN o.current_status = 'Delivered' THEN 1 END) / 10)
                                                AS loyalty_rewards_earned,
    MOD(COUNT(CASE WHEN o.current_status = 'Delivered' THEN 1 END), 10)
                                                AS orders_until_next_reward
FROM Customer c
LEFT JOIN Orders o ON o.cust_id = c.id
GROUP BY c.id, c.name
ORDER BY lifetime_spend_egp DESC;