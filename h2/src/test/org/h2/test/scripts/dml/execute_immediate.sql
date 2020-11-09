-- Copyright 2004-2019 H2 Group. Multiple-Licensed under the MPL 2.0,
-- and the EPL 1.0 (https://h2database.com/html/license.html).
-- Initial Developer: H2 Group
--

CREATE MEMORY TABLE TEST(ID INT UNIQUE);
> ok

EXECUTE IMMEDIATE 'INSERT INTO TEST VALUES ' || 1;
> update count: 1

EXECUTE IMMEDIATE 'INSERT INTO TEST2 VALUES 1';
> exception TABLE_OR_VIEW_NOT_FOUND_1

EXECUTE IMMEDIATE 'SELECT 1';
> exception SYNTAX_ERROR_2

EXECUTE IMMEDIATE 'ALTER TABLE TEST DROP CONSTRAINT ' ||
    QUOTE_IDENT((SELECT CONSTRAINT_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        WHERE TABLE_SCHEMA = 'PUBLIC' AND TABLE_NAME = 'TEST' AND CONSTRAINT_TYPE = 'UNIQUE'));
> ok

SCRIPT NOPASSWORDS NOSETTINGS;
> SCRIPT
> -------------------------------------------------
> -- 1 +/- SELECT COUNT(*) FROM PUBLIC.TEST;
> CREATE MEMORY TABLE "PUBLIC"."TEST"( "ID" INT );
> CREATE USER IF NOT EXISTS "SA" PASSWORD '' ADMIN;
> INSERT INTO "PUBLIC"."TEST" VALUES (1);
> rows: 4

DROP TABLE TEST;
> ok
