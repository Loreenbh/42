<div align="center">

<img src="./images/minishell-planche.png" width="100%" />

42 Paris · Minishell

Implementation of a simple shell in C as part of the 42 curriculum.<br>
The project focuses on <strong>process management, parsing, and Unix signals.</strong>

</div>

## 01 — Skills Demonstrated

- Linux command line  
- Process creation and management (`fork`, `execve`)  
- Signal handling (`SIGINT`, `SIGQUIT`)  
- Parsing and handling of command-line inputs  
- Redirections (`>`, `<`, `>>`) and pipes (`|`)  

## 02 — Project Overview

Minishell is a simplified version of a Unix shell that supports:

1. Executing commands with arguments  
2. Handling built-in commands (`cd`, `echo`, `pwd`, `export`, `unset`, `env`, `exit`)  
3. Redirections (`>`, `>>`, `<`)  
4. Pipes (`|`) to chain commands  
5. Signal handling for proper termination and interruption  

## 03 — Getting Started

### Prerequisites
- Linux / MacOS
- GCC
- `libreadline` library (`sudo apt install libreadline-dev` on Ubuntu/Debian)

### Clone & Build
```bash
git clone https://github.com/Loreenbh/minishell.git
cd minishell
make
./minishell
```
### Example Usage
```bash
$ ./minishell
minishell> echo Hello World
Hello World
minishell> ls -l | grep README
-rw-r--r-- 1 user user 1234 README.md
minishell> exit
$
```
