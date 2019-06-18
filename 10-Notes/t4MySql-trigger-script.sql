/* 
 Audit Triggers Script
     generated on 2019 Mar 18 @ 14:11:15.940
     for Schema 'T4MY_SAMPLE'
     by Triggers for MySQL v0.1.0
     (t4my.Triggers.TriggersScript)
*/ 
CREATE TABLE IF NOT EXISTS AUDIT_TRAIL (
  ID INT NOT NULL AUTO_INCREMENT,
  TABLENAME VARCHAR(24),
  ACTION VARCHAR(45),
  ADD_ON  timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PAYLOAD_JSON JSON,
  PRIMARY KEY (ID));
/*
    Triggers for Table AUDIT_TRAIL
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_AUDIT_TRAIL_U;
DROP TRIGGER IF EXISTS TR_AUDIT_TRAIL_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_AUDIT_TRAIL_U
	before update
	on AUDIT_TRAIL
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "AUDIT_TRAIL"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'ID', old.ID
                    , 'TABLENAME', old.TABLENAME
                    , 'ACTION', old.ACTION
                    , 'ADD_ON', old.ADD_ON
                    , 'PAYLOAD_JSON', old.PAYLOAD_JSON
                    )
            , "NEW", JSON_OBJECT(
                      'ID', new.ID
                    , 'TABLENAME', new.TABLENAME
                    , 'ACTION', new.ACTION
                    , 'ADD_ON', new.ADD_ON
                    , 'PAYLOAD_JSON', new.PAYLOAD_JSON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('AUDIT_TRAIL', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_AUDIT_TRAIL_D
	before delete
	on AUDIT_TRAIL
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "AUDIT_TRAIL"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'ID', old.ID
                    , 'TABLENAME', old.TABLENAME
                    , 'ACTION', old.ACTION
                    , 'ADD_ON', old.ADD_ON
                    , 'PAYLOAD_JSON', old.PAYLOAD_JSON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('AUDIT_TRAIL', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table A_DB_INFO
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_A_DB_INFO_U;
DROP TRIGGER IF EXISTS TR_A_DB_INFO_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_A_DB_INFO_U
	before update
	on A_DB_INFO
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "A_DB_INFO"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'ID', old.ID
                    , 'VERSION', old.VERSION
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'ID', new.ID
                    , 'VERSION', new.VERSION
                    , 'NOTE', new.NOTE
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('A_DB_INFO', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_A_DB_INFO_D
	before delete
	on A_DB_INFO
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "A_DB_INFO"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'ID', old.ID
                    , 'VERSION', old.VERSION
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('A_DB_INFO', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table DD_CATEGORIES
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_DD_CATEGORIES_U;
DROP TRIGGER IF EXISTS TR_DD_CATEGORIES_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_DD_CATEGORIES_U
	before update
	on DD_CATEGORIES
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "DD_CATEGORIES"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'DDI_CATG_ID', old.DDI_CATG_ID
                    , 'DDI_CATG_NAME', old.DDI_CATG_NAME
                    , 'DDI_CATG_DESC', old.DDI_CATG_DESC
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'DDI_CATG_ID', new.DDI_CATG_ID
                    , 'DDI_CATG_NAME', new.DDI_CATG_NAME
                    , 'DDI_CATG_DESC', new.DDI_CATG_DESC
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('DD_CATEGORIES', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_DD_CATEGORIES_D
	before delete
	on DD_CATEGORIES
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "DD_CATEGORIES"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'DDI_CATG_ID', old.DDI_CATG_ID
                    , 'DDI_CATG_NAME', old.DDI_CATG_NAME
                    , 'DDI_CATG_DESC', old.DDI_CATG_DESC
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('DD_CATEGORIES', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table DD_ITEMS
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_DD_ITEMS_U;
DROP TRIGGER IF EXISTS TR_DD_ITEMS_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_DD_ITEMS_U
	before update
	on DD_ITEMS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "DD_ITEMS"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'DDI_CATG_ID', old.DDI_CATG_ID
                    , 'DDI_CODE', old.DDI_CODE
                    , 'DDI_DISP_SEQ', old.DDI_DISP_SEQ
                    , 'DDI_CODE_TXT', old.DDI_CODE_TXT
                    , 'DDI_TEXT', old.DDI_TEXT
                    , 'DDI_DISP_TEXT', old.DDI_DISP_TEXT
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'DDI_CATG_ID', new.DDI_CATG_ID
                    , 'DDI_CODE', new.DDI_CODE
                    , 'DDI_DISP_SEQ', new.DDI_DISP_SEQ
                    , 'DDI_CODE_TXT', new.DDI_CODE_TXT
                    , 'DDI_TEXT', new.DDI_TEXT
                    , 'DDI_DISP_TEXT', new.DDI_DISP_TEXT
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('DD_ITEMS', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_DD_ITEMS_D
	before delete
	on DD_ITEMS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "DD_ITEMS"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'DDI_CATG_ID', old.DDI_CATG_ID
                    , 'DDI_CODE', old.DDI_CODE
                    , 'DDI_DISP_SEQ', old.DDI_DISP_SEQ
                    , 'DDI_CODE_TXT', old.DDI_CODE_TXT
                    , 'DDI_TEXT', old.DDI_TEXT
                    , 'DDI_DISP_TEXT', old.DDI_DISP_TEXT
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('DD_ITEMS', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table DD_TAGS
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_DD_TAGS_U;
DROP TRIGGER IF EXISTS TR_DD_TAGS_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_DD_TAGS_U
	before update
	on DD_TAGS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "DD_TAGS"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'DDT_TAG_ID', old.DDT_TAG_ID
                    , 'DDT_TAG_GRP_ID', old.DDT_TAG_GRP_ID
                    , 'DDT_DISP_SEQ', old.DDT_DISP_SEQ
                    , 'DDT_DISP_TEXT', old.DDT_DISP_TEXT
                    , 'DDT_NOTE', old.DDT_NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'DDT_TAG_ID', new.DDT_TAG_ID
                    , 'DDT_TAG_GRP_ID', new.DDT_TAG_GRP_ID
                    , 'DDT_DISP_SEQ', new.DDT_DISP_SEQ
                    , 'DDT_DISP_TEXT', new.DDT_DISP_TEXT
                    , 'DDT_NOTE', new.DDT_NOTE
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('DD_TAGS', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_DD_TAGS_D
	before delete
	on DD_TAGS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "DD_TAGS"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'DDT_TAG_ID', old.DDT_TAG_ID
                    , 'DDT_TAG_GRP_ID', old.DDT_TAG_GRP_ID
                    , 'DDT_DISP_SEQ', old.DDT_DISP_SEQ
                    , 'DDT_DISP_TEXT', old.DDT_DISP_TEXT
                    , 'DDT_NOTE', old.DDT_NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('DD_TAGS', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table DD_TAG_GROUPS
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_DD_TAG_GROUPS_U;
DROP TRIGGER IF EXISTS TR_DD_TAG_GROUPS_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_DD_TAG_GROUPS_U
	before update
	on DD_TAG_GROUPS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "DD_TAG_GROUPS"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'DDT_TAG_GRP_ID', old.DDT_TAG_GRP_ID
                    , 'DDT_TAG_GRP_NAME', old.DDT_TAG_GRP_NAME
                    , 'DDT_TAG_GRP_DESC', old.DDT_TAG_GRP_DESC
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'DDT_TAG_GRP_ID', new.DDT_TAG_GRP_ID
                    , 'DDT_TAG_GRP_NAME', new.DDT_TAG_GRP_NAME
                    , 'DDT_TAG_GRP_DESC', new.DDT_TAG_GRP_DESC
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('DD_TAG_GROUPS', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_DD_TAG_GROUPS_D
	before delete
	on DD_TAG_GROUPS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "DD_TAG_GROUPS"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'DDT_TAG_GRP_ID', old.DDT_TAG_GRP_ID
                    , 'DDT_TAG_GRP_NAME', old.DDT_TAG_GRP_NAME
                    , 'DDT_TAG_GRP_DESC', old.DDT_TAG_GRP_DESC
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('DD_TAG_GROUPS', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table GEN_APP_SETTINGS
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_GEN_APP_SETTINGS_U;
DROP TRIGGER IF EXISTS TR_GEN_APP_SETTINGS_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_GEN_APP_SETTINGS_U
	before update
	on GEN_APP_SETTINGS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GEN_APP_SETTINGS"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'VER', old.VER
                    , 'APP_SETTINGS', old.APP_SETTINGS
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'VER', new.VER
                    , 'APP_SETTINGS', new.APP_SETTINGS
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GEN_APP_SETTINGS', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_GEN_APP_SETTINGS_D
	before delete
	on GEN_APP_SETTINGS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GEN_APP_SETTINGS"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'VER', old.VER
                    , 'APP_SETTINGS', old.APP_SETTINGS
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GEN_APP_SETTINGS', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table GEN_TEMPLATES
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_GEN_TEMPLATES_U;
DROP TRIGGER IF EXISTS TR_GEN_TEMPLATES_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_GEN_TEMPLATES_U
	before update
	on GEN_TEMPLATES
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GEN_TEMPLATES"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'TEMPLATE_ID', old.TEMPLATE_ID
                    , 'TEMPLATE_TYPE', old.TEMPLATE_TYPE
                    , 'DISP_SEQ', old.DISP_SEQ
                    , 'TEMPLATE_NAME', old.TEMPLATE_NAME
                    , 'TEMPLATE_BODY', old.TEMPLATE_BODY
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'TEMPLATE_ID', new.TEMPLATE_ID
                    , 'TEMPLATE_TYPE', new.TEMPLATE_TYPE
                    , 'DISP_SEQ', new.DISP_SEQ
                    , 'TEMPLATE_NAME', new.TEMPLATE_NAME
                    , 'TEMPLATE_BODY', new.TEMPLATE_BODY
                    , 'NOTE', new.NOTE
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GEN_TEMPLATES', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_GEN_TEMPLATES_D
	before delete
	on GEN_TEMPLATES
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GEN_TEMPLATES"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'TEMPLATE_ID', old.TEMPLATE_ID
                    , 'TEMPLATE_TYPE', old.TEMPLATE_TYPE
                    , 'DISP_SEQ', old.DISP_SEQ
                    , 'TEMPLATE_NAME', old.TEMPLATE_NAME
                    , 'TEMPLATE_BODY', old.TEMPLATE_BODY
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GEN_TEMPLATES', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table GEN_USERS
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_GEN_USERS_U;
DROP TRIGGER IF EXISTS TR_GEN_USERS_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_GEN_USERS_U
	before update
	on GEN_USERS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GEN_USERS"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'USERID', old.USERID
                    , 'USER_NAME', old.USER_NAME
                    , 'ROLE', old.ROLE
                    , 'MOBILE', old.MOBILE
                    , 'EMAIL', old.EMAIL
                    , 'FULL_NAME', old.FULL_NAME
                    , 'PASSWORD', old.PASSWORD
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'USERID', new.USERID
                    , 'USER_NAME', new.USER_NAME
                    , 'ROLE', new.ROLE
                    , 'MOBILE', new.MOBILE
                    , 'EMAIL', new.EMAIL
                    , 'FULL_NAME', new.FULL_NAME
                    , 'PASSWORD', new.PASSWORD
                    , 'NOTE', new.NOTE
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GEN_USERS', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_GEN_USERS_D
	before delete
	on GEN_USERS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GEN_USERS"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'USERID', old.USERID
                    , 'USER_NAME', old.USER_NAME
                    , 'ROLE', old.ROLE
                    , 'MOBILE', old.MOBILE
                    , 'EMAIL', old.EMAIL
                    , 'FULL_NAME', old.FULL_NAME
                    , 'PASSWORD', old.PASSWORD
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GEN_USERS', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table GT_TRANSPORT
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_GT_TRANSPORT_U;
DROP TRIGGER IF EXISTS TR_GT_TRANSPORT_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_GT_TRANSPORT_U
	before update
	on GT_TRANSPORT
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GT_TRANSPORT"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'TRANSPORT_ID', old.TRANSPORT_ID
                    , 'TYPE', old.TYPE
                    , 'START_TIME', old.START_TIME
                    , 'END_TIME', old.END_TIME
                    , 'ORIGIN', old.ORIGIN
                    , 'DESTINATION', old.DESTINATION
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'TRANSPORT_ID', new.TRANSPORT_ID
                    , 'TYPE', new.TYPE
                    , 'START_TIME', new.START_TIME
                    , 'END_TIME', new.END_TIME
                    , 'ORIGIN', new.ORIGIN
                    , 'DESTINATION', new.DESTINATION
                    , 'NOTE', new.NOTE
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GT_TRANSPORT', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_GT_TRANSPORT_D
	before delete
	on GT_TRANSPORT
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GT_TRANSPORT"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'TRANSPORT_ID', old.TRANSPORT_ID
                    , 'TYPE', old.TYPE
                    , 'START_TIME', old.START_TIME
                    , 'END_TIME', old.END_TIME
                    , 'ORIGIN', old.ORIGIN
                    , 'DESTINATION', old.DESTINATION
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GT_TRANSPORT', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table GT_TRANSPORT_GUEST_MAP
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_GT_TRANSPORT_GUEST_MAP_U;
DROP TRIGGER IF EXISTS TR_GT_TRANSPORT_GUEST_MAP_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_GT_TRANSPORT_GUEST_MAP_U
	before update
	on GT_TRANSPORT_GUEST_MAP
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GT_TRANSPORT_GUEST_MAP"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'TRANSPORT_ID', old.TRANSPORT_ID
                    , 'PARTY_ID', old.PARTY_ID
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'TRANSPORT_ID', new.TRANSPORT_ID
                    , 'PARTY_ID', new.PARTY_ID
                    , 'NOTE', new.NOTE
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GT_TRANSPORT_GUEST_MAP', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_GT_TRANSPORT_GUEST_MAP_D
	before delete
	on GT_TRANSPORT_GUEST_MAP
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GT_TRANSPORT_GUEST_MAP"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'TRANSPORT_ID', old.TRANSPORT_ID
                    , 'PARTY_ID', old.PARTY_ID
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GT_TRANSPORT_GUEST_MAP', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table GUESTS
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_GUESTS_U;
DROP TRIGGER IF EXISTS TR_GUESTS_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_GUESTS_U
	before update
	on GUESTS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GUESTS"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'GUEST_ID', old.GUEST_ID
                    , 'GUEST_CODE', old.GUEST_CODE
                    , 'FULL_NAME', old.FULL_NAME
                    , 'MOBILE', old.MOBILE
                    , 'EMAIL', old.EMAIL
                    , 'NICK_NAME', old.NICK_NAME
                    , 'PRIMARY_GUEST', old.PRIMARY_GUEST
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'GUEST_ID', new.GUEST_ID
                    , 'GUEST_CODE', new.GUEST_CODE
                    , 'FULL_NAME', new.FULL_NAME
                    , 'MOBILE', new.MOBILE
                    , 'EMAIL', new.EMAIL
                    , 'NICK_NAME', new.NICK_NAME
                    , 'PRIMARY_GUEST', new.PRIMARY_GUEST
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GUESTS', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_GUESTS_D
	before delete
	on GUESTS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GUESTS"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'GUEST_ID', old.GUEST_ID
                    , 'GUEST_CODE', old.GUEST_CODE
                    , 'FULL_NAME', old.FULL_NAME
                    , 'MOBILE', old.MOBILE
                    , 'EMAIL', old.EMAIL
                    , 'NICK_NAME', old.NICK_NAME
                    , 'PRIMARY_GUEST', old.PRIMARY_GUEST
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GUESTS', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table GUEST_DATA
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_GUEST_DATA_U;
DROP TRIGGER IF EXISTS TR_GUEST_DATA_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_GUEST_DATA_U
	before update
	on GUEST_DATA
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GUEST_DATA"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'GUEST_ID', old.GUEST_ID
                    , 'CREATE_TIME', old.CREATE_TIME
                    , 'FULL_NAME', old.FULL_NAME
                    , 'FIRST_NAME', old.FIRST_NAME
                    , 'LAST_NAME', old.LAST_NAME
                    , 'INDUSTRY', old.INDUSTRY
                    , 'LOCATION', old.LOCATION
                    , 'COMPANY1', old.COMPANY1
                    , 'DEPARTMENT1', old.DEPARTMENT1
                    , 'TITLE1', old.TITLE1
                    , 'COMPANY2', old.COMPANY2
                    , 'DEPARTMENT2', old.DEPARTMENT2
                    , 'TITLE2', old.TITLE2
                    , 'COMPANY_OTHERS', old.COMPANY_OTHERS
                    , 'DEPARTMENT_OTHERS', old.DEPARTMENT_OTHERS
                    , 'TITLE_OTHERS', old.TITLE_OTHERS
                    , 'MOBILE1', old.MOBILE1
                    , 'MOBILE2', old.MOBILE2
                    , 'MOBILE_OTHERS', old.MOBILE_OTHERS
                    , 'TELEPHONE1', old.TELEPHONE1
                    , 'TELEPHONE2', old.TELEPHONE2
                    , 'TELEPHONE_OTHERS', old.TELEPHONE_OTHERS
                    , 'FAX1', old.FAX1
                    , 'FAX2', old.FAX2
                    , 'FAX_OTHERS', old.FAX_OTHERS
                    , 'EMAIL1', old.EMAIL1
                    , 'EMAIL2', old.EMAIL2
                    , 'EMAIL_OTHERS', old.EMAIL_OTHERS
                    , 'ADDRESS1_COUNTRY', old.ADDRESS1_COUNTRY
                    , 'ADDRESS1_STATE', old.ADDRESS1_STATE
                    , 'ADDRESS1_CITY', old.ADDRESS1_CITY
                    , 'ADDRESS1_STREET1', old.ADDRESS1_STREET1
                    , 'ADDRESS1_STREET2', old.ADDRESS1_STREET2
                    , 'ADDRESS1_ZIP', old.ADDRESS1_ZIP
                    , 'ADDRESS2_COUNTRY', old.ADDRESS2_COUNTRY
                    , 'ADDRESS2_STATE', old.ADDRESS2_STATE
                    , 'ADDRESS2_CITY', old.ADDRESS2_CITY
                    , 'ADDRESS2_STREET1', old.ADDRESS2_STREET1
                    , 'ADDRESS2_STREET2', old.ADDRESS2_STREET2
                    , 'ADDRESS2_ZIP', old.ADDRESS2_ZIP
                    , 'ADDRESS_OTHERS', old.ADDRESS_OTHERS
                    , 'WEB_PAGE', old.WEB_PAGE
                    , 'INSTANT_MESSAGE', old.INSTANT_MESSAGE
                    , 'SNS_ACCOUNT', old.SNS_ACCOUNT
                    , 'BIRTHDAY', old.BIRTHDAY
                    , 'ANNIVERSARY', old.ANNIVERSARY
                    , 'GROUP', old.GROUP
                    , 'NICKNAME', old.NICKNAME
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'GUEST_ID', new.GUEST_ID
                    , 'CREATE_TIME', new.CREATE_TIME
                    , 'FULL_NAME', new.FULL_NAME
                    , 'FIRST_NAME', new.FIRST_NAME
                    , 'LAST_NAME', new.LAST_NAME
                    , 'INDUSTRY', new.INDUSTRY
                    , 'LOCATION', new.LOCATION
                    , 'COMPANY1', new.COMPANY1
                    , 'DEPARTMENT1', new.DEPARTMENT1
                    , 'TITLE1', new.TITLE1
                    , 'COMPANY2', new.COMPANY2
                    , 'DEPARTMENT2', new.DEPARTMENT2
                    , 'TITLE2', new.TITLE2
                    , 'COMPANY_OTHERS', new.COMPANY_OTHERS
                    , 'DEPARTMENT_OTHERS', new.DEPARTMENT_OTHERS
                    , 'TITLE_OTHERS', new.TITLE_OTHERS
                    , 'MOBILE1', new.MOBILE1
                    , 'MOBILE2', new.MOBILE2
                    , 'MOBILE_OTHERS', new.MOBILE_OTHERS
                    , 'TELEPHONE1', new.TELEPHONE1
                    , 'TELEPHONE2', new.TELEPHONE2
                    , 'TELEPHONE_OTHERS', new.TELEPHONE_OTHERS
                    , 'FAX1', new.FAX1
                    , 'FAX2', new.FAX2
                    , 'FAX_OTHERS', new.FAX_OTHERS
                    , 'EMAIL1', new.EMAIL1
                    , 'EMAIL2', new.EMAIL2
                    , 'EMAIL_OTHERS', new.EMAIL_OTHERS
                    , 'ADDRESS1_COUNTRY', new.ADDRESS1_COUNTRY
                    , 'ADDRESS1_STATE', new.ADDRESS1_STATE
                    , 'ADDRESS1_CITY', new.ADDRESS1_CITY
                    , 'ADDRESS1_STREET1', new.ADDRESS1_STREET1
                    , 'ADDRESS1_STREET2', new.ADDRESS1_STREET2
                    , 'ADDRESS1_ZIP', new.ADDRESS1_ZIP
                    , 'ADDRESS2_COUNTRY', new.ADDRESS2_COUNTRY
                    , 'ADDRESS2_STATE', new.ADDRESS2_STATE
                    , 'ADDRESS2_CITY', new.ADDRESS2_CITY
                    , 'ADDRESS2_STREET1', new.ADDRESS2_STREET1
                    , 'ADDRESS2_STREET2', new.ADDRESS2_STREET2
                    , 'ADDRESS2_ZIP', new.ADDRESS2_ZIP
                    , 'ADDRESS_OTHERS', new.ADDRESS_OTHERS
                    , 'WEB_PAGE', new.WEB_PAGE
                    , 'INSTANT_MESSAGE', new.INSTANT_MESSAGE
                    , 'SNS_ACCOUNT', new.SNS_ACCOUNT
                    , 'BIRTHDAY', new.BIRTHDAY
                    , 'ANNIVERSARY', new.ANNIVERSARY
                    , 'GROUP', new.GROUP
                    , 'NICKNAME', new.NICKNAME
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GUEST_DATA', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_GUEST_DATA_D
	before delete
	on GUEST_DATA
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GUEST_DATA"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'GUEST_ID', old.GUEST_ID
                    , 'CREATE_TIME', old.CREATE_TIME
                    , 'FULL_NAME', old.FULL_NAME
                    , 'FIRST_NAME', old.FIRST_NAME
                    , 'LAST_NAME', old.LAST_NAME
                    , 'INDUSTRY', old.INDUSTRY
                    , 'LOCATION', old.LOCATION
                    , 'COMPANY1', old.COMPANY1
                    , 'DEPARTMENT1', old.DEPARTMENT1
                    , 'TITLE1', old.TITLE1
                    , 'COMPANY2', old.COMPANY2
                    , 'DEPARTMENT2', old.DEPARTMENT2
                    , 'TITLE2', old.TITLE2
                    , 'COMPANY_OTHERS', old.COMPANY_OTHERS
                    , 'DEPARTMENT_OTHERS', old.DEPARTMENT_OTHERS
                    , 'TITLE_OTHERS', old.TITLE_OTHERS
                    , 'MOBILE1', old.MOBILE1
                    , 'MOBILE2', old.MOBILE2
                    , 'MOBILE_OTHERS', old.MOBILE_OTHERS
                    , 'TELEPHONE1', old.TELEPHONE1
                    , 'TELEPHONE2', old.TELEPHONE2
                    , 'TELEPHONE_OTHERS', old.TELEPHONE_OTHERS
                    , 'FAX1', old.FAX1
                    , 'FAX2', old.FAX2
                    , 'FAX_OTHERS', old.FAX_OTHERS
                    , 'EMAIL1', old.EMAIL1
                    , 'EMAIL2', old.EMAIL2
                    , 'EMAIL_OTHERS', old.EMAIL_OTHERS
                    , 'ADDRESS1_COUNTRY', old.ADDRESS1_COUNTRY
                    , 'ADDRESS1_STATE', old.ADDRESS1_STATE
                    , 'ADDRESS1_CITY', old.ADDRESS1_CITY
                    , 'ADDRESS1_STREET1', old.ADDRESS1_STREET1
                    , 'ADDRESS1_STREET2', old.ADDRESS1_STREET2
                    , 'ADDRESS1_ZIP', old.ADDRESS1_ZIP
                    , 'ADDRESS2_COUNTRY', old.ADDRESS2_COUNTRY
                    , 'ADDRESS2_STATE', old.ADDRESS2_STATE
                    , 'ADDRESS2_CITY', old.ADDRESS2_CITY
                    , 'ADDRESS2_STREET1', old.ADDRESS2_STREET1
                    , 'ADDRESS2_STREET2', old.ADDRESS2_STREET2
                    , 'ADDRESS2_ZIP', old.ADDRESS2_ZIP
                    , 'ADDRESS_OTHERS', old.ADDRESS_OTHERS
                    , 'WEB_PAGE', old.WEB_PAGE
                    , 'INSTANT_MESSAGE', old.INSTANT_MESSAGE
                    , 'SNS_ACCOUNT', old.SNS_ACCOUNT
                    , 'BIRTHDAY', old.BIRTHDAY
                    , 'ANNIVERSARY', old.ANNIVERSARY
                    , 'GROUP', old.GROUP
                    , 'NICKNAME', old.NICKNAME
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GUEST_DATA', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table GUEST_DATA_NOTES
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_GUEST_DATA_NOTES_U;
DROP TRIGGER IF EXISTS TR_GUEST_DATA_NOTES_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_GUEST_DATA_NOTES_U
	before update
	on GUEST_DATA_NOTES
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GUEST_DATA_NOTES"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'GUEST_ID', old.GUEST_ID
                    , 'NOTE1', old.NOTE1
                    , 'NOTE2', old.NOTE2
                    , 'NOTE3', old.NOTE3
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'GUEST_ID', new.GUEST_ID
                    , 'NOTE1', new.NOTE1
                    , 'NOTE2', new.NOTE2
                    , 'NOTE3', new.NOTE3
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GUEST_DATA_NOTES', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_GUEST_DATA_NOTES_D
	before delete
	on GUEST_DATA_NOTES
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GUEST_DATA_NOTES"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'GUEST_ID', old.GUEST_ID
                    , 'NOTE1', old.NOTE1
                    , 'NOTE2', old.NOTE2
                    , 'NOTE3', old.NOTE3
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GUEST_DATA_NOTES', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table GUEST_NOTES
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_GUEST_NOTES_U;
DROP TRIGGER IF EXISTS TR_GUEST_NOTES_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_GUEST_NOTES_U
	before update
	on GUEST_NOTES
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GUEST_NOTES"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'NOTE_ID', old.NOTE_ID
                    , 'GUEST_ID', old.GUEST_ID
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'NOTE_ID', new.NOTE_ID
                    , 'GUEST_ID', new.GUEST_ID
                    , 'NOTE', new.NOTE
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GUEST_NOTES', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_GUEST_NOTES_D
	before delete
	on GUEST_NOTES
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GUEST_NOTES"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'NOTE_ID', old.NOTE_ID
                    , 'GUEST_ID', old.GUEST_ID
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GUEST_NOTES', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table GUEST_PARTY_MEMBERS
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_GUEST_PARTY_MEMBERS_U;
DROP TRIGGER IF EXISTS TR_GUEST_PARTY_MEMBERS_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_GUEST_PARTY_MEMBERS_U
	before update
	on GUEST_PARTY_MEMBERS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GUEST_PARTY_MEMBERS"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'PARTY_ID', old.PARTY_ID
                    , 'GUEST_ID', old.GUEST_ID
                    , 'PARTY_SEQ', old.PARTY_SEQ
                    , 'PARTY_TYPE', old.PARTY_TYPE
                    , 'FULL_NAME', old.FULL_NAME
                    , 'GENDER', old.GENDER
                    , 'CUISINE_PREF', old.CUISINE_PREF
                    , 'EMAIL', old.EMAIL
                    , 'MOBILE', old.MOBILE
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'PARTY_ID', new.PARTY_ID
                    , 'GUEST_ID', new.GUEST_ID
                    , 'PARTY_SEQ', new.PARTY_SEQ
                    , 'PARTY_TYPE', new.PARTY_TYPE
                    , 'FULL_NAME', new.FULL_NAME
                    , 'GENDER', new.GENDER
                    , 'CUISINE_PREF', new.CUISINE_PREF
                    , 'EMAIL', new.EMAIL
                    , 'MOBILE', new.MOBILE
                    , 'NOTE', new.NOTE
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GUEST_PARTY_MEMBERS', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_GUEST_PARTY_MEMBERS_D
	before delete
	on GUEST_PARTY_MEMBERS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GUEST_PARTY_MEMBERS"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'PARTY_ID', old.PARTY_ID
                    , 'GUEST_ID', old.GUEST_ID
                    , 'PARTY_SEQ', old.PARTY_SEQ
                    , 'PARTY_TYPE', old.PARTY_TYPE
                    , 'FULL_NAME', old.FULL_NAME
                    , 'GENDER', old.GENDER
                    , 'CUISINE_PREF', old.CUISINE_PREF
                    , 'EMAIL', old.EMAIL
                    , 'MOBILE', old.MOBILE
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GUEST_PARTY_MEMBERS', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table GUEST_TAG_MAP
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_GUEST_TAG_MAP_U;
DROP TRIGGER IF EXISTS TR_GUEST_TAG_MAP_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_GUEST_TAG_MAP_U
	before update
	on GUEST_TAG_MAP
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GUEST_TAG_MAP"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'GUEST_ID', old.GUEST_ID
                    , 'DDT_TAG_ID', old.DDT_TAG_ID
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'GUEST_ID', new.GUEST_ID
                    , 'DDT_TAG_ID', new.DDT_TAG_ID
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GUEST_TAG_MAP', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_GUEST_TAG_MAP_D
	before delete
	on GUEST_TAG_MAP
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "GUEST_TAG_MAP"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'GUEST_ID', old.GUEST_ID
                    , 'DDT_TAG_ID', old.DDT_TAG_ID
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('GUEST_TAG_MAP', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table MAINT_MESG_LOG
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_MAINT_MESG_LOG_U;
DROP TRIGGER IF EXISTS TR_MAINT_MESG_LOG_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_MAINT_MESG_LOG_U
	before update
	on MAINT_MESG_LOG
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "MAINT_MESG_LOG"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'MESG_ID', old.MESG_ID
                    , 'PARTY_ID', old.PARTY_ID
                    , 'GUEST_ID', old.GUEST_ID
                    , 'MESG_TYPE', old.MESG_TYPE
                    , 'MESG_BODY', old.MESG_BODY
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'MESG_ID', new.MESG_ID
                    , 'PARTY_ID', new.PARTY_ID
                    , 'GUEST_ID', new.GUEST_ID
                    , 'MESG_TYPE', new.MESG_TYPE
                    , 'MESG_BODY', new.MESG_BODY
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('MAINT_MESG_LOG', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_MAINT_MESG_LOG_D
	before delete
	on MAINT_MESG_LOG
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "MAINT_MESG_LOG"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'MESG_ID', old.MESG_ID
                    , 'PARTY_ID', old.PARTY_ID
                    , 'GUEST_ID', old.GUEST_ID
                    , 'MESG_TYPE', old.MESG_TYPE
                    , 'MESG_BODY', old.MESG_BODY
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('MAINT_MESG_LOG', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table MAINT_RSVP_UPDATE_LOG
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_MAINT_RSVP_UPDATE_LOG_U;
DROP TRIGGER IF EXISTS TR_MAINT_RSVP_UPDATE_LOG_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_MAINT_RSVP_UPDATE_LOG_U
	before update
	on MAINT_RSVP_UPDATE_LOG
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "MAINT_RSVP_UPDATE_LOG"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'UPDATE_ID', old.UPDATE_ID
                    , 'GUEST_ID', old.GUEST_ID
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'UPDATE_ID', new.UPDATE_ID
                    , 'GUEST_ID', new.GUEST_ID
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('MAINT_RSVP_UPDATE_LOG', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_MAINT_RSVP_UPDATE_LOG_D
	before delete
	on MAINT_RSVP_UPDATE_LOG
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "MAINT_RSVP_UPDATE_LOG"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'UPDATE_ID', old.UPDATE_ID
                    , 'GUEST_ID', old.GUEST_ID
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('MAINT_RSVP_UPDATE_LOG', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table MAINT_SESSIONS
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_MAINT_SESSIONS_U;
DROP TRIGGER IF EXISTS TR_MAINT_SESSIONS_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_MAINT_SESSIONS_U
	before update
	on MAINT_SESSIONS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "MAINT_SESSIONS"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'SESS_ID', old.SESS_ID
                    , 'USERID', old.USERID
                    , 'SESS_TOKEN', old.SESS_TOKEN
                    , 'SESS_START', old.SESS_START
                    , 'SESS_END', old.SESS_END
                    , 'SESS_END_MODE', old.SESS_END_MODE
                    , 'CLIENT_IP', old.CLIENT_IP
                    , 'REFERRER', old.REFERRER
                    , 'SESS_PAYLOAD', old.SESS_PAYLOAD
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'SESS_ID', new.SESS_ID
                    , 'USERID', new.USERID
                    , 'SESS_TOKEN', new.SESS_TOKEN
                    , 'SESS_START', new.SESS_START
                    , 'SESS_END', new.SESS_END
                    , 'SESS_END_MODE', new.SESS_END_MODE
                    , 'CLIENT_IP', new.CLIENT_IP
                    , 'REFERRER', new.REFERRER
                    , 'SESS_PAYLOAD', new.SESS_PAYLOAD
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('MAINT_SESSIONS', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_MAINT_SESSIONS_D
	before delete
	on MAINT_SESSIONS
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "MAINT_SESSIONS"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'SESS_ID', old.SESS_ID
                    , 'USERID', old.USERID
                    , 'SESS_TOKEN', old.SESS_TOKEN
                    , 'SESS_START', old.SESS_START
                    , 'SESS_END', old.SESS_END
                    , 'SESS_END_MODE', old.SESS_END_MODE
                    , 'CLIENT_IP', old.CLIENT_IP
                    , 'REFERRER', old.REFERRER
                    , 'SESS_PAYLOAD', old.SESS_PAYLOAD
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('MAINT_SESSIONS', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table MAINT_SESSION_LOG
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_MAINT_SESSION_LOG_U;
DROP TRIGGER IF EXISTS TR_MAINT_SESSION_LOG_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_MAINT_SESSION_LOG_U
	before update
	on MAINT_SESSION_LOG
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "MAINT_SESSION_LOG"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'LOG_ID', old.LOG_ID
                    )
            , "NEW", JSON_OBJECT(
                      'LOG_ID', new.LOG_ID
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('MAINT_SESSION_LOG', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_MAINT_SESSION_LOG_D
	before delete
	on MAINT_SESSION_LOG
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "MAINT_SESSION_LOG"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'LOG_ID', old.LOG_ID
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('MAINT_SESSION_LOG', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table MAINT_SYSTEM_LOG
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_MAINT_SYSTEM_LOG_U;
DROP TRIGGER IF EXISTS TR_MAINT_SYSTEM_LOG_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_MAINT_SYSTEM_LOG_U
	before update
	on MAINT_SYSTEM_LOG
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "MAINT_SYSTEM_LOG"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'LOG_ID', old.LOG_ID
                    )
            , "NEW", JSON_OBJECT(
                      'LOG_ID', new.LOG_ID
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('MAINT_SYSTEM_LOG', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_MAINT_SYSTEM_LOG_D
	before delete
	on MAINT_SYSTEM_LOG
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "MAINT_SYSTEM_LOG"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'LOG_ID', old.LOG_ID
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('MAINT_SYSTEM_LOG', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table PARTY_TAG_MAP
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_PARTY_TAG_MAP_U;
DROP TRIGGER IF EXISTS TR_PARTY_TAG_MAP_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_PARTY_TAG_MAP_U
	before update
	on PARTY_TAG_MAP
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "PARTY_TAG_MAP"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'PARTY_ID', old.PARTY_ID
                    , 'GUEST_ID', old.GUEST_ID
                    , 'DDT_TAG_ID', old.DDT_TAG_ID
                    , 'DDT_TAG_GRP_ID', old.DDT_TAG_GRP_ID
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'PARTY_ID', new.PARTY_ID
                    , 'GUEST_ID', new.GUEST_ID
                    , 'DDT_TAG_ID', new.DDT_TAG_ID
                    , 'DDT_TAG_GRP_ID', new.DDT_TAG_GRP_ID
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('PARTY_TAG_MAP', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_PARTY_TAG_MAP_D
	before delete
	on PARTY_TAG_MAP
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "PARTY_TAG_MAP"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'PARTY_ID', old.PARTY_ID
                    , 'GUEST_ID', old.GUEST_ID
                    , 'DDT_TAG_ID', old.DDT_TAG_ID
                    , 'DDT_TAG_GRP_ID', old.DDT_TAG_GRP_ID
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('PARTY_TAG_MAP', 'DELETE', @updateundle);
    end##
delimiter ;
/*
    Triggers for Table RSVP_RESPONSE
*/
-- NOTE: INSERT trigger not required, data will exist in table.
-- Cleanup existing triggers, if any
DROP TRIGGER IF EXISTS TR_RSVP_RESPONSE_U;
DROP TRIGGER IF EXISTS TR_RSVP_RESPONSE_D;
delimiter ##
-- Create UPDATE trigger
create trigger TR_RSVP_RESPONSE_U
	before update
	on RSVP_RESPONSE
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "RSVP_RESPONSE"
            , "Action", "UPDATE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'GUEST_ID', old.GUEST_ID
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", JSON_OBJECT(
                      'GUEST_ID', new.GUEST_ID
                    , 'NOTE', new.NOTE
                    , 'STATUS', new.STATUS
                    , 'ADD_BY', new.ADD_BY
                    , 'ADD_ON', new.ADD_ON
                    , 'EDIT_BY', new.EDIT_BY
                    , 'EDIT_ON', new.EDIT_ON
                    )
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('RSVP_RESPONSE', 'UPDATE', @updateundle);
    end##
-- Create DELETE trigger
create trigger TR_RSVP_RESPONSE_D
	before delete
	on RSVP_RESPONSE
	for each row
	begin
        set @updateundle = JSON_OBJECT(
			  "Table", "RSVP_RESPONSE"
            , "Action", "DELETE"
            , "ConnectionID", connection_id()
            , "Time", current_timestamp()
            , "OLD", JSON_OBJECT(
                      'GUEST_ID', old.GUEST_ID
                    , 'NOTE', old.NOTE
                    , 'STATUS', old.STATUS
                    , 'ADD_BY', old.ADD_BY
                    , 'ADD_ON', old.ADD_ON
                    , 'EDIT_BY', old.EDIT_BY
                    , 'EDIT_ON', old.EDIT_ON
                    )
            , "NEW", "{}"
        );
		INSERT INTO AUDIT_TRAIL (TABLENAME, ACTION, PAYLOAD_JSON) VALUES ('RSVP_RESPONSE', 'DELETE', @updateundle);
    end##
delimiter ;
