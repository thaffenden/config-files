# config-files
Config files for programs used on multiple computers.

ConEmu: ConEmu.xml  
PyCharm: settings.jar 
Oh-my-zsh: .zshrc 


## Using .zshrc
To use ensure the `.zshrc` file is always up to date with any changes made, create a symlink in your home directory to the file in thsi git project. e.g.:

```sh
ln -s full/path/to/this/repo/.zshrc ~/.zshrc
```

