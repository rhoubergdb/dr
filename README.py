# Databricks notebook source
# MAGIC %md
# MAGIC #  Disaster Recovery: Managed Tables
# MAGIC ## Regional Failover Sample Notebooks
# MAGIC
# MAGIC The notebooks in this repository demonstrate the region to region deep clone process of a Managed Table using a transient External Table location. 
# MAGIC
# MAGIC Due to the management operations that Unity Catalog automatically performs on Managed Tables, direct deep clone from one managed table to the physical location of another managed table (stored in another region / UC Metastore) is not permitted. This makes the interim External Table a necessary step in the deep clone process.
# MAGIC
# MAGIC ## Configuration Steps
# MAGIC To enable this solution, first create the external storage container in the failover destination region (Region 2). Then create new access connectors in both Region 2 and in Region 1, granting the access connectors role permissions to the Region 2 external storage container.
# MAGIC
# MAGIC **NOTE:** While you may want/need to create a new storage account for the External Storage Container in Region 2, it is also possible to simply add a new container to an existing storage account that you may already be using for UC Catalog managed storage. If you are using an existing storage account, you can also reuse the existing access connector for that account. This also allows you to reuse the Databricks UC Storage Credentials for the access connector to create the Databricks UC External Location (while pointing to the new external container).
# MAGIC
# MAGIC ### Region 2: Create a Storage Container in an ADLS Gen2 Storage Account
# MAGIC Option 1: Create a new Databricks Compatible ADLS Gen2 Storage Account
# MAGIC - https://learn.microsoft.com/en-us/azure/storage/blobs/create-data-lake-storage-account
# MAGIC - Using the new Storage Account, create a new Storage Container for the external table storage directories
# MAGIC
# MAGIC Option 2: Use an existing Databricks Compatible ADLS Gen2 Storage Account
# MAGIC - Using the existing Storage Account, create a new Storage Container for the external table storage directories
# MAGIC
# MAGIC Regardless of the option you choose, the storage account should be in a Resource Group in Region 2.
# MAGIC
# MAGIC ### Region 2: Identify Access Connector or Create new Access Connector
# MAGIC Option 1: Create a new Access Connector for Databricks
# MAGIC - The advantage of creating a new Access Connector is to force the need for a new Databricks UC Storage Credential which will facilitate fine grained access permissions on the n ew external location in UC.
# MAGIC
# MAGIC Option 2: Use an existing Access Connector for Databricks
# MAGIC - The advantage of using an existing access connector is that you will likely already have a Databricks UC Storage Credential configured so you won't need to create another one unless you need fine grained access permissions on the new external location in UC.
# MAGIC
# MAGIC Use the New or Existing Access Connector ID to assign role permissions on the New or Existing Storage Account using this documentation:
# MAGIC - https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/azure-managed-identities
# MAGIC
# MAGIC ### Region 1: Identify Access Connector or Create new Access Connector
# MAGIC Option 1: Create a new Access Connector for Databricks
# MAGIC - The advantage of creating a new Access Connector is to force the need for a new Databricks UC Storage Credential which will facilitate fine grained access permissions on the n ew external location in UC.
# MAGIC
# MAGIC Option 2: Use an existing Access Connector for Databricks
# MAGIC - The advantage of using an existing access connector is that you will likely already have a Databricks UC Storage Credential configured so you won't need to create another one unless you need fine grained access permissions on the new external location in UC.
# MAGIC
# MAGIC Use the New or Existing Access Connector ID to assign role permissions on the New or Existing Storage Account using this documentation:
# MAGIC - https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/azure-managed-identities
# MAGIC
# MAGIC **NOTE:** Regardless of which option is chosen, the Access Connector will be created in Region 1 and granted access to the ADLS Gen2 Storage Account (and related Resource Group) in Region 2.
# MAGIC
# MAGIC ### Create Databricks UC External locations that point to the new external storage container
# MAGIC In **BOTH** regions, use either an existing UC Storage Credential or create a new UC Storage Credential (depending on the options chosen above) to create a new UC External Location that points to the new external storage container in Region 2.
# MAGIC
# MAGIC

# COMMAND ----------

# MAGIC %md
# MAGIC
