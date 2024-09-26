-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## Region to Region Clone 2
-- MAGIC ###Clone (remote) External Table to (local) Managed Table

-- COMMAND ----------

CREATE OR REPLACE TABLE russh.dr_example.table1 DEEP CLONE delta.`abfss://russh-ext-location@russhdemosa.dfs.core.windows.net/table1`

-- COMMAND ----------

DESCRIBE HISTORY russh.dr_example.table1

-- COMMAND ----------

SELECT * FROM russh.dr_example.table1
