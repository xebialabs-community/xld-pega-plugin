<#--

    Copyright 2019 XEBIALABS

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

-->
#
# THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR 
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS 
# FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.
#

# Properties File for use with PRPC Utilities.  Update this file 
# before using prpcUtils.bat/sh script.
# Set the DB connection and the specific tool's settings

################### COMMON PROPERTIES - DB CONNECTION (REQUIRED) ##################
###################################################################################
#	For database that uses multiple JDBC driver files (such as DB2).  you may specify
#	semi-colon separated values for 'pega.jdbc.driver.jar'
#
#	pega.jdbc.driver.jar	-- path to jdbc jar 
#
#	pega.jdbc.driver.class 	-- jdbc class.  valid values are:
#
#	Oracle              oracle.jdbc.OracleDriver                
#	IBM DB/2            com.ibm.db2.jcc.DB2Driver               
#	SQL Server          com.microsoft.sqlserver.jdbc.SQLServerDriver
#	PostgreSQL          org.postgresql.Driver
#	
#	pega.database.type	valid values are: mssql, oracledate, udb, db2zos, postgres
#
#	pega.jdbc.url		valid values are:
#	
#	Oracle              jdbc:oracle:thin:@//localhost:1521/dbName
#	IBM DB/2 z / OS 	jdbc:db2://localhost:50000/dbName
#	IBM DB/2            jdbc:db2://localhost:50000/dbName:fullyMaterializeLobData=true;fullyMaterializeInputStreams=true;progressiveStreaming=2;useJDBC4ColumnNameAndLabelSemantics=2;
#	SQL Server          jdbc:sqlserver://localhost:1433;selectMethod=cursor;sendStringParametersAsUnicode=false
#	PostgreSQL          jdbc:postgresql://localhost:5432/dbName
#   
#	pega.jdbc.username 	db username
#	pega.jdbc.password  db password
# 

# Connection Information 	
pega.jdbc.driver.jar=${deployed.container.databaseDriverJarPath}
pega.jdbc.driver.class=${deployed.container.databaseDriverClass}
pega.database.type=${deployed.container.databaseType}
pega.jdbc.url=${deployed.container.databaseJdbcUrl}
pega.jdbc.username=<#if deployed.databaseUsername??>${deployed.databaseUsername}<#else>${deployed.container.databaseUsername}</#if>
pega.jdbc.password=<#if deployed.databasePassword??>${deployed.databasePassword}<#else>${deployed.container.databasePassword}</#if>

#Uncomment this property and add a list of ; delimited connections properties
#For example jdbc.custom.connection.properties=user=usr;password=pwd
#jdbc.custom.connection.properties=

# Use the following properties If you want to use a  
# custom prconfig.xml or prbootstrap.properties file
#pegarules.config=
#prbootstrap.config=

# Use the following properties if you want to use a user's access group
# to determine runtime context instead of the App Requestor's access group
pega.user.username=
pega.user.password=

#rules schema name : the user name is used for default schema name. 
rules.schema.name=${deployed.container.rulesSchemaName}
data.schema.name=${deployed.container.dataSchemaName}

#Enable Agents?
pega.agents.enable=true
#This setting is for column population jobs tool (ant target:populate).
# One of the values {COMMANDLINE_JOB or ALL} are the valid values here.
#If the value is set to COMMANDLINE_JOB then only those jobs whose execution mode is COMMANDLINE_JOB will be picked up, otherwise all the jobs will be processed.
column.population.job.mode=COMMANDLINE_JOB

#User Temp Directory. will use default if not set to valid directory
user.temp.dir=${deployed.container.userTempDir}

############################### SETTINGS FOR IMPORT TOOL ##########################
###################################################################################
# RELATIVE PATH TO ARCHIVE FROM UTILS FOLDER OR FULL PATH  TO ARCHIVE (REQUIRED):
import.archive.path=${deployed.file.path}

# Import Pega Archive Options

