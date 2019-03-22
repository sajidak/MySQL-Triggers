# Usage

**Syntax:**
`dotnet t4my.dll Action [Output file] [Configuration file] [Trigger template file] [Audit table template file]`

## Arguments:

### Action
*Required*

#### Values

1. `L` | `l` 
List all Tables
List all tables in database schema
Table names are printed to console, in format expected by configuration file.
Remove any tables you do not want triggers for and paste into Configuration file

2. `G` | `g` 
Generate Script  
Generate trigger script for all tables listed in config file, and write generated script to the output file.

### Output file
*Optional*
Default values will be used when not provided.
Default Value: `t4MySql-trigger-script.sql` in Current Directory

- Generated script will be written to this file. 
- The path can be relative or absolute. 
- Needs *Create* privilage to create the file, and *Write* privilage to write/over-write the file.

### Configuration file
*Optional*
Default file will be used when not specfied.
Default Value: `configs/t4my.default-config.json`

- All runtime values required for a successful generation are specified here.
- Values given as arguments on command line will override any values set in configuration file
- Value can be a relative path or an absolute path
- Needs *Read* privilage to read the file

**TableList**
if Array is empty, all tables from schema are presumed.

### Trigger template file
*Optional*
- Value set in configuration file will be used
- If not set in configuration file, default value will be used

Default Value: `templates/t4my.default-trigger-template.txt`

- The template to be used for generating a trigger.
- Values given as arguments on command line will override any values set in configuration file
- Value can be a relative path or an absolute path
- Needs *Read* privilage to read the file

### Audit table template file
*Optional*
- Value set in configuration file will be used
- If not set in configuration file, default value will be used

Default Value: `templates/t4my.default-audittable-template.txt`

- The template to be used for generating the Audit Trail table.
- Values given as arguments on command line will override any values set in configuration file
- Value can be a relative path or an absolute path
- Needs *Read* privilage to read the file
