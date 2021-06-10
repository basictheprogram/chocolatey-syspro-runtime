$ErrorActionPreference = 'Stop';

$data = & (Join-Path -Path (Split-Path -Path $MyInvocation.MyCommand.Path) -ChildPath data.ps1)
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    silentArgs     = '/S /v/qn'
    url            = $data.url
    url64          = $data.url64
    softwareName   = 'syspro-runtime'

    # SYSPRO Runtime 32-bit.msi
    checksum       = $data.checksum
    checksumType   = $data.checksumType

    # SYSPRO Runtime 64-bit.msi
    checksum64     = $data.checksum64
    checksumType64 = $data.checksumType64
}

# https://chocolatey.org/docs/helpers-install-chocolatey-install-package
#
Install-ChocolateyPackage @packageArgs
