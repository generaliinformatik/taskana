-- LIST OF RECOMMENDED INDEXES
-- This list is provided on a as-is basis. It is used for tuning of the internal performance tests. 
-- The script needs to be reviewed and adapted for each indiviual TASKANA setup.
-- ===========================
-- index[1],    0,013MB
   CREATE UNIQUE INDEX "DB2ADMIN"."IDX1805212017540"
   ON "TASKANA "."CLASSIFICATION" ("ID" ASC) INCLUDE
   ("CUSTOM_8", "CUSTOM_7", "CUSTOM_6", "CUSTOM_5", "CUSTOM_4",
   "CUSTOM_3", "CUSTOM_2", "CUSTOM_1", "APPLICATION_ENTRY_POINT",
   "SERVICE_LEVEL", "PRIORITY", "DESCRIPTION", "NAME",
   "CREATED", "VALID_IN_DOMAIN", "DOMAIN", "TYPE", "CATEGORY",
   "PARENT_KEY", "PARENT_ID", "KEY") ALLOW REVERSE SCANS COLLECT SAMPLED DETAILED STATISTICS;
   COMMIT WORK ;
-- index[2],    3,646MB
   CREATE INDEX "DB2ADMIN"."IDX1805212018000" ON "TASKANA "."TASK"
   ("WORKBASKET_KEY" ASC, "DOMAIN" DESC) ALLOW REVERSE
   SCANS COLLECT SAMPLED DETAILED STATISTICS;
   COMMIT WORK ;
-- index[3],    0,056MB
   CREATE INDEX "DB2ADMIN"."IDX1805212018030" ON "TASKANA "."CLASSIFICATION"
   ("CATEGORY" ASC, "DOMAIN" ASC, "TYPE" ASC, "CUSTOM_1"
   ASC, "CUSTOM_8" ASC, "CUSTOM_7" ASC, "CUSTOM_6" ASC,
   "CUSTOM_5" ASC, "CUSTOM_4" ASC, "CUSTOM_3" ASC, "CUSTOM_2"
   ASC, "APPLICATION_ENTRY_POINT" ASC, "SERVICE_LEVEL"
   ASC, "PRIORITY" ASC, "DESCRIPTION" ASC, "NAME" ASC,
   "CREATED" ASC, "VALID_IN_DOMAIN" ASC, "PARENT_KEY" ASC, "PARENT_ID"
   ASC, "KEY" ASC, "ID" ASC) ALLOW REVERSE SCANS COLLECT SAMPLED DETAILED STATISTICS;
   COMMIT WORK ;
-- index[4],    0,126MB
   CREATE INDEX "DB2ADMIN"."IDX1805212020000" ON "TASKANA "."WORKBASKET_ACCESS_LIST"
   ("ACCESS_ID" ASC, "WORKBASKET_ID" ASC, "PERM_READ"
   ASC) ALLOW REVERSE SCANS COLLECT SAMPLED DETAILED STATISTICS;
   COMMIT WORK ;
-- index[5],    3,356MB
   CREATE INDEX "DB2ADMIN"."IDX1805212021410" ON "TASKANA "."TASK"
   ("POR_VALUE" ASC, "WORKBASKET_ID" ASC) ALLOW REVERSE
   SCANS COLLECT SAMPLED DETAILED STATISTICS;
   COMMIT WORK ;
-- index[6],   15,224MB
   CREATE INDEX "DB2ADMIN"."IDX1805212021430" ON "TASKANA "."ATTACHMENT"
   ("TASK_ID" ASC) ALLOW REVERSE SCANS COLLECT SAMPLED DETAILED STATISTICS;
   COMMIT WORK ;
-- index[7],    2,353MB
   CREATE INDEX "DB2ADMIN"."IDX1805212024540" ON "TASKANA "."ATTACHMENT"
   ("TASK_ID" ASC, "RECEIVED" ASC, "CLASSIFICATION_ID"
   ASC, "CLASSIFICATION_KEY" ASC, "MODIFIED" ASC, "CREATED"
   ASC, "ID" ASC) ALLOW REVERSE SCANS COLLECT SAMPLED DETAILED STATISTICS;
   COMMIT WORK ;
