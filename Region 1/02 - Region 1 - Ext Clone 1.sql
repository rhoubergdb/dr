-- Databricks notebook source
-- MAGIC %md
-- MAGIC
-- MAGIC ## Managed (Region 1) to External (Region 2) Clone 1
-- MAGIC ### Clone local (Region 1) Managed Table to (Region 2) External Table

-- COMMAND ----------

CREATE OR REPLACE TABLE delta.`abfss://russh-ext-location@russhdemoeastsa.dfs.core.windows.net/table1` DEEP CLONE russh.dr_example.table1
