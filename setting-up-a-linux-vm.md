# Setting Up a Linux Virtual Machine

These are the steps I'm going to follow in my talk, but there are some other instructions here: https://help.learn.co/en/articles/900771-ubuntumate-with-virtualbox

## Step 1: Install VirtualBox

VirtualBox is a program that let's you run an operating system without
installing it directly onto your computer. Its a save way to
experiment with a new setup!

 * Visit the [VirtualBox Downloads](https://www.virtualbox.org/wiki/Downloads) page: Windows
   users can download the version for [Windows hosts](https://download.virtualbox.org/virtualbox/6.0.10/VirtualBox-6.0.10-132072-Win.exe) and Mac users can use the version for [OS X hosts](https://download.virtualbox.org/virtualbox/6.0.10/VirtualBox-6.0.10-132072-OSX.dmg)
   
## Step 2: Create a New VirtualMachine

VirtualBox lests us create 'virtual' computers. You can find detailed
instructions on how to do this on the [Oracle web
site](https://docs.oracle.com/cd/E26217_01/E26796/html/qs-create-vm.html). Here
are the highlights:

 * Click the 'New' button at the top
 * Use the wizard to set up the machine. Make sure tha you set the
   'Type' to 'Linux' and 'Version' to 'Ubuntu (64-bit)'
 * Next select the Memory size. There's no exact answer about how much
   to use. The more memory your computer has, the more you can give to
   the virtual machine. I usually set it to 4096 MB.
 * Make sure that "Create a virtual hard disk now" is selected and
   click 'Create'. I use the "VDI (VirtualBox Disk Image)" file type
   and make it "Dynamically allocated". The File size again can be as
   much as you want--you won't need a ton and the default is probably
   fine.
 * When you click 'Create' again you should see the new VirtualBox on
   the left side.
   
## Step 3: Download LUbuntu

You can use any Linux distribution you want, but I'll recommend
LUbuntu. It's smaller version of [Ubuntu](https://ubuntu.com/), which
is a version of Linux meant to be easy to set up and use.

 * Visit the [LUbuntu download page](https://lubuntu.net/downloads/)
   and download the latest version (you probably wnat 64-bit).
   
## Step 4: Install LUbuntu on the VirtualMachine

Now we need to install LUbuntu onto our virtual machine.

 * Go back to VirtualBox, left click on your virtual machine and
   select 'Settings'
 * Select 'Storage' on the left side and notice the 'Stoage Devises'
   selection
 * There should be a line that says 'Controller: IDE' with a line
   underneath that has a little picture of a CD and says
   'Empty'. Click that 'Empty'.
 * Now on the right find the line that says 'Optional Drive' and click
   the picture of a CD right next to it.
 * Select 'Choose Virtual Optical Disk File' and find the file that
   you downloaded from the LUbuntu website.
   
The install CD is not 'in' the virtual computer. Click 'OK' to go back
to the main VirtualBox screen.

  * Now select your virtual machine on the left and click 'Start' at
    the top.
  * The CD should walk you through the installation process. It should
    ask you some pretty straigh forward questions and for the most
    part you can just take the default options.
  * When your don't the virtual machine will reboot and you'll have a
    setup Linux environment.
  * You can get to a terminal by selecting the application menu in the
    bottom left corner and moving to 'System Tools' and opening
    'LXTerminal'
	
## Step 5: VirtualBox Guest Additions (Optional)

We can install some fancy tools that will make your virtual machine easier to work with. This is optional but instructions cna be found on the [Ubuntu website](https://help.ubuntu.com/community/VirtualBox/GuestAdditions).
	
## Step 6: Setting up Learn

Now we need to set up the required tools and whatnot:
https://help.learn.co/en/articles/900771-ubuntumate-with-virtualbox

  * Open a terminal and type `leafpad .bashrc` to open up the file for editing
  * Scroll all the way to the bottom of the file and add the lines:
  ```
  if [ -f $HOME/.bash_profile ]; then
    source $HOME/.bash_profile
  fi
  ```
  * Safe the file and close leafpad
  * Install curl by typing `sudo apt install
    curl` enter `Y` when asked.
  * Next run `curl https://raw.githubusercontent.com/flatiron-school/local-setup/master/linux-setup | bash` that will start to set up a bunch of stuff automatically.
  * Close the terminal and open it again to let changes take effect
  * You can now finalize your installation with these instructions: https://help.learn.co/en/articles/1117571-virtualbox-manual-environment-setup

That's it! You should now be able to do labs from your own virtual computer!
