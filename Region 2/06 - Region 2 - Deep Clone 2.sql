-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## Region to Region Clone 2
-- MAGIC ###Clone (remote) External Table to (local) Managed Table

-- COMMAND ----------

CREATE OR REPLACE TABLE russh.dr_example.table1 DEEP CLONE delta.`abfss://russh-ext-location@russhdemoeastsa.dfs.core.windows.net/table1`

-- COMMAND ----------

DESCRIBE HISTORY russh.dr_example.table1

-- COMMAND ----------

SELECT 'original' as version,* FROM russh.dr_example.table1@v0 order by id;
SELECT 'after update' as version,* FROM russh.dr_example.table1@v1 order by id;
