-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## External (Region 2) to Managed (Region 2) Clone 2
-- MAGIC ###Clone local (Region 2) External Table to local Managed Table
-- MAGIC This will result in an incremental update to the Region 2 managed table using the Region 2 external table Change Data Feed.

-- COMMAND ----------

CREATE OR REPLACE TABLE russh.dr_example.table1 DEEP CLONE delta.`abfss://russh-ext-location@russhdemoeastsa.dfs.core.windows.net/table1`

-- COMMAND ----------

DESCRIBE HISTORY russh.dr_example.table1

-- COMMAND ----------

SELECT 'original' as version,* FROM russh.dr_example.table1@v0 order by id;
SELECT 'region 1 update' as version,* FROM russh.dr_example.table1@v1 order by id;
