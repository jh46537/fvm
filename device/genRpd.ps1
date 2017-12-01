param([string]$inputSof, [string]$outputRpd)

$scriptPath = Split-Path -parent $PSCommandPath;

$pofTemplate = $PSScriptRoot+"\genRpd_pofTemplate.cof";
$rpdTemplate = $PSScriptRoot+"\genRpd_rpdTemplate.cof";

$pofFile = ".\pof.cof";
$rpdFile = ".\rpd.cof";

$alteraDir = $env:QUARTUS_ROOTDIR+"\bin64\";

if(-not $inputSof) {
	Write-Host ".\genRpd.ps1 -inputSof <path to Project.sof> -outputRpd <path to output file, default output_file.rpd>";
	Exit;
}

# Make sure temp files are all deleted


# Convert relative path to full path
$inputSof = Resolve-Path $inputSof;

# Convert forward-slashes to back-slashes to satisfy Quartus
$inputSof = $inputSof -replace '\\', '/';

Write-Host "Input SOF: " $inputSof;
Write-Host "SOF->POF template: " $pofTemplate;
Write-Host "POF->RPD template: " $rpdTemplate;
Write-Host;

###### Generate sof -> pof .cof file

$tmp = Get-Content $pofTemplate;
$pof = @();

foreach($line in $tmp) {
	$line = $line -replace "INSERT_SOF_PATH_HERE", $inputSof;
	$pof += $line;
}

# Touch file to clear it
Out-File $pofFile;

# Write array to file. Note the encoding must be "Default" or else there are weird errors.
$pof | Out-File -Encoding "Default" $pofFile;

# Perform sof -> pof conversion
$cmd = $alteraDir+"\quartus_cpf -c "+$pofFile;
Invoke-Expression $cmd;



###### Generate pof -> rpd .cof file

$tmp = Get-Content $rpdTemplate;
$rpd = @();

foreach($line in $tmp) {
	$line = $line -replace "INSERT_POF_PATH_HERE", "./output_file.pof";
	$rpd += $line;
}

# Touch file to clear it
Out-File $rpdFile;

# Write array to file. Note the encoding must be "Default" or else there are weird errors.
$rpd | Out-File -Encoding "Default" $rpdFile;

# Perform pof -> rpd conversion
$cmd = $alteraDir+"\quartus_cpf -c "+$rpdFile;
Invoke-Expression $cmd;

if($outputRpd) {
    $inputFile = $scriptPath+"\output_file.rpd"
    Move-Item $inputFile $outputRpd
}