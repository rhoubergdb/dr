-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## Failback to Region 1 Clone
-- MAGIC ###Clone (local) External Table to (local) Managed Table

-- COMMAND ----------

CREATE OR REPLACE TABLE russh.dr_example.table1 DEEP CLONE delta.`abfss://russh-ext-location@russhdemosa.dfs.core.windows.net/table1`

-- COMMAND ----------

DESCRIBE HISTORY russh.dr_example.table1

-- COMMAND ----------

SELECT 'original' as version,* FROM russh.dr_example.table1@v1 order by id;
SELECT 'region 1 update' as version,* FROM russh.dr_example.table1@v2 order by id;
SELECT 'region 2 update' as version,* FROM russh.dr_example.table1@v3 order by id;
