#This script is used for getting files Hashes
$FileHashed = Read-Host -Prompt "Enter the name of the file which you want to get its Hash"
Write-Host "Algorithm used by default: SHA256"

$Hash_Output = (Get-FileHash .\$FileHashed -Algorithm SHA256).Hash

Write-Host "Your file's Hash is $Hash_Output"

$Checksum_Company = Read-Host -Prompt "Enter the Hash/Checksum provided by your company"

Write-Host "Verifying the integrity of the file..."

Timeout /NoBreak 5

$File_Integrity = $Hash_Output -eq "$Checksum_Company".ToUpper()

if($File_Integrity -eq "True") {
	Write-Host "100% Compatible hashes, file integrity is safe."
}
else{
	Write-Host "Incompatible Hashes, recheck the reliability of the file."	
}