# Modes
# install  - Do not update existing instances, only import new instances.
#            If an instance already exists, it will not be imported. A exception
#            message will appear in the log for each instance that already exists.
# import   - Update existing instances and remove duplicates.  Handling of existing
#			 instances can be overridden using the import.existing.instances property.
# restore  - Restore
# hotfix   - Update existing instances and remove duplicates if newer timestamp,
#            skip updating the instance (or inserting the duplicate) if the
#            archive's instance timestamp is older.
import.mode=import

# Handling for existing instances
# override - Replace instances that already exist in different RuleSets and/or Versions.
# skip     - Skip the instances that already exist in different RuleSets and/or Versions.
# if unset, the import will fail if existing instances are encountered
import.existing.instances=skip

#  Do not fail on error 
import.nofailonerror=false
#  specify how often to commit to the database 
import.commit.count=100
#  Compile any libraries after import
import.compile.libraries=true
# Allow import even if there are any missing product dependencies. Recommended value is false
import.allowImportWithMissingDependencies=false
# Allows bypassing schema import. The schema changes (DDL) if applied manually, set this flag to true to skip schema. Default is false
import.bypass.schema=false
# Set this to true to import non PegaRULES instances and DDL as well as enabling commit and rollback for those instances
import.track.data=false


#allows triggers for the core product to run while performing command line imports
import.enable.defaultcontext=true

# Import Code Archive options
# Specify which CodeSet Name and Version to load the Java .class files to.
import.codeset.name=Customer
import.codeset.version=06-01-01

############################### SETTINGS FOR FULL TEXT INDEXER TOOL ##########################
###################################################################################

# indexing.indextype			valid values are: Rule, Data, Work
# indexing.classes  			List of classes to include, separate classes by commas (no spaces)
# indexing.exclude				Uncomment this if the list of classes specified in indexing.classes has to be excluded in re-index (Can only be used together with indexing.classes).
# indexing.messagesfrequency	Frequency at which the indexing progress has to be shown (Default is 10 sec)

indexing.indextype=Data
#indexing.classes=Data-Admin-Operator-ID,Data-Admin-Calendar
#indexing.exclude=
#indexing.messagesfrequency=10
#indexing.help=

############################### SETTINGS FOR REMOVE INDEX NODE TOOL ##########################
###################################################################################
# removeIndexNode.nodeId			Specify valid nodeId of the offline index node, value can be found under pysysnodeId column of pr_sys_statusnodes
removeIndexNode.nodeId=
#removeIndexNode.help

############################### SETTINGS FOR EXPORT TOOL ##########################
###################################################################################
# FULL PATH  TO ARCHIVE (REQUIRED) :
export.archive.full.path=
# Identify a Rule-Admin-Product instance by its pzInsKey (EXPORT RAP only)
export.archive.productkey=
# CLASSES TO INCLUDE (REQUIRED -- if not specifying a product key):
#	classes.included :	classes to include, separate classes by commas (no spaces)
#	included.descendent :	true (include descendants)
#   NOT required if exporting a list of pzInsKeys
export.classes.included=
export.included.descendent=true
# CLASSES TO EXCLUDE  
# 	classes.excluded :	classes to exclude, separate classes by commas (no spaces)
#	excluded.descendent :	true (exclude descendants)
#	For example, if including classes with descendants (Rule-) you can use this
# 		to filter specific classes
export.classes.excluded=
export.excluded.descendent=true
# RULESET VERSION RANGE :
#  Specifies a minimum RuleSet version for Rule Resolved instances
#  of Rule- (e.g. 05- or 05-01-01)
export.startVersion=
export.endVersion=
#  Full path to a file which contains instances to export 
#	 identified by pzInsKey, 1 per line.
#  if exporting a list of pzInsKeys, do not provide other arguments such as export.classes.included
export.keys.file=

# RULESET NAME :
#  Include instances of this RuleSet (for Rule- classes). This is case sensitive (e.g. pass Pega-Desktop, not pega-desktop)
export.ruleset.name=

