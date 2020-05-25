# Command Line Basics  

###How to Access command line for windows users!!!

What is command line? Used to navigate file systems, basic text editing, submit scripts to various software, access clusters/remote computing

Speed and efficiency (once you get going): one of the reasons why it's so useful.

Text: much lighter on resources than graphical user interfaces.

Lots of commonly used bioinformatics software uses a command line interface: so you should know how to navigate this. Furthermore, if you are planning on doing more bioinformatics work, you will probably use a server/cluster, which you access through the command line.

Allows you to smoothly move between software for a pipeline, but all in one place - you can combine R, Python, Perl, SQL - whatever you need

`man`, `--help` and google are really your best resources here.

## Navigating File Structures

One of the most basic things you're going to want to be able to do is move around your computer/server and see what's in different folders. These are the most important commands for this:

`cd` : change directory; to change back up to the previous (parent) directory, type `cd ..` ; a single full stop `.` means the current directory.

`ls`: list the contents of the current directory. If you want to see what's in a different directory without changing out of the current one, you can write the path to the directory you want to list after `ls`; for example, type `ls ../Phase_1/` if you want to list the contents of a folder called "Phase_1" which is a subdirectory of the same directory you are currently in. You can also use wildcards to list the contents of the directory which start with/end with a certain string that you're interested in. For example, if you just want to list all the fastq files in a directory, type `ls *.fastq.gz` and they will be listed. There are also a number of flags that you can use to change how the files are listed (Is this the right way to put it?). You can investigate this using `ls --help` , but the most useful ones are `-l`,`-h`,`-r` and`-t`: l means long-form (so you see the owner of the file, the permissions, the last time it was edited and the size); h converts the size of files to human-readable form, r means sort in reverse order and t means sort by time, so `ls -rt` would list the files in reverse order of time (with the most recent being at the bottom of the list). 

`mv`: you use `mv` to move files into different directories, but also to rename them; so `mv temp tax_ids.txt` would rename a file called temp to tax_ids.txt. Be careful not to rename something to a name that is already taken in that directory; or if you're going to move the file to a different directory that there isn't some conflict there either.

`cp` is used to copy files to different directories; eg `cp screen.csv ../../` will copy the .csv file "screen" to two directories up. 

`pwd`: prints the directory you're in.

`mkdir` : makes a new directory, so `mkdir new_folder` makes a directory called "new_folder/"

you may or may not want to talk about -p flag for making parent dirs, but i don't think it's that important for our purposes here. - not needed

### A note on relative and absolute paths

write something here later; is there differences with mac? - yes absolute paths are slightly different - especially in that it varies depending on their personal filesystem setup as you have more editability in a Mac - this might be somewhere to make a note about attending the zoom - (for a mac it is much easier to get to the home directory than in windows, but the code is different depending on the number of users and if you have admin privs)

For Mac:

Users/YOURUSER/

## Creating New Files

Redirection:

Sometimes you need to have a text files with a list of samples (for example); you don't need to type all these out, or even copy and paste into a text file. Instead, you can redirect the output of a command into a file. For example, making a file with that list of samples could be achieved with this simple command: `ls > sample_list.txt`

You might also want to concatenate previously existing files to make a new one; this can be achieved with `cat file1 file2 > combined_files` ; using the `cat` command without redirection will just print this onto the screen. 

If you want to put two files together side-by-side rather than one after the other, `paste` is your friend.  For example `paste file1 file2 > pasted_files` will make a file with the contents of file 1 to the left, and file 2 to the right. 

You can also use `echo` to echo things onto the terminal (which can be redirected into a file): for example `echo "this is a test" > test.txt` makes a file called test.txt containing `this is a test`. Echo is also really useful when you're doing slightly more convoluted things with for loops in the shell; you don't need to worry too much about this yet. 

## Removing files

Be careful with this command: it removes your files forever. 

`rm file` will delete your file; `rm file*`will remove *all* files with the prefix `file` .

If you try to remove a directory, you will see this message:

`rm: cannot remove 'my_directory/': Is a directory`

`rmdir` will remove a directory, but only if it's empty. (If there are empty directories in it you use `-p`, which deletes empty directories and their (otherwise empty) parents )

However, if you're sure you want to remove all the contents of a directory, you can use `rm -r my_directory/`, which will remove it and all its contents.

As a general rule, if you can't do an operation on a directory (like copying), `-r` (meaning perform this operation recursively) will allow you to do this.

## Viewing files

`cat` is a way to view files, but it prints everything out onto the screen, which makes it virtually impossible to inspect a very large file (which it is likely you'd be working with if you're working with genomic data). 

`more` and `less` are both more manageable ways to view a file: `more` prints out enough of the file to view it on the screen and then you use the space bar to move down and read it. The enter key can be used to look at this line-by-line. 

`less` is probably nicer? type `less file` ; use `e` to go fwd one line, `y` to go back one line; `f` to go forward one window and `b` to go back. type `q` or `Q` to exit.

`head` and `tail` allow you to look at the first and last 10 lines of a file, which is useful to quickly check the contents. the `-n` flag allows you to change the number of lines you're looking at. 

## Other nice summaries

`wc`: wordcount of files

​	 `wc -l`: returns the number of  lines in a file

`uniq`

`sort` ; by what columns; is the data numeric or not (`sort -k{colnumber}`; `sort -n` )

does `grep` go here: searching for patterns in text.

## Piping

using the pipe `|` symbol allows you to combine two or more commands, usually for the output of a command to become the input of the next command, for example you may want to `sort` your data, then take only the top 5 lines `head -5` and then count the number of words in these lines `wc`

Rather than submitting each command individually you can write one line of code 

`sort | head -5 | wc`

For basic commands this doesnt add much efficency but as you begin to expand your repetoire in command line this becomes much more useful, 
it not only increases your speed it also keeps things neat and reproducable


## Text Editors in the command line

Do I really want to go into a vim tutorial? Else use nano but it's not as nice. 

## Manipulating text: awk and sed are your new best friends

