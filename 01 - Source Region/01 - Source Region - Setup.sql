-- Databricks notebook source
-- MAGIC %md
-- MAGIC
-- MAGIC ## Setup Source Table and Sample Data

-- COMMAND ----------

-- DBTITLE 1,Create table and insert data
DROP TABLE IF EXISTS russh.dr_example.table1;

CREATE TABLE russh.dr_example.table1 (
    id INT,
    color VARCHAR(10)
);

INSERT INTO russh.dr_example.table1 (id, color)
VALUES 
    (1, 'red'),
    (2, 'blue'),
    (3, 'green');



-- COMMAND ----------

-- DBTITLE 1,Show sample data
SELECT * FROM russh.dr_example.table1;

-- COMMAND ----------

-- DBTITLE 1,Show the path to the MANAGED Table
select storage_path from russh.information_schema.tables
where table_name = 'table1'
