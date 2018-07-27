# Convertin Objects to Another Form

Get-Service | ConvertTo-CSV | Out-File services.csv

# Piping Output to a File

Get-Process | Out-File -FilePath C:\TEMP2\tet.txt -NoClobber
Get-Process | Out-File -FilePath C:\TEMP2\tet.txt -append

# Advantages to Using Export Rather than ConvertTo

Get-Service | Export-CSV Services.csv

# Importing Data

Get-Process | Export-CSV processes.csv
Get-Process | Get-Member

Import-Csv processes.csv | Sort-Object -Descending -Property VM | Select Id, VM, Name -First 10

# Convert From

Get-Content processes.csv | ConvertFrom-CSV | Sort-Object -Property VM -Descending | Select-Object -First 10
ConvertFrom-Csv
ConvertFrom-Json
ConvertFrom-String
ConvertFrom-SecureString
ConvertFrom-SddlString
ConvertFrom-CIPolicy

# Converting, Exporting, and Importing Objects

Get-Process System | ConvertTo-Csv -Delimiter ';' | Out-File process.csv
Notepad process.csv

Get-Process System | Export-Csv process2.csv
Notepad process2.csv

Import-CSV .\process2.csv
gcm convert*
gcm export*