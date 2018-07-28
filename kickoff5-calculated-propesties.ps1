# Calculated Properties

#intro

Get-Process | more
Get-Process | Select-Object -Property Name, VM, PM -First 10
Get-Process | Select-Object -Propert Name, @{name= "MEMO"; e={ '{0:N2}' -f ($PSItem.VM / 1MB)}}, PM -First 10
Get-Process | Select-Object -Propert Name, @{name= "MEMO"; e={$PSItem.VM/1MB}}, PM -First 10

Get-Content -Path .\utils\Cities.txt | Select-Object @{name='Lenght' ; e={$PSItem.GetType()}}
$city = New-Object -TypeName psobject
$cities = Get-Content -Path .\utils\Cities.txt 
foreach ($city in $cities){
$city | Add-Member -MemberType NoteProperty -Name CityName -Value @{name= "MEMO"; e={$PSItem.BaseObject}}
}

Get-Service | Select-Object -Property @{Name = 'Name'; Expression = {$_.Name}}
Get-ChildItem .\utils\Cities.txt | Select-Object -Property Name, @{label = 'FileSize'; expression = { $_.Length/1KB }}