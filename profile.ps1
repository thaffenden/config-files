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

function Alias-Activate-Python-Environment {
    .\Scripts\activate.ps1
}


function Alias-SymbolicLink($file, $link_path) {
    New-Item -ItemType SymbolicLink -Name $file -Target $link_path
}

function Alias-Auto($command) {
    $current_dir = (Get-Item -Path ".\" -Verbose).FullName
    Write-Host $current_dir
    Write-Host $command

    if ($VIRTUAL_ENV) {
        $current_env = $VIRTUAL_ENV
        deactivate
    }
    else {
        $current_env=$null
    }

    cd $HOME\git\auto-remote-terminal
    .\Scripts\activate.ps1
    python auto_remote.py send --message=$command
    deactivate

    if ($current_env) {
        cd $current_env
        .\Scripts\activate.ps1
    }
    cd $current_dir

}


Set-Alias touch Alias-Touch
Set-Alias mine Alias-Mine
Set-Alias vim Alias-Vim
Set-Alias reboot Alias-Reboot
Set-Alias auto Alias-Auto
Set-Alias l ls
Set-Alias ln Alias-SymbolicLink
Set-Alias sba Alias-Activate-Python-Environment
