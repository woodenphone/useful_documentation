# Hashdeep

Git repo:
```https://github.com/jessek/hashdeep```

Manpage:
```https://linux.die.net/man/1/hashdeep```

## Installing on linux
(Ubuntu 18.x is assumed.)

### From source:
Update system:
``sudo apt update && sudo apt upgrade -y``

Download hashdeep git repo:
``git clone https://github.com/jessek/hashdeep.git``
``cd hashdeep/``

Compile and install hashdeep:
(Need sudo to install sytemwide)
```
sh bootstrap.sh # runs autoconf, automake
./configure
make
sudo make install
```


### From apt
Update system:
``sudo apt update && sudo apt upgrade -y``

Install from package manager:
```sudo apt install hashdeep```


### Verify install worked:
Is manpage installed? (q exits manpage.)
```man hashdeep```

Does hashdeep run?
```hashdeep -h```

Can we hash the files in the current folder?
```hashdeep *```

## Usage on linux


```hashdeep```


Example from git:
To perform an audit:
```
hashdeep -r dir  > /tmp/auditfile            # Generate the audit file
hashdeep -a -k /tmp/auditfile -r dir          # test the audit
```


hashdeep -r "/path_to_dir" > "/path/to_auditfile"







