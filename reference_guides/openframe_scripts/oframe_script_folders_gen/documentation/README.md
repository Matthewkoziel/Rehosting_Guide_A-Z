# How to use oframe_script_folders_gen

## Description

__oframe_script_folders_gen__ is a simple script which create multiple folders for custom scripts and add these folders to oframe bash profile ( environment variable PATH) for easy execution. Most of the time when you create scripts you place them in the __bin folder__ or the __pre-existing scripts folder__. Then, what you create is mixed with the default scripts that come with the installation. This script solves this problem with folders dedicated to this purpose. Right now, it creates only two folders:

- *$OPENFRAME_HOME/scripts/custom*
- *$JEUS_HOME/scripts*

After folder creation, if you already have some custom scripts you want to use, this can be copied over these new folders for you. You just need to put them under:

- *$HOME_DIRECTORY/tmaxsw/scripts/openframe*
- *$HOME_DIRECTORY/tmaxsw/scripts/jeus/jeus7*

Once you execute the script, the shell will prompt some information for successful folder generation. You can find an example of this output here:

<img src="../source/output.png" title="Output">

## Setup

To make sure that the script is working in your Linux environment, you may need to run the command: `dos2unix oframe_script_folders_gen.sh`

## Usage

Please run with the . instead of sh:
```bash
. oframe_script_folders_gen.sh
```

## Link to Source

You can find the source code here: [source](../source/oframe_script_folders_gen.sh)