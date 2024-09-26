-- Databricks notebook source
-- MAGIC %md
-- MAGIC
-- MAGIC ## Make change in Region 1 data

-- COMMAND ----------

-- DBTITLE 1,Modify a Record in the Sample Table
UPDATE russh.dr_example.table1 SET color = "yellow" WHERE id = 3;

-- COMMAND ----------

DESCRIBE HISTORY russh.dr_example.table1

-- COMMAND ----------

-- DBTITLE 1,Show updated table
SELECT 'original' as version,* FROM russh.dr_example.table1@v1 order by id;
SELECT 'after update' as version,* FROM russh.dr_example.table1@v2 order by id;
