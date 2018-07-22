#Print

Write-Host "Powershell kickoff"
Write-Host -ForegroundColor Yellow "Powershell kickoff"
Write-Host -BackgroundColor Blue -ForegroundColor Yellow "Powershell kickoff"
#help Clear-Host -online
#help pwd

#varibles. 
#The answer provided will depend on the type of the first variable listed

[int]$a = 900
[int]$b = 1000
[double]$c = 9.0
$a+$b
$a+$c

[int] $d = 3.4 + 3.6
$d

#string

$a.GetType().Name

Read-Host "What is your name:"
$name=read-host "What is your name:"

$myvar = 5
$myvar.GetType()

$myvar = $myvar + 0.4
$myvar.GetType()

$myvar = "test" + $myvar
$myvar.GetType()

$var1 = "cheese"

$var1.Length
$var1[4]

#remove variable effectively

$var1
$var1 = $null
$var1

#arrays

$city = ("Leeds", "London", "Dundee", "Aberdeen")
$city[1]
$city.Length

$myarray = Get-ChildItem
$myarray
$myarray[99]

#hashes

$pops = @{"Glasgow"=92332; "London"=322323; "Leeds"=12213}
$pops

$pops.Add("Bradfort", 344442)

$pops
$pops.London

#$city = Read-Host "Enter Scottish city:" 
$pops.$city