# Specify application name (only one) with version for exporting ABV ruleset in this application's context.
# For example, PegaRULES!07.10
export.application.context=

#  Preserve lock property on checked out instances 
# Only use if moving the corresponding locked instance
export.preserve.locks=false

# MIGRATION EXPORT :
# 
# full-path to the XML File containing classes to export.
# If XML file is not provided, all class instances in PegaRULES database tables will be exported except the ones that will be auto generated.(like Data-Rule-Summary and classes starting with Index- and System-)
# example: export.migration.xml=C:/users/administrator/exportClasses.xml
export.migration.xml=
# export all instances created or updated after, uses format: YYYY MM DD hh mm ss S a
# This is a mandatory property required for a migration export.
# example: for March 15, 2012 04:42:00:0 PM, set export.migration.date="2012 03 15 04 42 00 0 PM"
export.migration.date=


# For RAP exports, set this to true to export a 'Data Only' archive which will contain everything 
# except PegaRULES instances and DDL.
export.product.dataOnly=false

############################### SETTINGS FOR EXPOSE TOOL ##########################
###################################################################################
# CLASSES TO INCLUDE (REQUIRED):
#	classes.included :	classes to include, separate classes by commas
#	included.descendent :	true (include descendents)
expose.classes.included=
expose.included.descendent=true
# CLASSES TO EXCLUDE  
# 	classes.excluded :	classes to exclude, separate classes by commans
#	excluded.descendent :	true (exclude descendents)
#	For example, if including classes with descendants (Rule-) you can use this
# 		to filter specific classes
expose.classes.excluded=
expose.excluded.descendent=true
#AccessGroup in which the Rule-Declare-Index of the classes being exposed exists.
#This is considered if pega.username or pega.password are not provided.
expose.declareIndex.accessgroup=
# KEYS AND DATE RANGES :
# Use the following arguments to specify a range of pzInsKey or 
# pxCreateDateTime properties. If you provide both, only the  
# pzInsKey range will be used. 
# Format for date properties is yyyyMMddTHHmmss.SSS
# NOTE: if you provide the pzInsKey range then you may only provide ONE 
#   class with no descendants. Use the classes.included and provide one class). 
#  	startKey	Only instances with a pzInsKey equal to or greater than <start key>
#	endKey		Only instances with a pzInsKey equal to or less than <end key>
#	startDate	Only instances with a pxCreateDateTime equal to or greater than <start date>
#	endDate		Only instances with a pxCreateDateTime equal to or less than <end date>
# NOTE: When dealing with large tables, give the pzInsKey range diligently to return appropriate number of results 
#                                                    so that the pre fetch query doesn't lead to allocation errors.
expose.startKey=
expose.endKey=
expose.startDate=
expose.endDate=
# REINDEXING :
# Use the following argument to regenerate indexes 
# When true you should either provide pega.username and pega.password or provide accessgroup.
# pega.username and password take precedence over accessgroup.
# Otherwise reindex will not work properly.
expose.reindex=true
# Use the following argument to limit scope of rulesets processed.
#	full -- process pega and customer rulesets
#	pega -- process only pega rulesets
#   nonpega -- process only customer rulesets
# for performance reasons, it's usually not necessary to process PRPC rulesets unless instructed
expose.reindexType=nonpega
#  specify how often to commit to the database
expose.commitRate=100
# Number of threads to be used
# Defaults to number of classes being updated if no value is specified
# Set to a higher value in case of updating large sets of data
expose.numOfThreads=



