# asdf-java

[![Build status](https://github.com/halcyon/asdf-java/workflows/asdf-java%20Tests/badge.svg?branch=master)](https://github.com/halcyon/asdf-java/actions?query=workflow%3A%22asdf-java+Tests%22+branch%3Amaster) [![travis ci](https://travis-ci.org/halcyon/asdf-java.svg?branch=master)](https://travis-ci.org/halcyon/asdf-java) [![Join the chat at https://gitter.im/asdf-java/community](https://badges.gitter.im/asdf-java/community.svg)](https://gitter.im/asdf-java/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[Java](https://www.java.com/en/) plugin for the [asdf](https://github.com/asdf-vm/asdf) version manager.

## Requirements
- [bash v5.0](https://www.gnu.org/software/bash/)
- [curl](https://curl.haxx.se/)
- [sha256sum](https://www.gnu.org/software/coreutils/) (only on Linux)
- [unzip](http://infozip.sourceforge.net/UnZip.html)
- [jq](https://stedolan.github.io/jq/) (only for updating the release data)

## Install

```
asdf plugin add java
```

## Use

Check [asdf](https://asdf-vm.github.io/asdf/) for instructions on how to install & manage versions of Java.

## Install new Java version

List candidate JDKs:

`asdf list-all java`

Install a candidate listed from the previous command like this:

`asdf install java adoptopenjdk-12.0.2+10.1`

Select an installed candidate for use like this:

`asdf global java adoptopenjdk-12.0.2+10.1`

## JAVA_HOME
To set JAVA_HOME in your shell's initialization add the following:

### Bash
`echo ". ~/.asdf/plugins/java/set-java-home.bash" >> ~/.bashrc`

### Zsh
`echo ". ~/.asdf/plugins/java/set-java-home.zsh" >> ~/.zshrc`

### Fish
```
mkdir -p ~/.config/fish/functions/
ln -s ~/.asdf/plugins/java/set-java-home.fish ~/.config/fish/functions/asdf_update_java_home.fish
echo "asdf_update_java_home" >> ~/.config/fish/config.fish
```
_the mkdir is only needed in case you didn't add any functions yet_

### Xonsh
`echo "source ~/.asdf/plugins/java/set-java-home.xsh" >> ~/.xonshrc`

## macOS

### `JAVA_HOME` integration

Some applications in macOS use `/usr/libexec/java_home` to set java home.

Setting java_macos_integration_enable to yes on `.asdfrc` file enables this integration.

```
java_macos_integration_enable = yes
```

_Note: Not all distributions of Java JDK packages offer this integration (e.g. liberica). This option only works for packages that **do offer** that integration._

### Apple Silicon integration

If you have an Apple Silicon mac, then you can choose to run either an `arm64` JVM natively, or an `x86_64` JVM under Rosetta translation. If you run the command `arch`, it will print either `arm64` (which means you are running natively) or `x86_64` (which means you are running under Rosetta translation).

When you run `asdf list all java`, it lists only the VMs which are available for the architecture you are currently running under. To switch your terminal from native ARM to Rosetta use `arch -x86_64 /bin/zsh`.
