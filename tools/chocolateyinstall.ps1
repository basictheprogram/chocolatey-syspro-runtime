$ErrorActionPreference = 'Stop';

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  silentArgs    = '/S /v/qn'
  url           = 'http://gold-images.int.celadonsystems.com/SYSPRO/SYSPRO7_Update1_2016 - Lucy/SYSPRO/ISSetupPrerequisites/{704F9975-E977-4AEB-BF57-6E5D6EDB6781}/SYSPRO Runtime 32-bit.exe'
  url64         = 'http://gold-images.int.celadonsystems.com/SYSPRO/SYSPRO7_Update1_2016 - Lucy/SYSPRO/ISSetupPrerequisites/{68AC2C62-2E32-49D5-BE62-FFBDFB8B002E}/SYSPRO Runtime 64-bit.exe'
  softwareName  = 'syspro-runtime'

  # SYSPRO Runtime 32-bit.msi
  checksum      = '136fe58cb8f11b8d0702502e978f0f8a8986d2614ceef5a8d79649c20d9c745e'
  checksumType  = 'sha256'

  # SYSPRO Runtime 64-bit.msi
  checksum64    = '63cb9cec570d4c8242189f17c4a03546eef4fa3e4c1da2c6dc4626dd59522787'
  checksumType64= 'sha256'
}

# https://chocolatey.org/docs/helpers-install-chocolatey-install-package
#
Install-ChocolateyPackage @packageArgs
