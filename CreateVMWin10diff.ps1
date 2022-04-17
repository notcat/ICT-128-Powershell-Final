﻿function Connect-VM
{
  [CmdletBinding(DefaultParameterSetName='name')]

  param(
    [Parameter(ParameterSetName='name')]
    [Alias('cn')]
    [System.String[]]$ComputerName=$env:COMPUTERNAME,

    [Parameter(Position=0,
        Mandatory,ValueFromPipelineByPropertyName,
        ValueFromPipeline,ParameterSetName='name')]
    [Alias('VMName')]
    [System.String]$Name,

    [Parameter(Position=0,
        Mandatory,ValueFromPipelineByPropertyName,
        ValueFromPipeline,ParameterSetName='id')]
    [Alias('VMId','Guid')]
    [System.Guid]$Id,

    [Parameter(Position=0,Mandatory,
        ValueFromPipeline,ParameterSetName='inputObject')]
    [Microsoft.HyperV.PowerShell.VirtualMachine]$InputObject,

    [switch]$StartVM
  )

  begin
  {
    Write-Verbose "Initializing InstanceCount, InstanceCount = 0"
    $InstanceCount=0
  }

  process
  {
    try
    {
      foreach($computer in $ComputerName)
      {
        Write-Verbose "ParameterSetName is '$($PSCmdlet.ParameterSetName)'"

        if($PSCmdlet.ParameterSetName -eq 'name')
        {
              # Get the VM by Id if Name can convert to a guid
              if($Name -as [guid])
              {
			Write-Verbose "Incoming value can cast to guid"
			$vm = Get-VM -Id $Name -ErrorAction SilentlyContinue
              }
              else
              {
			$vm = Get-VM -Name $Name -ErrorAction SilentlyContinue
              }
        }
        elseif($PSCmdlet.ParameterSetName -eq 'id')
        {
              $vm = Get-VM -Id $Id -ErrorAction SilentlyContinue
        }
        else
        {
          $vm = $InputObject
        }

        if($vm)
        {
          Write-Verbose "Executing 'vmconnect.exe $computer $($vm.Name) -G $($vm.Id) -C $InstanceCount'"
          vmconnect.exe $computer $vm.Name -G $vm.Id -C $InstanceCount
        }
        else
        {
          Write-Verbose "Cannot find vm: '$Name'"
        }

        if($StartVM -and $vm)
        {
          if($vm.State -eq 'off')
          {
            Write-Verbose "StartVM was specified and VM state is 'off'. Starting VM '$($vm.Name)'"
            Start-VM -VM $vm
          }
          else
          {
            Write-Verbose "Starting VM '$($vm.Name)'. Skipping, VM is not not in 'off' state."
          }
        }

        $InstanceCount+=1
        Write-Verbose "InstanceCount = $InstanceCount"
      }
    }
    catch
    {
      Write-Error $_
    }
  }

}

$VMName = Read-Host -Prompt 'Input your server  name'
$VMVHDPath = "S:\Scratch\300326858\VHDs\" + $VMName + ".vhdx" # The path to our new VMVHD
$ParentVMVHDPath = "S:\Parent VHD\Windows 10\Windows 10 parent.vhdx" #Base for Differencing Image

New-VHD -ParentPath $ParentVMVHDPath -Path $VMVHDPath -Differencing
Write-Output("Created Differencing Disk with name " + $VMVHDPath)

New-VM -Name $VMName -MemoryStartupBytes 2GB -Generation 2 -BootDevice VHD -VHDPath $VMVHDPath -Switch "External Virtual Switch" 
Set-VMProcessor $VMName -Count 8 -Reserve 10 -Maximum 75
Write-Output("Created VM with name " + $VMName)

Connect-VM -VMName $VMName -StartVM

