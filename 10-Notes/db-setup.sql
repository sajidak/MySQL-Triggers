/*
Database setup Script for 'Triggers 4 MySQL'
--
SOURCE LOCATION: $/10-Notes/db-setup.sql
Version: 0.0.1.0
*/

-- Initialize database
CREATE DATABASE T4MY_SAMPLE;
USE T4MY_SAMPLE;

-- Generate users
-- Admin user
CREATE USER 't4my-dbadmin'@'%' IDENTIFIED BY 'a315bacdc1d8dafae8a7f080fef4e97bdc1dc44cba19a924'; -- PASSWORD EXPIRE NEVER;
GRANT USAGE ON *.* TO 'T4MY_SAMPLE'@'%';
GRANT ALL PRIVILEGES ON `T4MY_SAMPLE`.* TO 't4my-dbadmin'@'%';

-- Read-Write User
CREATE USER 't4my-user-rw'@'%' IDENTIFIED BY 'a744b362c731d8aae7c4f2e0';
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE, SHOW VIEW ON `T4MY_SAMPLE`.* TO 't4my-user-rw'@'%';
-- Read Only user
CREATE USER 't4my-user-ro'@'%' IDENTIFIED BY 'acbd83c3e7e0';
GRANT SELECT, SHOW VIEW ON `T4MY_SAMPLE`.* TO 't4my-user-ro'@'%';

-- Create tables
CREATE TABLE A_DB_INFO (
  ID      INT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Keys for linking and unique Ids. Set Generation manually.', 
  VERSION int(10), 
  NOTE    int(10), 
  STATUS  TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY  INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON  timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (ID)) comment='Version tracking log for this database.';
CREATE TABLE DD_CATEGORIES (
  DDI_CATG_ID   INT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Keys for linking and unique Ids. Set Generation manually.', 
  DDI_CATG_NAME varchar(40) NOT NULL comment 'Full Name of a entity', 
  DDI_CATG_DESC varchar(255) NOT NULL comment 'Short note or description.', 
  STATUS        TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY        INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY       INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON       timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (DDI_CATG_ID)) comment='Dropdown/Lookup categories. Each entry will map to an enum in the system.';
CREATE TABLE DD_ITEMS (
  DDI_CATG_ID   INT UNSIGNED NOT NULL, 
  DDI_CODE      INT UNSIGNED DEFAULT 0 NOT NULL comment 'Keys for linking and unique Ids. Set Generation manually.', 
  DDI_DISP_SEQ  SMALLINT UNSIGNED DEFAULT 100 NOT NULL comment 'Seq to use for custom sorting. Max val 65,535', 
  DDI_CODE_TXT  varchar(8) NOT NULL comment 'For text valued keys, e.g. Country code', 
  DDI_TEXT      varchar(24) NOT NULL comment 'Short Name of a entity', 
  DDI_DISP_TEXT varchar(40) comment 'Full Name of a entity', 
  STATUS        TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY        INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY       INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON       timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (DDI_CATG_ID, 
  DDI_CODE)) comment='Dropdown/Lookup Items. Each entry will be a member of the corresponding enum.';
CREATE TABLE DD_TAG_GROUPS (
  DDT_TAG_GRP_ID   INT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Keys for linking and unique Ids. Set Generation manually.', 
  DDT_TAG_GRP_NAME varchar(24) NOT NULL UNIQUE comment 'Short Name of a entity', 
  DDT_TAG_GRP_DESC varchar(255) comment 'Short note or description.', 
  STATUS           TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY           INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY          INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON          timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (DDT_TAG_GRP_ID)) comment='Tag groups';
CREATE TABLE DD_TAGS (
  DDT_TAG_ID     INT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Keys for linking and unique Ids. Set Value manually.', 
  DDT_TAG_GRP_ID INT UNSIGNED NOT NULL, 
  DDT_DISP_SEQ   SMALLINT UNSIGNED DEFAULT 100 NOT NULL comment 'Seq to use for custom sorting. Max val 65,535', 
  DDT_DISP_TEXT  varchar(24) NOT NULL UNIQUE comment 'Short Name of a tag for display.', 
  DDT_NOTE       varchar(255) comment 'Short note or description.', 
  STATUS         TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY         INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON         timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY        INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON        timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (DDT_TAG_ID, 
  DDT_TAG_GRP_ID));
