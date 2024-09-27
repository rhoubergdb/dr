-- Databricks notebook source
-- MAGIC %md
-- MAGIC # [HALT ALL REGION 2 PROCESSING!!!]
-- MAGIC ## Prepare for Failback
-- MAGIC ### Clone local (Region 2) Managed Table to local (Region 2) External Table
-- MAGIC
-- MAGIC  At this point, Region 1 has recovered, clone the Region 2 Managed table back to the External table location in Region 2
-- MAGIC
-- MAGIC  During failback preparation, clone the Region 2 Managed table to the Region 2 External table. This will be an incremental operation using the Change Data Feed from the Region 2 Managed table.

-- COMMAND ----------

CREATE OR REPLACE TABLE delta.`abfss://russh-ext-location@russhdemoeastsa.dfs.core.windows.net/table1` DEEP CLONE russh.dr_example.table1
