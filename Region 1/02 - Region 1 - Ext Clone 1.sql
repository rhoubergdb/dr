-- Databricks notebook source
-- MAGIC %md
-- MAGIC
-- MAGIC ## Managed to External Clone 1
-- MAGIC ### Clone (local) Managed Table to (local) External Table

-- COMMAND ----------

CREATE OR REPLACE TABLE delta.`abfss://russh-ext-location@russhdemosa.dfs.core.windows.net/table1` DEEP CLONE russh.dr_example.table1
