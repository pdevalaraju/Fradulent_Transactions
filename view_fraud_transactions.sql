CREATE VIEW view_fraud_transactions 
AS select a.transaction_date,  a.transaction_amount, b.card_holder_id, c.merchant_name, d.card_holder_name, e.merchant_category_name
                                FROM tbl_transactions as a 
                                INNER JOIN tbl_credit_card as b 
                                ON a.card_number = b.card_number 
                                INNER JOIN tbl_merchant as c 
                                ON a.merchant_id = c.merchant_id 
                                INNER JOIN tbl_card_holder as d 
                                ON b.card_holder_id = d.card_holder_id 
								INNER JOIN tbl_merchant_category as e 
                                ON c.merchant_category_id = e.merchant_category_id;
--							WHERE a.transaction_amount < 2.00 and date_part('hour', a.transaction_date) < 5
--							OR date_part('hour', a.transaction_date) > 22;