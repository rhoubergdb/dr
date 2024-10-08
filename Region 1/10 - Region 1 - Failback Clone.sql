-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## Failback
-- MAGIC ###Clone (Region 2) External Table to (local) Managed Table
-- MAGIC This clone operation will be an incremental update using the Change Data Feed from the Region 2 External Table to bring the local (Region 1) Managed Table up to date.

-- COMMAND ----------

-- DBTITLE 1,Get (OUTDATED!) History
DESCRIBE HISTORY russh.dr_example.table1

-- COMMAND ----------

-- DBTITLE 1,Show Outdated Data (Missing Region 2 Update)
SELECT 'original' as version,* FROM russh.dr_example.table1@v1 order by id;
SELECT 'region 1 update' as version,* FROM russh.dr_example.table1@v2 order by id;
SELECT 'region 2 update' as version,* FROM russh.dr_example.table1@v3 order by id;

-- COMMAND ----------

-- DBTITLE 1,Update Table1 with Failback Clone Data
CREATE OR REPLACE TABLE russh.dr_example.table1 DEEP CLONE delta.`abfss://russh-ext-location@russhdemoeastsa.dfs.core.windows.net/table1`

-- COMMAND ----------

-- DBTITLE 1,Show new CLONE entry in history
DESCRIBE HISTORY russh.dr_example.table1

-- COMMAND ----------

-- DBTITLE 1,Show CURRENT data (Updated from Region 2)
SELECT 'original' as version,* FROM russh.dr_example.table1@v1 order by id;
SELECT 'region 1 update' as version,* FROM russh.dr_example.table1@v2 order by id;
SELECT 'region 2 update' as version,* FROM russh.dr_example.table1@v4 order by id;
