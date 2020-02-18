# Using VSCode with Gitlab <!-- omit in toc -->

## Table of Contents <!-- omit in toc -->

TODO Finalize the Table of Contents with the formatting and links

Architecture of the Gitlab server
Git Client Installation
    Default installation (Windows)
    Installation Using the Thumbdrive Edition
    Installation on a Linux machine
VSCode IDE Installation
    Default Installation (Windows)
    Installation on a Linux machine
VSCode Configuration
    Extensions
        Through VS Code
        Manual installation of extensions
    Settings
Using VSCode with Git
    Git Clone
    Creating new branch
    Saving changes
    Reviewing changes
    Git commit
    Git Push/Pull
Gitlab 
    Merge request
    CI/CD - Pipeline setup
    CI/CD - Running a Pipeline


## Architecture of the Gitlab server

![alt text](./reference_images/architecture_diagram.jpg "Architecture diagram")

1. Perform the command git clone to the local repository
2. Add the folder to VSCode Workspace
3. Modificaton of source code through VSCode IDE
4. Commit the changes on local repository
5. Push the changes to remote repository, to the Gitlab server
6. Login into the Gitlab server through your web browser
7. Trigger deployment of the source code using Gitlab pipeline
8. New module gets deployed either on TEST environment or PRODUCTION environment

## Git Client Installation

### Default installation (Windows)

__a.__ Open the Start Menu and search "cmd":

![alt text](./reference_images/start_menu_cmd.png "Start Menu search for cmd")

__b.__ Open the command prompt and type the command `git`:

![alt text](./reference_images/cmd_git_command.png "git command in cmd")

__c.__ The two potential outputs you should have are:

- Git successfully installed:

![alt text](./reference_images/cmd_git_output_1.png "Output if git is successfully installed")

- Git is not installed on your system:

![alt text](./reference_images/cmd_git_output_2.png "Output if git is not installed on your system")

If you have this last output, please do the following steps.

