#intro
$x = Get-Service Spooler
$x | GM

# pipeline - by value
Get-Process mspaint | Stop-Process -Verbose
Get-EventLog -LogName System -Newest 5 | Out-GridView
Get-ChildItem | Select-String 'myvar'

Get-Content -Path C:\GitProjects\powershell-kick-off\utils\cities.txt | Sort-Object | Get-Unique 
Get-Content -Path C:\GitProjects\powershell-kick-off\utils\cities.txt | Select-String "Le" | Sort-Object | Get-Unique | Measure-Object
Get-Content -Path C:\GitProjects\powershell-kick-off\utils\cities.txt | Select-String "Le" | Sort-Object | Get-Unique | Measure-Object | Select-Object Count 