CREATE TABLE GEN_APP_SETTINGS (
  VER          INT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Keys for linking and unique Ids. Set Generation manually.', 
  APP_SETTINGS mediumtext NOT NULL comment 'Configuration data in JSON format.', 
  STATUS       TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY       INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON       timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY      INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON      timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (VER)) comment='Application configuration settings for the system, to allow multiple profiles to be maintained and applied hot.';
CREATE TABLE GEN_TEMPLATES (
  TEMPLATE_ID   INT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Unique identifier for template, for linking.', 
  TEMPLATE_TYPE INT UNSIGNED DEFAULT 0 NOT NULL comment 'Type or Category of template. Maps to enum ''10 - Template Type''', 
  DISP_SEQ      SMALLINT UNSIGNED DEFAULT 100 NOT NULL comment 'Seq to use for custom sorting. Max val 65,535', 
  TEMPLATE_NAME varchar(24) NOT NULL comment 'Short Name of a entity', 
  TEMPLATE_BODY text NOT NULL comment 'Template content with embedded parameter placeholders ~64kb long.', 
  NOTE          varchar(255) comment 'Short note or description.', 
  STATUS        TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY        INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY       INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON       timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (TEMPLATE_ID), 
  CONSTRAINT TEMPLATE_TYPE_NAME_UNIQ 
    UNIQUE (TEMPLATE_TYPE, TEMPLATE_NAME)) comment='Templates for messaging.';
CREATE TABLE GEN_USERS (
  USERID    INT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Keys for linking and unique Ids. Set Generation manually.', 
  USER_NAME varchar(24) NOT NULL UNIQUE comment 'Short name for display in masthead and logs.', 
  ROLE      INT UNSIGNED DEFAULT 0 NOT NULL comment 'Role assigned to user in this system. maps to enum ''3 - User Role''', 
  MOBILE    varchar(16) NOT NULL UNIQUE comment 'Phone or Mobile number, in text format.', 
  EMAIL     varchar(40) NOT NULL UNIQUE comment 'Email address', 
  FULL_NAME varchar(40) NOT NULL comment 'Full name of the user.', 
  PASSWORD  varchar(2048) NOT NULL comment 'Hashed password text of user.', 
  NOTE      varchar(255) comment 'Short note or description.', 
  STATUS    TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY    INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON    timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY   INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON   timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (USERID)) comment='System Users, Meta data.';
CREATE TABLE GT_TRANSPORT (
  TRANSPORT_ID INT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Keys for linking and unique Ids. Set Generation manually.', 
  TYPE         INT UNSIGNED DEFAULT 0 NOT NULL comment 'Type of transport. Maps to enum ''11 - Transport Type''', 
  START_TIME   timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'ETD of transport. Ignored for non-flight types.', 
  END_TIME     timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'ETD of transport. Ignored for non-flight types.', 
  ORIGIN       varchar(40) NOT NULL comment 'City-Country of journey origin.', 
  DESTINATION  varchar(40) NOT NULL comment 'City-Country of journey destination.', 
  NOTE         text comment 'General text field ~64kb long', 
  STATUS       TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY       INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON       timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY      INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON      timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (TRANSPORT_ID)) comment='Transport entry. Create a tag if type is flight.';
CREATE TABLE GT_TRANSPORT_GUEST_MAP (
  TRANSPORT_ID INT UNSIGNED NOT NULL, 
  PARTY_ID     INT UNSIGNED NOT NULL, 
  NOTE         text comment 'General text field ~64kb long', 
  STATUS       TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY       INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON       timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY      INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON      timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (TRANSPORT_ID, 
  PARTY_ID)) comment='Mapping of all guests and transports assigned.';
