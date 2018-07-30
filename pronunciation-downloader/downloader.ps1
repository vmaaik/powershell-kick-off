<#
 .SYNOPSIS
   
 .DESCRIPTION

 .PARAMETER uri

 .PARAMETER $outputPath
   
#>

param(
 [Parameter(Mandatory=$true)]
 [string]
 $outputPath,
 
 [string]
 $uri = "https://www.collinsdictionary.com/dictionary/english"
)

#******************************************************************************
# Script body
# Execution begins here
#******************************************************************************

DO{

# Get data from user

$word = Read-Host "`nWhat word would you like to download?`n"

# Get Web content

    Write-Host "Checking if given word exists in Collins Dictionary...`n"
    $Response = Invoke-WebRequest -Uri "$uri/$word"
    $isResult = ($Response.AllElements |?{$_.Class -eq 'content-box' }| select innerText) -like "*Sorry, no results for*"

If($isResult)
{
    Write-Host "Unable to download word $word from collinsdictionary.com. Check if word has been typed correctly" -ForegroundColor Red
    Continue
}
else
{
    Write-Host "Word $word has been found in dictionary" -ForegroundColor Green
}

# Find MP3 URI

$mp33UriContent = $Response.AllElements | ?{$_.Class -eq 'hwd_sound sound audio_play_button icon-volume-up ptr'} | select data-src-mp3 | select -first 1 
$mp33Uri = $mp33UriContent.'data-src-mp3'

# Convert to WAV

Write-Host "Converting mp3 file to wav...`n"
$content = Invoke-WebRequest "http://api.rest7.com/v1/sound_convert.php?url=$mp33Uri&format=wav&format=wav"
$wavUri = $content.Content.toString().Replace('{"file":',"").substring(1, 118).Replace("\/\/", "//").Replace("\/","//")

# Download WAV

Write-Host "Saving file in $outputPath... `n"
Invoke-WebRequest $wavUri -OutFile "$outputPath\$word.wav"
Write-Host "File $word.wav has been successfully downloaded and saved in $outputPath `n" -ForegroundColor Green
Write-Host "In order to download it again use the following link $mp33Uri `n" 

Write-Host "Would you like to continue?" -ForegroundColor Yellow

$answer = Read-Host "(y / n)"

Switch ($answer) 
     { 
       Y {$continue=$true} 
       N {$continue=$false}
     } 

}While($continue)