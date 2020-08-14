# Git Guide
Enough git to do the basics.

## Introduction
Various clients are available beyond the basic commandline one, doing things such as adding graphical interfaces.

### Notation
```$ BASH```
```> windows cmd```

## How to do basic things
### Setting up Git
```$ git config --global user.name "[firstname lastname]" ```
```$ git config --global user.email "[valid-email]" ```
>https://github.github.com/training-kit/downloads/github-git-cheat-sheet/

### Getting a repository
Create a new empty repository in the current folder:
`$ git init .`
`> git init .`

Clone a repo from the internet:
>Clone - Download a copy of a repository
```$ git clone URL```
```> git clone URL```



### Recording changes
Modified files are "staged" before they can be "committed".
>Stage - Mark file(s) for recording changes.
>Commit - Record the current state of the file. 

You should always include an informative message when you commit changes.
e.g.

For the first commit in a repo:
```Initial commit.```

Fixing a bug:
```Fix bug http://mycompany.com/bugtracker/bug/1234/
<Example stack trace here>
```


git commit -m "Commit message"

### Gitignore files
`.gitignore`
In windows file explorer attempting to create a file named `.gitignore.` results in actually creating a file named `.gitignore`
Any line starting with a # is a comment.
examples: https://github.com/github/gitignore/blob/master/Python.gitignore

## Links & sources
http://git-scm.com
https://github.github.com/training-kit/
https://github.github.com/training-kit/downloads/github-git-cheat-sheet/
https://github.com/github/gitignore
https://github.com/github/gitignore/blob/master/Python.gitignore