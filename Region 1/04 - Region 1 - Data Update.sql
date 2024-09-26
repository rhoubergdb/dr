-- Databricks notebook source
-- MAGIC %md
-- MAGIC
-- MAGIC ## Make change in source region data

-- COMMAND ----------

-- DBTITLE 1,Modify a Record in the Sample Table
UPDATE russh.dr_example.table1 SET color = "yellow" WHERE id = 3;

-- COMMAND ----------

DESCRIBE HISTORY russh.dr_example.table1

-- COMMAND ----------

-- DBTITLE 1,Show updated table
SELECT 'original' as version,* FROM russh.dr_example.table1@v1;
SELECT 'after update' as version,* FROM russh.dr_example.table1@v2;

-- COMMAND ----------

-- DBTITLE 1,Deep clone is incremental any clones do not propagate any changes (note 0 files are copied)
CREATE OR REPLACE TABLE delta.`s3://anindita-dr-tokyo/visitor` DEEP CLONE anindita.dr.primary_visitor

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
-- MAGIC ## Work on DR region during failover

-- COMMAND ----------

-- DBTITLE 1,Primary will remain the same and during failover may not be available
SELECT * FROM primary_visitor;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
-- MAGIC ## Fallback to primary
-- MAGIC
-- MAGIC After the primary region is now available again after the disaster ends, we may want to fall back from the secondary to primary.
-- MAGIC
-- MAGIC To do so we want to move the secondary table back to the primary region as a new table. This way you can reconcile any changes that have not been cloned over. 
-- MAGIC
-- MAGIC Then you can rename the tables

-- COMMAND ----------

-- DBTITLE 1,Create new table _fallback to clone back to primary region database

CREATE OR REPLACE TABLE primary_visitor_fallback deep CLONE secondary_visitor

-- COMMAND ----------

-- DBTITLE 1,Rename the original table as a bck table and then alter the fallback table to the primary. (Reconcile any non cloned changes here ex. not provided)
set spark.databricks.delta.alterTable.rename.enabledOnAWS=true;
ALTER TABLE primary_visitor RENAME TO primary_visitor_bck1;
ALTER TABLE primary_visitor_fallback RENAME TO primary_visitor;
