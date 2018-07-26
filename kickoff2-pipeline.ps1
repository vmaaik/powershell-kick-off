# PIPELINE
# Intro

$x = Get-Service Spooler
$x | GM

Get-Process mspaint | Stop-Process -Verbose
Get-EventLog -LogName System -Newest 5 | Out-GridView
Get-ChildItem | Select-String 'myvar'
Get-Content -Path C:\GitProjects\powershell-kick-off\utils\cities.txt | Sort-Object | Get-Unique 
Get-Content -Path C:\GitProjects\powershell-kick-off\utils\cities.txt | Select-String "Le" | Sort-Object | Get-Unique | Measure-Object
Get-Content -Path C:\GitProjects\powershell-kick-off\utils\cities.txt | Select-String "Le" | Sort-Object | Get-Unique | Measure-Object | Select-Object Count

# Sorting Objects on a Property

Get-Service | Sort Status, Name -Descending
Get-Service | Sort-Object -Property @{Expression = "Status"; Descending = $true}, @{Expression ="DisplayName"; Descending = $false}
help Sort-Object
Get-Process | Sort-Object -Property id -Descending

# Alias

gps  | sort id
Get-Alias -Definition get-service 
gsv | sort name

# Measuring and Selecting Objects

Get-Service | Measure
gps | measure -Property VM -Average

# EX1 To select the first 10 processes based on the lowest virtual memory usage:

gps | Sort-Object -Property VM | Select-Object -First 10
 
# EX2 To select the 5 processes using the most amount of CPU, but skipping the one process using the most CPU:

gps | sort -Property CPU -Descending| select -First 5 -Skip 1
gps | get-member | sort Name | select name, MemberType | select -First 10

# EX3 Create a report with the 10 most recent System event log entries that includes the Instance ID, time written, and event message

Get-Alias -Definition Get-Event
Get-EventLog -logname System | Select-Object -First 1 | Get-Member

Get-EventLog -logname System | 
Select-Object -First 10 -property InstanceID, TimeGenerated , Message | 
Format-Table -Wrap | Out-File report.txt

