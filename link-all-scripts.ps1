function link
{
	param($file)
	Write-Host $($file.FullName)
	New-Item -ItemType SymbolicLink -Path "~\bin\$($file.Name)" -Target "$($file.FullName)" -Force
}

(Get-Location | Get-ChildItem -File -Recurse -Include "*.ps1" -Exclude "link-all-scripts*") | ForEach-Object { link -file $_ }
