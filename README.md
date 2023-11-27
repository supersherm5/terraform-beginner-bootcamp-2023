# Terraform Beginner Bootcamp 2023

See [Semver](https://semver.org)
Given a version number MAJOR.MINOR.PATCH, increment the:

- *MAJOR* version when you make incompatible API changes
- *MINOR* version when you add functionality in a backward compatible manner
- *PATCH* version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## Install Terraform CLI
  
### Consideration wi the Terragorm CLI changes

The Terrraform CLI installation instructions have chnged due to gpg keyring changes.  So We needed refer to the latest install CLI instructions via Terraform Documentation and change the scripting for install.

[How to install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Refactoring into bash scripts

While fixing the Terraform CLI gpg deprecation issues, we noticed that bash scripts steps were a considerable amount of code. So we decided to create a bash script to install the Terraform CLI.**Bash Script to install Terraform CLI**: [Terraform install script](./bin/install_terraform_cli.sh)

- This will keep the Gitpod Task File, located [Gitpod Task File](.gitpod.yml), tidy.
- This allow us an easier to debug and execute manually Terraform CLI install.
- This will allow beter portability for other project that nee to install Terraform CLI.

### Considerations for Linux Distibution

This project uses Ubuntu. Please consider checking your Linux Disto to see if changes will be needed.

[How To check OS version in Linux CLI](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line)

Example of Linux OS checking:

```sh
$ cat /etc/os-release
NAME="Ubuntu"
VERSION="20.04.1 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.1 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal

```

#### Shebang Considerations

A Shebang tells the bash script what program that willl interpet the script. eg. `#!/bin/bash`

Using `#!/usr/bin/env bash` is recommended for:

- portability for different OS distros
- will search the user's $PATH

[Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))

#### Execution Considerations

When executing the bash script we can use the `./` shorthand notation to execute the bash script.

eg. `./bin/installl_terraform/cli`

if we are using a script in .gipgod.yml we need to point to ascript to a program to interpret it.

eg. `source ./bin install_terraform_cli`

#### Linux Permissions Considerations

In order to make our bash scripts executable, we need to change linux permissions for the fix to be executable at the user mode.

```sh
chmod u+x ./bin/install_terraform_cli
```

alternatively:

```sh
chmod 744 ./bin/install_terraform_cli
```

[Chmod](https://en.wikipedia.org/wiki/Chmod)

### Gitpod Lifecycle (Before, Init, Command)

We need to be careful when using the Init because it will not rerun if we restart an existing workspace.

[Gitpod Workspaces](https://www.gitpod.io/docs/configure/workspaces/tasks)