-- index[8],    0,056MB
   CREATE UNIQUE INDEX "DB2ADMIN"."IDX1805212025210"
   ON "TASKANA "."CLASSIFICATION" ("KEY" ASC, "DOMAIN"
   ASC) INCLUDE ("CUSTOM_8", "CUSTOM_7", "CUSTOM_6",
   "CUSTOM_5", "CUSTOM_4", "CUSTOM_3", "CUSTOM_2", "CUSTOM_1",
   "APPLICATION_ENTRY_POINT", "SERVICE_LEVEL", "PRIORITY",
   "DESCRIPTION", "NAME", "CREATED", "VALID_IN_DOMAIN",
   "TYPE", "CATEGORY", "PARENT_KEY", "PARENT_ID", "ID") ALLOW REVERSE
   SCANS COLLECT SAMPLED DETAILED STATISTICS;
   COMMIT WORK ;
-- index[9],    1,056MB
   CREATE UNIQUE INDEX "DB2ADMIN"."IDX1805212028580"
   ON "TASKANA "."WORKBASKET" ("ID" ASC) INCLUDE ("ORG_LEVEL_4",
   "ORG_LEVEL_3", "ORG_LEVEL_2", "ORG_LEVEL_1", "OWNER",
   "DESCRIPTION", "TYPE", "DOMAIN", "NAME", "KEY") ALLOW
   REVERSE SCANS COLLECT SAMPLED DETAILED STATISTICS;
   COMMIT WORK ;
-- index[10],    1,274MB
   CREATE UNIQUE INDEX "DB2ADMIN"."IDX1805212034070"
   ON "TASKANA "."WORKBASKET" ("KEY" ASC, "DOMAIN" ASC)
   INCLUDE ("ORG_LEVEL_4", "ORG_LEVEL_3", "ORG_LEVEL_2",
   "ORG_LEVEL_1", "CUSTOM_4", "CUSTOM_3", "CUSTOM_2",
   "CUSTOM_1", "OWNER", "DESCRIPTION", "TYPE", "NAME",
   "MODIFIED", "CREATED", "ID") ALLOW REVERSE SCANS COLLECT SAMPLED DETAILED STATISTICS;
   COMMIT WORK ;
-- index[11],    0,056MB
   CREATE UNIQUE INDEX "DB2ADMIN"."IDX1805212039070"
   ON "TASKANA "."CLASSIFICATION" ("ID" ASC) INCLUDE
   ("CUSTOM_8", "CUSTOM_7", "CUSTOM_6", "CUSTOM_5", "CUSTOM_4",
   "CUSTOM_3", "CUSTOM_2", "CUSTOM_1", "APPLICATION_ENTRY_POINT",
   "SERVICE_LEVEL", "PRIORITY", "DESCRIPTION", "NAME",
   "MODIFIED", "CREATED", "VALID_IN_DOMAIN", "DOMAIN",
   "TYPE", "CATEGORY", "PARENT_KEY", "PARENT_ID", "KEY") ALLOW REVERSE
   SCANS COLLECT SAMPLED DETAILED STATISTICS;
   COMMIT WORK ;
-- index[12],    0,325MB
   CREATE UNIQUE INDEX "DB2ADMIN"."IDX1805212040470"
   ON "TASKANA "."WORKBASKET" ("KEY" ASC, "DOMAIN" ASC)
   INCLUDE ("ID") ALLOW REVERSE SCANS COLLECT SAMPLED DETAILED STATISTICS;
   COMMIT WORK ;
-- index[13],    0,126MB
   CREATE INDEX "DB2ADMIN"."IDX1805212042430" ON "TASKANA "."WORKBASKET_ACCESS_LIST"
   ("WORKBASKET_ID" ASC, "PERM_CUSTOM_12" ASC, "PERM_CUSTOM_11"
   ASC, "PERM_CUSTOM_10" ASC, "PERM_CUSTOM_9" ASC, "PERM_CUSTOM_8"
   ASC, "PERM_CUSTOM_7" ASC, "PERM_CUSTOM_6" ASC, "PERM_CUSTOM_5"
   ASC, "PERM_CUSTOM_4" ASC, "PERM_CUSTOM_3" ASC, "PERM_CUSTOM_2"
   ASC, "PERM_CUSTOM_1" ASC, "PERM_DISTRIBUTE" ASC, "PERM_TRANSFER"
   ASC, "PERM_APPEND" ASC, "PERM_OPEN" ASC, "PERM_READ"
   ASC, "ACCESS_ID" ASC) ALLOW REVERSE SCANS COLLECT SAMPLED DETAILED STATISTICS;
   COMMIT WORK ;
