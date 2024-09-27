-- Databricks notebook source
-- MAGIC %md
-- MAGIC
-- MAGIC ## Managed to External Clone 2
-- MAGIC ###Clone (local) Managed Table to (local) External Table

-- COMMAND ----------

CREATE OR REPLACE TABLE delta.`abfss://russh-ext-location@russhdemoeastsa.dfs.core.windows.net/table1` DEEP CLONE russh.dr_example.table1
