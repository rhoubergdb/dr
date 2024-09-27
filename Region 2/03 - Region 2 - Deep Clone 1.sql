-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## External (Region 2) to Managed (Region 2) Clone 1
-- MAGIC ###Clone local (Region 2) External Table to local Managed Table

-- COMMAND ----------

CREATE OR REPLACE TABLE russh.dr_example.table1 DEEP CLONE delta.`abfss://russh-ext-location@russhdemoeastsa.dfs.core.windows.net/table1`

-- COMMAND ----------

DESCRIBE HISTORY russh.dr_example.table1

-- COMMAND ----------

SELECT * FROM russh.dr_example.table1
