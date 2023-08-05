 <#
        .SYNOPSIS
        Find basic hardware information and display it on screen

        .DESCRIPTION
        Finds hardware info including ram manufacturer and SN

        .PARAMETER Name
            Options; 1, 2, 3, 4, 5, 0

        .OUTPUTS
        Only Write-Host outputs

        .EXAMPLE
        PS> extension -name "File"
        File.txt

        .EXAMPLE
        PS> Press 1 to find RAM info

        InterleavePosition : 2
        Caption            : Physical Memory
        DeviceLocator      : DIMM B
        FormFactor         : 12
        Manufacturer       : 029E000080AD
        MaxVoltage         : 1200
        PartNumber         : CMSX16GX4M2A2400C16 
        SerialNumber       : 00000000
        Speed              : 2400

    #>


function Get-Info{

    $choice = Read-Host "`n`nPress 1 to find RAM info`nPress 2 to find CPU info`nPress 3 to find System info`nPress 4 to find DISK info`nPress 5 to find GPU info`nPress 0 to EXIT`n`n"

    if ($choice -eq 1){

        Write-Host "`n******RAM INFO ******`n"
        Get-WmiObject Win32_PhysicalMemory | Select-Object InterleavePosition,Caption,DeviceLocator,FormFactor,Manufacturer,MaxVoltage,PartNumber,SerialNumber,Speed,PSComputerName
        Write-Host "`n******RAM INFO ******`n"
        Get-Info
        

    }ElseIf ($choice -eq 2){

        Write-Host "`n******CPU INFO******`n"
        Get-WmiObject -Class Win32_Processor
        Write-Host "`n******CPU INFO******`n"
        Get-Info
        

    }ElseIf ($choice -eq 3){

        Write-Host "`n******COMPUTER INFO******`n"
        Get-ComputerInfo | Select-Object WindowsProductname,WindowsVersion,CsCaption,CsDNSHostName,CsModel,CsProcessors,CsUserName
        Write-Host "`n******COMPUTER INFO******`n"
        Get-Info


    }ElseIf ($choice -eq 4){

        Write-Host "`n******DISK INFO******`n"
        Get-PhysicalDisk | ft -AutoSize DeviceId,Model,MediaType,BusType
        Write-Host "`n******DISK INFO******`n"
        Get-Info
        

    }ElseIf ($choice -eq 5){

        Write-Host "`n******GPU INFO******`n"
        Get-WmiObject Win32_VideoController | Select-Object AdapterCompatibility,Caption,VideoModeDescription
        Write-Host "`n******GPU INFO******`n"
        Get-Info
        

    }ElseIf ($choice -eq 0){

        Write-Host "`n******GOODBYE******`n"
        Return


    }ElseIf ($choice -gt 5 -or $choice -lt 0){
        Write-Host "`n******RETRYING******`n"
        Get-Info
    }

}

Get-Info
