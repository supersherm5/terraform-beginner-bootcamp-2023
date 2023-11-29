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

### Working with Env Vars

#### env command

We can list out all ENv VArs using the `env` command

We can filster spedific env vars using grep eg. `env | grep AWS_`

#### Setting and Unsetting Env Vars 

In the termain we can set using `export HELLO='world'`

in the terminal  we unset using `unset HELLO`

We can set an env var temporarily when  just running a command

```sh
HELLO='world' ./bin/print_message
```
Within a bsh script we can set env without writing wxport eg.

```sh
!#/usr/bin/env bash
HELLO='world
echo $HELLO
```

#### Printing Vars 

We can print an env var using echo eg. `echo $Hello`

#### Scoping of Env Vars

When you open up new bash terminals in VSCode it will not be ware of env vars that have set in another window.

#### Persisting Env Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storages

```
gp env Hello='world'
```

All future worksapces launched will set the envvaars for all bash terminals in the open workspace

### AWS CLI Installation

AWS CLI is installed for the proecct via the bash script [./bin/install_aws_cli.sh](./bin/install_aws_cli.sh)

[Getting Started Install (AWS-CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-version.html)

We can verify if AWS Creds are configured correctly by running following AWS CLI command:

```sh aws sts get-caller-identity```

If it's successful, it should return a json something like this:

```json
{
    "UserId": "SomeAccountId",
    "Account": "1234567890",
    "Arn": "arn:aws:iam::1234567890:user/terraform-bootcamp"
}
```

We'll need to generate AWS CLI creds from IAM User to use AWS CLI.

## Terraform Basics

### Terraform Registry

Terraform soruces their providers and modules from the Terraform registry which located at [Terraform Registry](https://registry.terraform.io)

- **Providers** is an interface to APIs that will allow to create resoures
- **Modules** are a way to make large amounts of terraform code modular, portable, and shareable.

[Provider named random](https://registry.terraform.io/providers/hashicorp/random/latest)

### Terraform Console

We can see a list of all the Terraform commands by simply typing `terraform`

#### Terraform Init

At the start of a new terraform project we will run `terraform init` to download the binaries for the terraform providers we will use in the project.

#### Terrafomr Plan

This will geerate out a changeset, about the state of our infrastructiure and what will bechanged.

We can ouput this changeset ie. "plan" to be passed to an apply, but often you can just ignore outputting.

#### Terraform Apply 

1
`terraform apply`

This will run a plan and pass the changeset to be execute by terraform.  Apply should prompt yes or no.

If we want to automaticall approve an apply we can provide the auto approe flag eg. `terrafrom apply --auto-approve`

#### Terraform Destroy

`terraform destroy`

This will destroy, or erase resources.

### Terraform Lock Files

`.terraform.lock.hcl` contans the locked versioning for the providers or modules that should be used with theis project.

The Terrafor Lock File **should be commited** to your VCS, eg. Github

### Terraform State Files

`.terraform.tfstate` contain finformations aout the current state of your infrastructure.

This file **shuld not be commited** to your VCS.

This file cN CONTAIN SENSENTIVE DATA.

If you lose this file, you lose knowning the state of your infrastructure.

`.terraform.tfstate.backup` is the previous state file state.

### Terraform Directory

`.terraform` directoury contains binaries of terraform providers.