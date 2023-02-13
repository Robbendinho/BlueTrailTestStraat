# Script created 01/02/2023 by Rob van Bezouwen - BlueTrail

# Variables (fill these in)

	# Required - the location of your source code
	$scriptsFolder = "C:\xampp\mysql\scripts"
	
	# Required - a name and version number for your package (must not already exist in output directory)
	$packageID = "BlueTrailDB"
    $scriptDate = Get-Date -Format "MM/dd/yyyyHH:mm"
	$packageVersion = 0.1-$scriptDate
	
	# Required - An output directory in which to save your build artifacts (must already exist)
	$outputDir = "C:\JenkinsDrops"
	
	# Optional - If using an alternate SQL instance for schema validation provide details here. Also, uncomment this parameter from line 34 below.
	#$buildDb = "Data Source=.\SQL2014"
		
	# Required for sync step only - the database you wish to deploy to. Uncomment below and also lines 46-8 if running a sync step.
	#$targetServerInstance = ".\SQL2014"
	#$targetDatabaseName = "AdventureWorks"
	
	# Optional - If using SQL Auth for target DB add a username and password. Also, uncomment these parameters from line 42 below.
	#$username = "myUsername"
	#$password = "myPassword"

# Script to build DB (you can probably leave this as is)
	
	$errorActionPreference = "stop"
	 
	# Validate the scripts folder
	$validatedScriptsFolder = Invoke-DlmDatabaseSchemaValidation $scriptsFolder # -TemporaryDatabaseServer $buildDb

	# Export NuGet package
	$package = New-DlmDatabasePackage $validatedScriptsFolder -PackageId $packageID -PackageVersion $packageVersion
	Export-DlmDatabasePackage $package -Path $outputDir

# Script to run tests and/or deploy to an integration DB (uncomment as appropriate)

	# # Run tSQLt unit tests
	# Invoke-DlmDatabaseTests $package | Export-DlmDatabaseTestResults -OutputFile "$outputDir\$packageID.$packageVersion.junit.xml"

	# # Sync a test database
	# $targetDB = New-DlmDatabaseConnection -ServerInstance $targetServerInstance -Database $targetDatabaseName # -Username $username -Password $password
	# Test-DlmDatabaseConnection $targetDB
	# Sync-DlmDatabaseSchema -Source $package -Target $targetDB