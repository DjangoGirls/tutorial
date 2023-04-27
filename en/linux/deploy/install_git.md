Git is a "version control system" used by a lot of programmers. 
This software can track changes to files over time so that you can recall 
specific versions later. 
A bit like the "track changes" feature in word processor programs (e.g., 
Microsoft Word or LibreOffice Writer), but much more powerful.

## Installing Git

<!--sec data-title="Installing Git: Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```bash
$ sudo apt install git
```

### Adjusting your default branch name

This will align your installation of Git with the broad direction of the global 
developer community, and the "main" branch will be used through the remainder of 
this tutorial. 
Please see https://sfconservancy.org/news/2020/jun/23/gitbranchname/ and 
https://github.com/github/renaming for further discussion of this subject. 

{% filename %}command-line{% endfilename %}
```
$ git config --global --add init.defaultBranch main
```

<!--endsec-->

<!--sec data-title="Installing Git: Fedora" data-id="git_install_fedora"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```bash
$ sudo dnf install git
```

### Adjusting your default branch name

This will align your installation of Git with the broad direction of the global 
developer community, and the "main" branch will be used through the remainder of 
this tutorial. 
Please see https://sfconservancy.org/news/2020/jun/23/gitbranchname/ and 
https://github.com/github/renaming for further discussion of this subject. 

{% filename %}command-line{% endfilename %}
```
$ git config --global --add init.defaultBranch main
```

<!--endsec-->

<!--sec data-title="Installing Git: openSUSE" data-id="git_install_openSUSE"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```bash
$ sudo zypper install git
```

### Adjusting your default branch name

This will align your installation of Git with the broad direction of the global 
developer community, and the "main" branch will be used through the remainder of 
this tutorial. 
Please see https://sfconservancy.org/news/2020/jun/23/gitbranchname/ and 
https://github.com/github/renaming for further discussion of this subject. 

{% filename %}command-line{% endfilename %}
```
$ git config --global --add init.defaultBranch main
```

<!--endsec-->
