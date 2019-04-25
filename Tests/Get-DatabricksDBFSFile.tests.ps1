Set-Location $PSScriptRoot
Import-Module "..\azure.databricks.cicd.Tools.psd1" -Force
$BearerToken = Get-Content "MyBearerToken.txt"  # Create this file in the Tests folder with just your bearer token in
$Region = "westeurope"
$global:Expires = $null
$global:DatabricksOrgId = $null
$global:RefeshToken = $null


Describe "Get-DatabricksDBFSFile"{
    
    BeforeAll{
        Add-DatabricksDBFSFile -BearerToken $BearerToken -Region $Region -LocalRootFolder "Samples" -FilePattern "Test.jar"  -TargetLocation '/test' -Verbose
    }
    It "Get file"{
        Get-DatabricksDBFSFile -BearerToken $BearerToken -Region $Region -DBFSFile '/test/Test.jar' -TargetFile './Samples/Test2.jar'
    }

   

}