CREATE TABLE GUEST_DATA (
  GUEST_ID          INT UNSIGNED NOT NULL, 
  CREATE_TIME       timestamp DEFAULT CURRENT_TIMESTAMP NULL comment 'Timestamp value, to capture instants.', 
  FULL_NAME         varchar(40) NOT NULL comment 'Full Name of a entity', 
  FIRST_NAME        varchar(24) comment 'Short Name of a entity', 
  LAST_NAME         varchar(24) comment 'Short Name of a entity', 
  INDUSTRY          varchar(255) comment 'Short note or description.', 
  LOCATION          varchar(40) comment 'Full Name of a entity', 
  COMPANY1          varchar(40) comment 'Full Name of a entity', 
  DEPARTMENT1       varchar(24) comment 'Short Name of a entity', 
  TITLE1            varchar(24) comment 'Short Name of a entity', 
  COMPANY2          varchar(40) comment 'Full Name of a entity', 
  DEPARTMENT2       varchar(24) comment 'Short Name of a entity', 
  TITLE2            varchar(24) comment 'Short Name of a entity', 
  COMPANY_OTHERS    varchar(40) comment 'Full Name of a entity', 
  DEPARTMENT_OTHERS varchar(24) comment 'Short Name of a entity', 
  TITLE_OTHERS      varchar(24) comment 'Short Name of a entity', 
  MOBILE1           varchar(16) comment 'Phone or Mobile number, in text format.', 
  MOBILE2           varchar(16) comment 'Phone or Mobile number, in text format.', 
  MOBILE_OTHERS     varchar(16) comment 'Phone or Mobile number, in text format.', 
  TELEPHONE1        varchar(16) comment 'Phone or Mobile number, in text format.', 
  TELEPHONE2        varchar(16) comment 'Phone or Mobile number, in text format.', 
  TELEPHONE_OTHERS  varchar(16) comment 'Phone or Mobile number, in text format.', 
  FAX1              varchar(16) comment 'Phone or Mobile number, in text format.', 
  FAX2              varchar(16) comment 'Phone or Mobile number, in text format.', 
  FAX_OTHERS        varchar(16) comment 'Phone or Mobile number, in text format.', 
  EMAIL1            varchar(40) comment 'Email address', 
  EMAIL2            varchar(40) comment 'Email address', 
  EMAIL_OTHERS      varchar(40) comment 'Email address', 
  ADDRESS1_COUNTRY  varchar(24) comment 'Short Name of a entity', 
  ADDRESS1_STATE    varchar(40) DEFAULT 'India' comment 'Display and Printable name of the country.', 
  ADDRESS1_CITY     varchar(24) DEFAULT 'NA' comment 'Text field for Names of City and States.', 
  ADDRESS1_STREET1  varchar(255) comment 'Address line segment of an address.', 
  ADDRESS1_STREET2  varchar(255) comment 'Address line segment of an address.', 
  ADDRESS1_ZIP      varchar(24) DEFAULT 'NA' comment 'Text field for Names of City and States.', 
  ADDRESS2_COUNTRY  varchar(24) DEFAULT 'NA' comment 'Text field for Names of City and States.', 
  ADDRESS2_STATE    varchar(24) DEFAULT 'NA' comment 'Text field for Names of City and States.', 
  ADDRESS2_CITY     varchar(24) DEFAULT 'NA' comment 'Text field for Names of City and States.', 
  ADDRESS2_STREET1  varchar(255) comment 'Address line segment of an address.', 
  ADDRESS2_STREET2  varchar(255) comment 'Address line segment of an address.', 
  ADDRESS2_ZIP      SMALLINT UNSIGNED DEFAULT 100 comment 'Seq to use for custom sorting. Max val 65,535', 
  ADDRESS_OTHERS    varchar(512), 
  WEB_PAGE          varchar(40) comment 'Full Name of a entity', 
  INSTANT_MESSAGE   varchar(40) comment 'Full Name of a entity', 
  SNS_ACCOUNT       varchar(40) comment 'Full Name of a entity', 
  BIRTHDAY          date comment 'Date part only', 
  ANNIVERSARY       date comment 'Date part only', 
  `GROUP`           varchar(40) comment 'Full Name of a entity', 
  NICKNAME          varchar(24) comment 'Short Name of a entity', 
  STATUS            TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY            INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON            timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY           INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON           timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (GUEST_ID)) comment='Guest profile and additional data. All data from CSV file or Mobile Contact list to be saved in raw format, for future use.';
CREATE TABLE GUEST_DATA_NOTES (
  GUEST_ID INT UNSIGNED NOT NULL, 
  NOTE1    text comment 'General text field ~64kb long', 
  NOTE2    text comment 'General text field ~64kb long', 
  NOTE3    text comment 'General text field ~64kb long', 
  STATUS   TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY   INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON   timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY  INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON  timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (GUEST_ID)) comment='All NOTE fields from CSV file or Mobile Contact list to be saved in raw format, for future use. Seperate table to avoid row size restrictions.';
