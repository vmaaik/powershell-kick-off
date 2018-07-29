# Parameters

$uri = "https://www.collinsdictionary.com/dictionary/english/$word"

# Get data from user

$word = Read-Host " What word would you like to download?"

# Get Web content

$Response = Invoke-WebRequest -Uri $uri 

# Find MP3 URI
$audio3Uri = $Response.AllElements | ?{$_.Class -eq 'hwd_sound sound audio_play_button icon-volume-up ptr'} | select data-src-mp3 | select -first 1 

# Download MP3

$Response = Invoke-WebRequest -Uri $audio3Uri.'data-src-mp3' -OutFile "C:\Users\Michał Gębarowski\Desktop\henrymp3\$word.mp3"

