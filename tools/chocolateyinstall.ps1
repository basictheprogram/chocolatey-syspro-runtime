$ErrorActionPreference = 'Stop'; # stop on all errors

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation   = Join-Path $toolsDir 'SYSPRO Runtime 32-bit.msi'
$fileLocation64 = Join-Path $toolsDir 'SYSPRO Runtime 64-bit.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI' 
  file          = $fileLocation
  file64        = $fileLocation64
  softwareName  = 'syspro-runtime*'

  # Checksums are now required as of 0.10.0.
  #
  # SYSPRO Runtime 32-bit.msi
  checksum      = '22b025522196abc3097b76d6d5e4c803c77cc7f9612d3b6c3e3923e11f606933'
  checksumType  = 'sha256'
  # SYSPRO Runtime 64-bit.msi
  checksum64    = 'c62d19c9daa17378803c3dd1f7938ab5acc821378dcf574ef060ae78da0846b0'
  checksumType64= 'sha256'

  # MSI
  # "\\server\Deploy\SYSPRO\ISSetupPrerequisites\{704F9975-E977-4AEB-BF57-6E5D6EDB6781}\SYSPRO Runtime 32-bit.exe" /v"/qr"
  # "\\server\deploy\syspro\ISSetupPrerequisites\{68AC2C62-2E32-49D5-BE62-FFBDFB8B002E}\SYSPRO Runtime 64-bit.exe" /v"/qr"
  #
  # MST-files are being applied by Windows Installer while it is installing an MSI-file. This is done with a command like this:
  # msiexec /qb /i AdbeRdr1010_de_DE.msi TRANSFORMS=AdbeRdr1010_de_DE.mst
  #
  #silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  silentArgs     = ' /v"qr" TRANSFORMS=SYSPRO Runtime.mst'
  validExitCodes= @(0, 3010, 1641)
}

# https://chocolatey.org/docs/helpers-install-chocolatey-install-package
#
Install-ChocolateyInstallPackage @packageArgs 
