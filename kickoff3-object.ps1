cls 
$object = New-Object -TypeName PSObject
#$object | Get-Member

$adminPasswordStatus = $null
$thermalState        = $null
$osInfo = Get-CimInstance Win32_OperatingSystem
$comuterInfo = Get-CimInstance Win32_ComputerSystem
$diskInfo = Get-CimInstance Win32_LogicalDisk

# ADD MEMBER
$object | Add-Member -MemberType NoteProperty -Name ComputerName -Value $comuterInfo.Name
$object | Add-Member -MemberType NoteProperty -Name ObjectName -Value 'NEW-OBJECT WITH ADD-MEMBER'
$object | Add-Member -MemberType NoteProperty -Name OS -Value $osInfo.Caption
$object | Add-Member -MemberType NoteProperty -Name 'OS Version' -Value $("$($osInfo.Version) Build $($osInfo.BuildNumber)")
$object | Add-Member -MemberType NoteProperty -Name Domain -Value $comuterInfo.Domain
$object | Add-Member -MemberType NoteProperty -Name Workgroup -Value $comuterInfo.Workgroup
$object | Add-Member -MemberType NoteProperty -Name DomainJoined -Value $comuterInfo.Workgroup
$object | Add-Member -MemberType NoteProperty -Name Disks -Value $diskInfo
$object | Add-Member -MemberType NoteProperty -Name AdminPasswordStatus -Value $adminPasswordStatus
$object | Add-Member -MemberType NoteProperty -Name ThermalState -Value $thermalState

$object
#$object.Disks

# HASHTABLE (unordered)

[hashtable]$objectProperty = @{}
$objectProperty.Add('ObjectName', 'HASHTABLE USING ADD METHOD')
$objectProperty.Add('ComputerName', $comuterInfo.Name)
$objectProperty.Add('OS',$osInfo.Caption)
$objectProperty.Add('OS Version',$("$($osInfo.Version) Build $($osInfo.BuildNumber)"))
$objectProperty.Add('Domain',$computerInfo.Domain)
$objectProperty.Add('Workgroup',$computerInfo.Workgroup)
$objectProperty.Add('DomainJoined',$computerInfo.PartOfDomain)
$ObjectProperty.Add('Disks',$diskInfo)
$objectProperty.Add('AdminPasswordStatus',$adminPasswordStatus)
$objectProperty.Add('ThermalState',$thermalState)

$object2 = New-Object -TypeName psobject -Property $objectProperty

$object2 | Select-Object ComputerName, OS
$object2

# HASHTABLE (ordered)

$objectProperty2 = [ordered]@{
    ComputerName        = $computerInfo.Name
    ObjectName          = 'ORDERED HASHTABLE'
    OS                  = $osInfo.Caption
    'OS Version'        = $("$($osInfo.Version) Build $($osInfo.BuildNumber)")
    Domain              = $computerInfo.Domain
    Workgroup           = $computerInfo.Workgroup
    DomainJoined        = $computerInfo.PartOfDomain
    Disks               = $diskInfo
    AdminPasswordStatus = $adminPasswordStatus
    ThermalState        = $thermalState
}

$object3 = New-Object -TypeName psobject -Property $objectProperty2

$object3