############################### SETTINGS FOR RESAVE TOOL ##########################
###################################################################################
# CLASSES TO INCLUDE (REQUIRED):
#	classes.included :	classes to include, separate classes by commas
#	included.descendent :	true (include descendents)
resave.classes.included=true
resave.included.descendent=true
# CLASSES TO EXCLUDE  
# 	classes.excluded :	classes to exclude, separate classes by commans
#	excluded.descendent :	true (exclude descendents)
#	For example, if including classes with descendants (Rule-) you can use this
# 		to filter specific classes
resave.classes.excluded=false
resave.excluded.descendent=true
# KEYS AND DATE RANGES :
# Use the following arguments to specify a range of pzInsKey or 
# pxCreateDateTime properties. If you provide both, only the  
# pzInsKey range will be used. 
# NOTE: if you provide the pzInsKey range then you may only provide ONE 
#   class with no descendants. Use the classes.included and provide one class). 
#  	startKey	Only instances with a pzInsKey equal to or greater than <start key>
#	endKey		Only instances with a pzInsKey equal to or less than <end key>
#	startDate	Only instances with a pxCreateDateTime equal to or greater than <start date>
#	endDate		Only instances with a pxCreateDateTime equal to or less than <end date>
resave.startKey=
resave.endKey=
resave.startDate=
resave.endDate=

############################### SETTINGS FOR AGENT MANAGEMENT TOOL ##########################
######################################################################################
# CLASSES TO INCLUDE (REQUIRED):
#	classes.included :	classes to include, separate classes by commas

runagent.agentruleset=Pega-RulesEngine
runagent.agentname=PropertyOptimization

############################### SETTINGS FOR INVALID RULES SCAN TOOL ##########################
######################################################################################
#APPLICATION TO BE SCANNED (REQUIRED)
#	applicationName    	Name of application to be scanned for invalid rules
#	applicationVersion 	Version of application to be scanned for invalid rules
#	accessgroup			AccessGroup having access to the given application
scan.applicationName=
scan.applicationVersion=
scan.accessgroup=

#Full path to the directory containing any external jars to be included in scanner classpath
scan.lib.external.jars=

#FULL PATH OF FILE TO WHICH SCAN RESULTS ARE TO BE WRITTEN (REQUIRED)
scan.result.file=E:/Results.csv

#FULL PATH OF FILE, WHICH CONTAINS RULETYPES TO SCAN (ONE RULETYPE PER LINE, REQUIRED)
scan.ruletypes.file=E:/RuleTypes.txt

############################### SETTINGS FOR TRACKED DATA ##########################
#valid values are rollback or commit
#setting this property rolls back or commits data that has been imported using 'import data only instances'
trackedData.operation=

############################### SETTINGS FOR HOTFIX MANAGER ##########################
# Valid values are commit, rollback, generateDDL, install, and scan.
hotfix.operation=
# If generateDDL or install is chosen, provide a path to a DL file.
hotfix.DLFilePath=
# If scan is chosen, provide a path to a Catalog.zip file.
# Catalog.zip files can be obtained from DL files or downloaded from ftp://catalog:catalog!@pegaftp2.pega.com/hfix/CATALOG/61/CATALOG.ZIP
hotfix.CatalogPath=
# If scan is chosen, provide the directory to save the scan results .zip file.
hotfix.scan.downloadPath=
# Set to true to bypass schema when installing a DL 
hotfix.bypass.schema=false
# Import a DL even if it requires additional configuration
hotfix.force=false
############################### SETTINGS FOR JAVA SYNTAX UPGRADE ##########################

#Scan shipped pega rules
syntax.rules.excludeCore=false

#Scan all versions of rules
syntax.rules.allVersions=true

############################### SETTINGS FOR GENERATE DDL ##########################
######################################################################################
#Full path to the AppBundle file where the schema jar is present.Multiple files can be given with comma seperated.
#Example:C:/Input/TestApp_1.zip,C:/Input/TestApp_2.zip
schema.archive.input=
#Full path to the directory where the generated schema needs to be placed
#Example:if the schema generated has two databases PegaRULES && PegaDATA then the below file will be generate with PegaRULES.sql and PegaDATA.sql
#C:/Output
#After running generateDDL the output files TestApp_1_ddl.zip,TestApp_1_ddl.zip will be placed into 'C:/Output' directory
schema.generated.output=
