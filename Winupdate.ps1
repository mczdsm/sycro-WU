$os = (Get-WMIObject win32_operatingsystem).name

echo $os

#don't upgrade Windows 7/8

if ($os -Match "Windows 10") {

$dir = "c:\temp"

mkdir $dir

$webClient = New-Object System.Net.WebClient

$url = "https://go.microsoft.com/fwlink/?LinkID=799445"

$file = "$($dir)\Win10Upgrade.exe"

$webClient.DownloadFile($url,$file)

Start-Process -FilePath $file -ArgumentList "/quietinstall /skipeula /auto upgrade /copylogs $dir"

}
