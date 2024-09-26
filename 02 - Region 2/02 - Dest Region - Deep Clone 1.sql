-- Databricks notebook source
CREATE OR REPLACE TABLE delta.`s3://anindita-dr-tokyo/visitor` DEEP CLONE anindita.dr.primary_visitor

-- COMMAND ----------


DESCRIBE HISTORY russh.dr_example.table1

-- COMMAND ----------

SELECT * FROM russh.dr_example.table1
