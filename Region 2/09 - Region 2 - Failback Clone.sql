-- Databricks notebook source
-- MAGIC %md
-- MAGIC # [HALT ALL REGION 2 PROCESSING!!!]
-- MAGIC ## Prepare for Failback
-- MAGIC ### Region 2 clone back to Region 1
-- MAGIC
-- MAGIC  At this point, Region 1 has recovered, clone the Region 2 data back to the External table location in Region 1

-- COMMAND ----------

CREATE OR REPLACE TABLE delta.`abfss://russh-ext-location@russhdemosa.dfs.core.windows.net/table1` DEEP CLONE russh.dr_example.table1
