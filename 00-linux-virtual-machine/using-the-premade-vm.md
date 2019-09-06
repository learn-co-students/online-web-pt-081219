- [Importing a Pre-Configured Virtual Machine](#org0f598a6)
  - [Install VirtualBox (if you haven't already)](#org9b525fe)
  - [Import the Virtual Machine into Virtual Box](#orgc0cbeed)
  - [Finalize your set up](#org1e463eb)


<a id="org0f598a6"></a>

# Importing a Pre-Configured Virtual Machine

The following instructions guide you through the process of importing a virtual machine that already has Ubuntu MATE installed along with all the tools necessary to start working on your labs.

The first step is to download [this file](FlatironUbuntu.ova) (It's big and might take a while).


<a id="org9b525fe"></a>

## Install VirtualBox (if you haven't already)

Download the latest version from the [VirtualBox Downloads](https://www.virtualbox.org/wiki/Downloads) pages:

-   Windows users can use the version for a [Windows host](https://download.virtualbox.org/virtualbox/6.0.10/VirtualBox-6.0.10-132072-Win.exe).
-   Mac users can use the version for a [OS X host](https://download.virtualbox.org/virtualbox/6.0.10/VirtualBox-6.0.10-132072-OSX.dmg).


<a id="orgc0cbeed"></a>

## Import the Virtual Machine into Virtual Box

Once you've got the [VM](FlatironUbuntu.ova) downloaded and [VirtualBox](https://www.virtualbox.org/wiki/Downloads) installed, you can move on to imported the new machine. Launch VirtualBox and select `File > Import Appliance...` from the toolbar menu.

![img](./01%20-%20Import%20Appliance.png "Import Appliance Screen")

Click the icon to the right of the textbox to navigate to the file you downloaded.

![img](./02%20-%20Navigate%20to%20Downloaded%20File.png "Navigate to the VM File")

Once you've selected the right file, click continue.

![img](./03%20-%20Select%20Continue.png "Click Continue")

Then Click Import to take the default settings.

![img](./04%20-%20Select%20Import.png "Click Import")

The import might take a while; wait for it to finish.

![img](./05%20-%20Wait%20for%20Import.png "Wait for import to finish")

You should now see a new VM called "Flation Ubuntu". Make sure that VM is select and click the start arrow.

![img](./06%20-%20Select%20the%20new%20VM.png "Start the VM")

The VM should launch. When you get to the login screen, you should see a user named "Freddie Flatiron". Click 'Log In'.

![img](./07%20-%20Login.png "Login")

You should now be logged into the VM. The main user account is 'learn' and the password is also 'learn'. The timezone is set to EST.

To get to a terminal: click on "Menu" in the upper left courner and select `System Tools > MATE Terminal`.


<a id="org1e463eb"></a>

## Finalize your set up

Almost everything is pre-setup for you, but you'll need to link `learn` to your github account and configure a few things. Follow these instructions:

-   <https://help.learn.co/en/articles/1117571-virtualbox-manual-environment-setup>
