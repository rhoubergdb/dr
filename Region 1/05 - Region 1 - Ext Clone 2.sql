-- Databricks notebook source
-- MAGIC %md
-- MAGIC
-- MAGIC ## Managed (Region 1) to External (Region 2) Clone 2
-- MAGIC ### Clone local (Region 1) Managed Table to (Region 2) External Table
-- MAGIC This will result in an incremental update to the Region 2 external table using the Change Data Feed from the Region 1 managed table.

-- COMMAND ----------

CREATE OR REPLACE TABLE delta.`abfss://russh-ext-location@russhdemoeastsa.dfs.core.windows.net/table1` DEEP CLONE russh.dr_example.table1
