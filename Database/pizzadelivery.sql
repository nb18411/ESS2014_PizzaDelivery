--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "ENG_F05MQD"."ORDERS" 
   (	"USERID" NUMBER, 
	"PIZZAID" NUMBER, 
	"DATEOFORDER" DATE, 
	"ISFINISHED" NUMBER DEFAULT 0
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "HALLGATO" ;
--------------------------------------------------------
--  DDL for Table PIZZA
--------------------------------------------------------

  CREATE TABLE "ENG_F05MQD"."PIZZA" 
   (	"PIZZAID" NUMBER, 
	"NAME" VARCHAR2(20 BYTE), 
	"DESCRIPTION" VARCHAR2(60 BYTE), 
	"PRICE" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "HALLGATO" ;
--------------------------------------------------------
--  DDL for Table SESSIONS
--------------------------------------------------------

  CREATE TABLE "ENG_F05MQD"."SESSIONS" 
   (	"SESSIONID" NUMBER, 
	"USERID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "HALLGATO" ;
--------------------------------------------------------
--  DDL for Table TBLUSER
--------------------------------------------------------

  CREATE TABLE "ENG_F05MQD"."TBLUSER" 
   (	"USERID" NUMBER, 
	"USERNAME" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"SURNAME" VARCHAR2(20 BYTE), 
	"ADDRESS" VARCHAR2(40 BYTE), 
	"PHONE" VARCHAR2(25 BYTE), 
	"TYPE" NUMBER DEFAULT 0
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "HALLGATO" ;
REM INSERTING into ENG_F05MQD.ORDERS
SET DEFINE OFF;
REM INSERTING into ENG_F05MQD.PIZZA
SET DEFINE OFF;
REM INSERTING into ENG_F05MQD.SESSIONS
SET DEFINE OFF;
REM INSERTING into ENG_F05MQD.TBLUSER
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index ORDERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENG_F05MQD"."ORDERS_PK" ON "ENG_F05MQD"."ORDERS" ("USERID", "PIZZAID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "HALLGATO" ;
--------------------------------------------------------
--  DDL for Index PIZZA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENG_F05MQD"."PIZZA_PK" ON "ENG_F05MQD"."PIZZA" ("PIZZAID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "HALLGATO" ;
--------------------------------------------------------
--  DDL for Index TBLUSER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENG_F05MQD"."TBLUSER_PK" ON "ENG_F05MQD"."TBLUSER" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "HALLGATO" ;
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "ENG_F05MQD"."ORDERS" ADD CONSTRAINT "ORDERS_PK" PRIMARY KEY ("USERID", "PIZZAID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "HALLGATO"  ENABLE;
 
  ALTER TABLE "ENG_F05MQD"."ORDERS" MODIFY ("USERID" NOT NULL ENABLE);
 
  ALTER TABLE "ENG_F05MQD"."ORDERS" MODIFY ("PIZZAID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PIZZA
--------------------------------------------------------

  ALTER TABLE "ENG_F05MQD"."PIZZA" ADD CONSTRAINT "PIZZA_PK" PRIMARY KEY ("PIZZAID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "HALLGATO"  ENABLE;
 
  ALTER TABLE "ENG_F05MQD"."PIZZA" MODIFY ("PIZZAID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBLUSER
--------------------------------------------------------

  ALTER TABLE "ENG_F05MQD"."TBLUSER" MODIFY ("USERID" NOT NULL ENABLE);
 
  ALTER TABLE "ENG_F05MQD"."TBLUSER" ADD CONSTRAINT "TBLUSER_PK" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "HALLGATO"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "ENG_F05MQD"."ORDERS" ADD CONSTRAINT "ORDERS_PIZZA_FK1" FOREIGN KEY ("PIZZAID")
	  REFERENCES "ENG_F05MQD"."PIZZA" ("PIZZAID") ENABLE;
 
  ALTER TABLE "ENG_F05MQD"."ORDERS" ADD CONSTRAINT "ORDERS_TBLUSER_FK1" FOREIGN KEY ("USERID")
	  REFERENCES "ENG_F05MQD"."TBLUSER" ("USERID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SESSIONS
--------------------------------------------------------

  ALTER TABLE "ENG_F05MQD"."SESSIONS" ADD CONSTRAINT "SESSIONS_TBLUSER_FK1" FOREIGN KEY ("USERID")
	  REFERENCES "ENG_F05MQD"."TBLUSER" ("USERID") ENABLE;
