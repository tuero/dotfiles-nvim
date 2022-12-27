# Personal Neovim Config

## Install
Name this folder as `nvim`, and copy/paste into `.config`. 
Run `nvim` to let the packages download and install. 
May need to run `:PackerInstall`.

For Python debugging, create a virtualenv and run
```
pip install debugpy
```

Make sure when `nvim` is being run, its inside the venv which contains `debugpy`.

### Mac
Debugger for mac is `lldb-mi`, which is no longer part of `lldb`. 
Need to install from source and move `lldb-mi` binary to `/usr/local/bin/`.


An aside note, if xcode updates, it might ruin your compile include paths.
Place the following into `bash_profile`:
```
export SDKROOT=`xcrun --show-sdk-path`
```
