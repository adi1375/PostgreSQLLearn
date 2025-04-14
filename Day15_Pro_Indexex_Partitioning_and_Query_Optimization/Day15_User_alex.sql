SELECT  * FROM customer;
-- ERROR:  permission denied for table customer 
-- alex can't use existing tables


CREATE TABLE test_table (id SERIAL);
-- ERROR:  permission denied for schema public
-- object creation not allowed

DROP  TABLE test_table;