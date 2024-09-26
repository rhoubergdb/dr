-- Databricks notebook source
-- MAGIC %md
-- MAGIC
-- MAGIC ## Region 2 is now PRIMARY.
-- MAGIC ### Make changes to Region 2 data

-- COMMAND ----------

-- DBTITLE 1,Modify a Record in the Sample Table
UPDATE russh.dr_example.table1 SET color = "purple" WHERE id = 2;

-- COMMAND ----------

DESCRIBE HISTORY russh.dr_example.table1

-- COMMAND ----------

-- DBTITLE 1,Show updated table
SELECT 'original' as version,* FROM russh.dr_example.table1@v0 order by id;
SELECT 'region 1 update' as version,* FROM russh.dr_example.table1@v1 order by id;
SELECT 'region 2 update' as version,* FROM russh.dr_example.table1@v2 order by id;