CREATE TABLE GUEST_NOTES (
  NOTE_ID  INT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Keys for linking and unique Ids. Set Generation manually.', 
  GUEST_ID INT UNSIGNED NOT NULL, 
  NOTE     text comment 'General text field ~64kb long', 
  STATUS   TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Maps to enum ''1 - Record Status''', 
  ADD_BY   INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON   timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY  INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON  timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (NOTE_ID, 
  GUEST_ID)) comment='Note fields for guests. Multiple notes per guest for convenience.';
CREATE TABLE GUEST_PARTY_MEMBERS (
  PARTY_ID     INT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Keys for linking and unique Ids. Set Generation manually.', 
  GUEST_ID     INT UNSIGNED NOT NULL, 
  PARTY_SEQ    SMALLINT UNSIGNED DEFAULT 100 NOT NULL comment 'Maintain sequence of members acrss sessions. Party 0 is the guest entry.', 
  PARTY_TYPE   INT UNSIGNED DEFAULT 0 NOT NULL comment 'maps to enum ''8 - Member Type'', To enable identify multiple invitations.', 
  FULL_NAME    varchar(40) NOT NULL comment 'Full Name of a entity', 
  GENDER       INT UNSIGNED DEFAULT 0 NOT NULL comment 'Flag to indicate gender, maps to Enum ''Gender''.', 
  CUISINE_PREF INT UNSIGNED DEFAULT 0 NOT NULL comment 'Flag to indicate preferred cuisune. Maps to Enum ''Cuisine Type''', 
  EMAIL        varchar(40) comment 'Optional email address if member should be updated.', 
  MOBILE       varchar(16) comment 'Optional mobile number, if member should be updated.', 
  NOTE         text comment 'General text field ~64kb long', 
  STATUS       TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Maps to enum ''9 - Member Status''', 
  ADD_BY       INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON       timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY      INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON      timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (PARTY_ID, 
  GUEST_ID), 
  CONSTRAINT PARTY_SEQ_KEY 
    UNIQUE (GUEST_ID, PARTY_SEQ)) comment='Members of party included in the invite. The invited guest should also be included as an entry here.';
CREATE TABLE GUEST_TAG_MAP (
  GUEST_ID   INT UNSIGNED NOT NULL, 
  DDT_TAG_ID INT UNSIGNED NOT NULL, 
  STATUS     TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY     INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON     timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY    INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON    timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (GUEST_ID, 
  DDT_TAG_ID)) comment='Mapping of all tags applied to a guest.';
CREATE TABLE GUESTS (
  GUEST_ID      INT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Unique Guest ID, to link with other entities.', 
  GUEST_CODE    varchar(24) NOT NULL comment 'Generated code for use in external links, to avoid revealing internal numeric codes.', 
  FULL_NAME     varchar(40) NOT NULL comment 'Full Name of guest.', 
  MOBILE        varchar(16) NOT NULL comment 'Phone or Mobile number, in text format.', 
  EMAIL         varchar(40) NOT NULL comment 'Email address', 
  NICK_NAME     varchar(24) comment 'Short and recognizable name, for future use.', 
  PRIMARY_GUEST INT UNSIGNED DEFAULT 0 comment 'Link multiple contacts. Guest with PRIMARY_GUEST == GUEST_ID is the primary contact. PRIMARY_GUEST == null or 0 implies individual contact.', 
  STATUS        TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Maps to enum ''1 - Record Status''', 
  ADD_BY        INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY       INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON       timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (GUEST_ID), 
  INDEX (GUEST_CODE)) comment='Guest entries, Meta data.';
CREATE TABLE MAINT_MESG_LOG (
  MESG_ID   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Long keys when large number of records are expected', 
  PARTY_ID  INT UNSIGNED NOT NULL, 
  GUEST_ID  INT UNSIGNED NOT NULL, 
  MESG_TYPE int(11) comment 'Type or Category of template used. Maps to enum ''10 - Template Type''', 
  MESG_BODY int(11), 
  STATUS    TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY    INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON    timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY   INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON   timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (MESG_ID)) comment='Log of all messages generated and sent by the system.';
CREATE TABLE MAINT_RSVP_UPDATE_LOG (
  UPDATE_ID INT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Generated sequence to make key unique.', 
  GUEST_ID  INT UNSIGNED NOT NULL, 
  STATUS    TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY    INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON    timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY   INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON   timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (UPDATE_ID, 
  GUEST_ID));
CREATE TABLE MAINT_SESSION_LOG (
  LOG_ID BIGINT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Long keys when large number of records are expected', 
  PRIMARY KEY (LOG_ID)) comment='History of all system logins, logouts, timeouts, failed logins and othe entries to provide system access details. 
