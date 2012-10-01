#!/usr/bin/python

import string
import os
import glob

home = os.environ['HOME']

# backup for dotfiles moved out of the way by this script
dotfile_backup = home + "/.dotfilebackup"
binfile = home + "/bin"

def symlink_dotfiles():
	for dotfile in glob.glob("./dot.*"):
		barename = dotfile[2:] 
		destname = barename[3:]
		destfile = home + "/" + destname
		# backup existing dotfiles to 
		if(os.path.lexists(destfile)):
			if(os.path.islink(destfile) and os.path.realpath(destfile) == os.path.realpath(barename)):
				print "Skipping " + barename + ", symlink already exists"
			elif(not os.path.islink(destfile)):
				print "Backing up " + destfile + " to " + dotfile_backup + "/" + destname
				os.rename(destfile, dotfile_backup + "/" + destname)
		else:
			print "Creating symlink " + barename + " -> " + os.path.realpath(dotfile)
			os.symlink(os.path.realpath(dotfile), destfile)

def symlink_bin():
	for b in glob.glob("./bin/*"):
		barename = b[6:]
		sourcefile = os.path.realpath(b)
		destfile = home + "/bin/" + barename
		if(os.path.lexists(destfile)): 
			if(os.path.islink(destfile) and os.path.realpath(destfile) == sourcefile):
				print "Skipping " + barename + ", symlink already exists"
			elif(not os.path.islink(destfile)):
				print "Backing up " + destfile + " to " + dotfile_backup + "/" + barename
				os.rename(destfile, dotfile_backup + "/" + barename)
		else:
			print "Creating symlink ~/" + barename + " -> " + os.path.realpath(barename)
			os.symlink(sourcefile, destfile)


def setup_oh_my_zsh():
	"""Setup oh-my-zsh"""
	if(os.path.lexists(home + "/.oh-my-zsh")):
		print "Skipping oh-my-zsh clone, ~/.oh-my-zsh already exists. Rebasing repo on master."
		os.system("cd ~/.oh-my-zsh && git pull --rebase origin master")
	else:
		os.system("curl -L https://github.com/dietrichf/oh-my-zsh/raw/master/tools/install.sh | sh")
	

if __name__ == "__main__":
	if(not os.path.lexists(binfile)):
		os.mkdir(binfile)
	if(not os.path.lexists(dotfile_backup)):
		os.mkdir(dotfile_backup)
	setup_oh_my_zsh()
	symlink_dotfiles()
	symlink_bin()
