function Alias-Touch($file_name) {
    New-Item $file_name
}


function Alias-Mine {
    cd $env:USERPROFILE\eth
    .\mine.bat
}


function Alias-Vim($file_name) {
    bash -c "vim $file_name"
}


function Alias-Reboot {
    Restart-Computer
}


Set-Alias touch Alias-Touch
Set-Alias mine Alias-Mine
Set-Alias vim Alias-Vim
Set-Alias reboot Alias-Reboot