__d.__ Go to the following URL: [**Git Downloads**](https://git-scm.com/downloads)

![alt text](./reference_images/git_website.png "Git website")

__e.__ Depending on your operating, click on one of those buttons:

![alt text](./reference_images/git_choice_operating_system.png "Choice of operating system")

__f.__ Let's say you are working on Windows. When you click on the button, git download start automatically. You also have another alternative: 

![alt text](./reference_images/git_download_start.png "Download start - potential alternative")

*Note: I recommend to use the installer downloaded by default. But if you have some access restrictions on your machine you may have to use the alternative, the thumbdrive edition, to be able to have git installed on your machine. The reason is you need system admin permissions to install git. Please refer to the section "__Installation Using the Thumbdrive Edition__" to have more information about this type of installation.*

__g.__ Go to your __Downloads__ folder and execute the git setup. The name of the file is similar to __Git-2.25.0-64-bit.exe__, depending on the version you install.

__h.__ Follow the installation steps:

TODO Fill the installation steps, some of then with screenshots

__f.__ Now git is successfully installed on your machine, we want to check that everything is working fine. Open the Start Menu, search "cmd" and execute the command `git` to see if you have the good output.

![alt text](./reference_images/start_menu_cmd.png "Start Menu search for cmd")

*Note: If you have further questions about git and its commands, please refer to the official documentation here [**Git Reference Manual**](https://git-scm.com/docs)*

### Installation Using the Thumbdrive Edition

Doing that kind of installation you have to setup environment variables additionally.

TODO Fill this section

### Installation on a Linux machine

TODO Fill this section

- Debian - Ubuntu

- Redhat - CentOS

## VSCode IDE Installation

### Default installation (Windows)

__a.__ Go to the following URL: [**VSCode Downloads**](https://code.visualstudio.com/download)

![alt text](./reference_images/vscode_website.png "Visual Studio Code website")

__b.__ Depending on your operating system, click on one of those buttons:

![alt text](./reference_images/vscode_choice_operating_system.png "Choice of operating system")

__c.__ Let's say you are working on __Windows__. When you click on the button, VSCode download start automatically.

*Note: I recommend to use the installer downloaded by default. But if you have some access restrictions on your machine you may have to use the User Installer (just below the Windows button, choose either 64bit or 32bit depending on your environment). In that kind of situation, choose C:\\\\Users\\\\userid\\\\vscode as installation folder.*

__d.__ Follow the installation steps:

TODO Fill the installation steps, some of then with screenshots

__e.__ After successful installation, you can now run __VSCode IDE__. Go to the installation folder and execute __Code.exe__, or seach "*vs code*" in the __Start Menu__.

TODO Add a screenshot for each situation

*Note: If you have further questions about VS Code and its features, please refer to the official documentation here [**VS Code Reference Manual**](https://code.visualstudio.com/docs)*

### Installation on a Linux machine

TODO Fill this scetion

- Debian - Ubuntu

- Redhat - CentOS

## VSCode Configuration

### Extensions

#### Through VS Code

__a.__ Go to the Extensions tab in VS Code and install the extensions you want:

TODO Do a screenshot with a clean VS Code

__b.__ Here is a list of Extensions I recommend you to install:
    - COBOL
    - Date & Time
    - Git Extension Pack
    - Git Blame
    - Todo Tree

*Note: If you have some access restrictions on your machine that does not allowed to install extensions through VS Code, you may have to install them manually. Please follow the steps im the next section.*

#### Manual installation of extensions

__a.__ To install these extensions manually, go the the extensions for VS Code webpage: [**Extensions**](https://marketplace.visualstudio.com/VSCode)
   
![alt text](./reference_images/vscode_extensions_webpage.png "VS Code Extensions webpage")

__b.__ From here you can search for an extension and download the corresponding VSIX file:

![alt text](./reference_images/vscode_cobol_extension_download.png "COBOL Extension Download")

__c.__ To setup a VSIX extension in VS Code, go to the extensions tab, Open the menu and hit the button __Install form VSIX...__:

TODO Do the screenshot with a clean version of VS Code

__d.__ Go to the folder where you downloaded the VSIX file and open it. The extension is now successfully installed!

TODO Add the corresponding screenshot

### Settings

__a.__ Open the menu File, go to __Preferences__ and __Settings__ (You can also just hit the shortcut __CTRL+,__):

TODO Do the screenshot with a clean version of VS Code

__b.__ Search for settings.json and edit the file:

TODO Do the screenshot with a clean version of VS Code

__c.__ Add the following lines to this file 
```json
{
    "files.encoding": "iso88591",
    "files.eol": "\n",
    "git.autofetch": true,
    "editor.tabSize": 4,
    "editor.insertSpaces": true,
    "editor.detectIndentation": false,
    "diffEditor.ignoreTrimWhitespace": false
}
```

__d.__ After the change, save the file and restart VS Code.

## Using VSCode with Git

### Git Clone

__a.__ Press F1 to toggle the command prompt:
   
TODO Do the screenshot with a clean version of VS Code

__b.__ Type __Git Clone__ and then press __Enter__:
 
TODO Do the screenshot with a clean version of VS Code
   
__c.__ It will ask you the repository URL. Use the URL for the Gitlab project.
   
TODO Do the screenshot without customer reference

__d.__ Select the folder where you want to clone the project (under *C:\\\\Users\\\\userid*, you can create a folder __gitrepo__ for instance). This is going to be your __local repository__:

TODO Do the screenshot with a clean version of VS Code
   
__e.__ Finally, you can add the folder to the Workspace. Right click on empty area in __Explorer__ and do __Add Folder to Workspace...__. Select the previously cloned project you want to add:

TODO Do the screenshot with a clean version of VS Code

### Creating new branch

__a.__ Hit the button related to the branch in the bottom left corner:

TODO Do the screenshot with a clean version of VS Code

__b.__ The command prompt appear in the top middle of the window. Create a new branch using your userid first, and then test for instance. Here are good examples of branch names:

- userid-test
- userid-new-cobol-feature
- userid-program_name-ehancement
- ...

TODO Do the screenshot with a clean version of VS Code

### Saving changes

Whenever you make some modifications on a file, you have to save it:

- Situation before saving changes on a file:
  1. White circle next to the filename appears
  2. Number of files which have not been saved gets displayed

TODO Do the screenshot with a clean version of VS Code

- Situation after saving changes on a file:
  1. White circle changed to __X__ (button to close the file in the Editor)
  2. Number of files which have not been committed to the git local repository gets displayed
  3. __M__ which means __Modified__ appears next to the filename in the Explorer

TODO Do the screenshot with a clean version of VS Code

### Reviewing changes

__a.__ To open the Working Tree, you have two options:
    - Click on the dedicated button in the top right corner
    - Double click on the modified file

TODO Add a screenshot for the two options

__b.__ Here is what you can see: 

TODO Add screenshot where I can see addtion, deletion and modification of code

### Git commit

__a.__ On Source Control View, you can see the list of files which have been modified but not have been committed:

TODO Add screenshot where I can see one file modified, one file added, one file deleted and one file I do nothing with it

__b.__ You have multiple options about the changes:
    - __Open__ the file
    - __Discard Changes__ with the __arrow__
    - __Add Changes__ to Stages Changes with the __+__

__c.__ Click on the +.

TODO Add screenshot 

__d.__ Type the commit message just above:

TODO Add screenshot

__e.__ Either Ctrl+Enter or the dedicated button, commit changes to the local repository:

TODO Add screenshot 

Now your local repository is up to date.

### Git Push/Pull

__a.__ Now we want to push our changes to the remote repository, the Gitlab server. As you can see on the screenshot below, there is a change that needs to be pushed:

TODO Add screenshot

__b.__ After the commit, push to make the changes on remote repository to synchronize the code. Hit the __push/pull__ button:

TODO Zoom of the previous screenshot

When the remote repository have changes (another developer added his own changes for instance), you need to pull from remote. Here are the four types of situations you can have:
    - Nothing to push / pull
    - 1 to push / nothing to pull
    - 1 to push / 1 to pull
    - Nothing to push / 1 to pull

TODO Add screenshots for each type of situation

## Gitlab 

### Merge request

__a.__ Since you created your own branch and pushed the changes on it, the Admin Developer has to review your changes before adding them to the master branch of the project. To do that, you have to create a merge request:
    - Open your web browser
    - Go to your Gitlab server
    - Log in
    - Go to the merge request webpage

TODO Add a screenshot for the last step

__b.__ Fill __Title__, __Description__, __Assignee__. Please look at the example below:

TODO Add screenshot

*Note: You can optionally choose to delete your branch after merging. Deleting unnecessary branches is HIGHLY RECOMMENDED for better maintenance*

__c.__ After creating a merge request, you can see that __Merge Request count__ has been added:

TODO Add screenshot

__d.__ As the Admin Developer, you have 3 different type of views if you click on the merge request item:
   - __Discussion__: can leave comments on this thread
   - __Commits__: see all commits for the merge request
   - __Changes__: see the content of the changes

TODO Add screeshots for each situation 

__e.__ If everything is correct, approve the merge request by clicking the __Merge__ button

TODO Add screenshot

__f.__ After merging, leave a "*merge completion*" message and close the request:

TODO Add screeshot

### CI/CD - Pipeline setup

__a.__ Make sure you have a file called ".gitlab-ci.yml" in your project, this is a configuration file for the pipeline.

TODO Add screenshot

*Note: If you don't have that file in your project but the Gitlab server contains other projects that have tghat file, take it from there and modify the variables depending on your environment.*

__b.__ Go to __Settings__, then __CI/CD__. Enable pipeline runners for your project:

TODO Add screenshot

__c.__ In __ops__ project, there is a __profile__ folder which contain one folder for each project, named same as these projects:
   
TODO Add screenshot

__d.__ There are 4 different variables in profile you may change:
    - __BUILD_SCRIPT__: build script being used during pipeline running	(build scripts are in the scripts folder in __ops__ project)
    - __BUILD_INCLUDE__: you can include copybooks for the compilation
    - __BUILD_INSTALL__: installation destination for the target
    - __BUILD_OPTION__: additional options

TODO Add screenshots with several examples, specifically if you have multiple options you use a comma (:) to separate the options

### CI/CD - Running a Pipeline

__a.__ When you are in your project, click __CI/CD__ and then __Pipelines__.
   
TODO Add screenshot   

__b.__ Then click __Run Pipeline__.
   
__c.__ You now have to set up pipeline variables:
    - Run for: choice of the branch of the project you want5 to use to run the pipeline
    - SERVER: either TEST or PROD, depending on which server you want to deploy the code
    - SOURCE: source code you want to compile and then deploy
    - PROFILE: must be predefined in ops project 

TODO Add screenshot

__d.__ Then click __Run Pipeline__ at the bottom of the list of the variables.

TODO Add screenshot

__e.__ Check if the pipeline is successful or not:

TODO Add screenshot for success (and its log), another one for failed (and its log)