To be monitored for unauthorized access to system.';
CREATE TABLE MAINT_SESSIONS (
  SESS_ID       BIGINT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Long keys when large number of records are expected', 
  USERID        INT UNSIGNED DEFAULT 0 NOT NULL comment 'User for who the session is initiated. 0 if authentication is pending.', 
  SESS_TOKEN    varchar(1024) NOT NULL comment 'Generated token to share with clients, to link requests to session.', 
  SESS_START    timestamp DEFAULT CURRENT_TIMESTAMP NULL comment 'Timestamp value, to capture instants.', 
  SESS_END      timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Timestamp value, to capture instants.', 
  SESS_END_MODE INT UNSIGNED DEFAULT 0 NOT NULL comment 'How did the session end. Maps to Enum ''''', 
  CLIENT_IP     varchar(24) comment 'IP Address of the client.', 
  REFERRER      varchar(512) comment 'Contents of referrer field in header. Truncate if longer.', 
  SESS_PAYLOAD  text comment 'Session linked data, do not send to client. ~64kb long. JSON object in string format.', 
  STATUS        TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY        INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY       INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON       timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (SESS_ID)) comment='Container to manage user sessions.';
CREATE TABLE MAINT_SYSTEM_LOG (
  LOG_ID BIGINT UNSIGNED NOT NULL AUTO_INCREMENT comment 'Long keys when large number of records are expected', 
  PRIMARY KEY (LOG_ID)) comment='Commentry type entries of activities in the system.
Includes Debug, Informational, warning, errors and exception entries.

To be monitored for gauging system health and performance.';
CREATE TABLE PARTY_TAG_MAP (
  PARTY_ID       INT UNSIGNED NOT NULL, 
  GUEST_ID       INT UNSIGNED NOT NULL comment 'Addl Col to ease data query.', 
  DDT_TAG_ID     INT UNSIGNED NOT NULL, 
  DDT_TAG_GRP_ID INT UNSIGNED NOT NULL comment 'Addl Col to ease data query.', 
  STATUS         TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY         INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON         timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY        INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON        timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (PARTY_ID, 
  GUEST_ID, 
  DDT_TAG_ID, 
  DDT_TAG_GRP_ID)) comment='Extended mapping for party member level tags. eg. Veg/Non-Veg';
CREATE TABLE RSVP_RESPONSE (
  GUEST_ID INT UNSIGNED NOT NULL, 
  NOTE     varchar(512) comment 'Short note or description.', 
  STATUS   TINYINT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric flag value indicating status of current record. Should always be mapped to a Enum value.', 
  ADD_BY   INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  ADD_ON   timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL comment 'Instant the record was added to the system.', 
  EDIT_BY  INT UNSIGNED DEFAULT 0 NOT NULL comment 'Numeric system ID of a user. Valid vals are 1 to 2,147,483,647.', 
  EDIT_ON  timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL comment 'Instant when record was last edited.', 
  PRIMARY KEY (GUEST_ID)) comment='Tracks responses by each guest invited.';
CREATE INDEX GUEST_PARTY_MEMBERS 
  ON GUEST_PARTY_MEMBERS (PARTY_TYPE);
ALTER TABLE GT_TRANSPORT_GUEST_MAP ADD CONSTRAINT FKGT_TRANSPO948754 FOREIGN KEY (PARTY_ID) REFERENCES GUEST_PARTY_MEMBERS (PARTY_ID);
ALTER TABLE MAINT_MESG_LOG ADD CONSTRAINT FKMAINT_MESG482349 FOREIGN KEY (PARTY_ID, GUEST_ID) REFERENCES GUEST_PARTY_MEMBERS (PARTY_ID, GUEST_ID);
ALTER TABLE GUEST_DATA_NOTES ADD CONSTRAINT FKGUEST_DATA143949 FOREIGN KEY (GUEST_ID) REFERENCES GUESTS (GUEST_ID);
ALTER TABLE GUEST_NOTES ADD CONSTRAINT FKGUEST_NOTE290428 FOREIGN KEY (GUEST_ID) REFERENCES GUESTS (GUEST_ID);
ALTER TABLE PARTY_TAG_MAP ADD CONSTRAINT FKPARTY_TAG_149113 FOREIGN KEY (PARTY_ID, GUEST_ID) REFERENCES GUEST_PARTY_MEMBERS (PARTY_ID, GUEST_ID);
ALTER TABLE PARTY_TAG_MAP ADD CONSTRAINT FKPARTY_TAG_455252 FOREIGN KEY (DDT_TAG_ID, DDT_TAG_GRP_ID) REFERENCES DD_TAGS (DDT_TAG_ID, DDT_TAG_GRP_ID);
ALTER TABLE GUESTS ADD CONSTRAINT FKGUESTS974511 FOREIGN KEY (PRIMARY_GUEST) REFERENCES GUESTS (GUEST_ID);
