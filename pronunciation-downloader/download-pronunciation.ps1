<#
 .SYNOPSIS
   
 .DESCRIPTION

 .PARAMETER uri

 .PARAMETER $outputPath
   
#>

param(
 [string]
 $uri = "https://www.collinsdictionary.com/dictionary/english",

 [string]
 $outputPath = "C:\Users\Michał Gębarowski\Desktop\henrymp3"
)

#******************************************************************************
# Script body
# Execution begins here
#******************************************************************************



DO{

# Get data from user
$word = Read-Host " What word would you like to download?" 

# Get Web content
Write-Host "Checking if given word exists in Collins Dictionary...`n"
$Response = Invoke-WebRequest -Uri "$uri/$word"

# Find MP3 URI

$mp33UriContent = $Response.AllElements | ?{$_.Class -eq 'hwd_sound sound audio_play_button icon-volume-up ptr'} | select data-src-mp3 | select -first 1 
$mp33Uri = $mp33UriContent.'data-src-mp3'
Write-Host "Converting mp3 file to wav...`n" 

# Convert to WAV

$content = Invoke-WebRequest "http://api.rest7.com/v1/sound_convert.php?url=$mp33Uri&format=wav&format=wav"
$wavUri = $content.Content.toString().Replace('{"file":',"").substring(1, 118).Replace("\/\/", "//").Replace("\/","//")

# Download WAV

Write-Host "Saving file in $outputPath... `n"
Invoke-WebRequest $wavUri -OutFile "$outputPath\$word.wav"
Write-Host "File $word.wav has been successfully downloaded and saved in $outputPath `n" -ForegroundColor Green
Write-Host "In order to dowload it again use the following link $mp33Uri `n" 

Write-Host "Would you like to continue?" -ForegroundColor Yellow

$answer = Read-Host "(y / n)"

Switch ($answer) 
     { 
       Y {$continue=$true} 
       N {$continue=$false}
     } 

}While($continue)