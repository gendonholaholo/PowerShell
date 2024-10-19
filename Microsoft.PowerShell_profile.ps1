$PROFILE = "C:\Users\fafag\.config\powershell\Microsoft.PowerShell_profile.ps1"

#Aliases
Set-Alias tt tree
Set-Alias ll ls
Set-Alias g git
Set-Alias vim nvim
Set-Alias gosel nvim
Set-Alias lis yt
Set-Alias time "G:\Python Apps\time.ps1"
Set-Alias pot PotPlayerMini64
Set-Alias python C:/Users/fafag/AppData/Local/Programs/Python/Python310/python.exe

# oh-my-posh init pwsh | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\fafag\OneDrive\Documents\PowerShell\myprofile.omp.json' | Invoke-Expression
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDedobbeleer/oh-my-posh/main/themes/atomicBit.omp.json' | Invoke-Expression

#Functions
# function dirsize {
#     Get-ChildItem -Directory | ForEach-Object {
#         $dir = $_
#         $sizeInBytes = (Get-ChildItem -Path $dir.FullName -Recurse -File | Measure-Object -Property Length -Sum).Sum
#         $sizeInKB = $sizeInBytes / 1KB
#         $sizeInMB = $sizeInBytes / 1MB
#         $sizeInGB = $sizeInBytes / 1GB

#         if ($sizeInBytes -lt 1MB) {
#             $size = "{0:N2} KB" -f $sizeInKB
#         } elseif ($sizeInBytes -lt 1GB) {
#             $size = "{0:N2} MB" -f $sizeInMB
#         } else {
#             $size = "{0:N2} GB" -f $sizeInGB
#         }

#         [PSCustomObject]@{
#             Name = $dir.Name
#             Size = $size
#             SizeInBytes = $sizeInBytes
#         }
#     } | Sort-Object SizeInBytes -Descending | Select-Object Size, Name
# }
function whereis{
    param ([string]$command)
    try {
        $path = Get-Command -Name $command -ErrorAction Stop | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
        if ($null -eq $path) {
            throw "Command '$command' tidak ditemukan."
        }
        else {
            return $path
        }
    }
    catch {
        return "Error: blog, '$command' ora ono nyuk."
    }
}
function goto([string]$location){
	$u = "H:\UII"
	$p = "C:\Users\fafag\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
	$d = "$HOME\Downloads"
	$dv = "E:\Developer"

	switch($location){
		"uii"{Set-Location $u}
		"pws"{nvim $p}
		"downloads"{Set-Location $d}
		"dev"{Set-Location $dv}

		default{Write-Host "Lokasi raono nyuk."}
	}
}
function open([string]$arg){
	switch($arg){
		"file"{Start $(fzf)}
		"folder"{Get-ChildItem . -Recurse -Attributes Directory | Invoke-Fzf | Set-Location}
	}
}
function :q{
	Exit
		  }
function p([string]$url){
	ping $url
		  }

#Chocolatey
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1

#Start-up
Import-Module Terminal-Icons
# neofetch
# winfetch
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Vi
# Set-PSReadLineKeyHandler -Key 'Ctrl+a' -Function ViCommandMode
Set-PSReadLineKeyHandler -Key 'Ctrl+p' -Function PreviousHistory
Set-PSReadLineKeyHandler -Key 'Ctrl+n' -Function NextHistory
Set-PSReadLineKeyHandler -Key 'Ctrl+w' -Function BackwardDeleteWord
Set-PSReadLineKeyHandler -Key 'Ctrl+e' -Function NextWord
Set-PSReadLineKeyHandler -Key 'Ctrl+b' -Function BackwardWord
