<div align="center">

<img src="./images/minishell-planche.png" width="100%" />
<br><br>
4 2 P a r i s · M i n i s h e l l

</div>

## 0 1 — P R O J E C T

Minishell is a simplified version of a Unix shell that supports:

1. Executing commands with arguments  
2. Handling built-in commands (`cd`, `echo`, `pwd`, `export`, `unset`, `env`, `exit`)  
3. Redirections (`>`, `>>`, `<`)  
4. Pipes (`|`) to chain commands  
5. Signal handling for proper termination and interruption


## 0 2 — S K I L L S

- Linux command line  
- Process creation and management (`fork`, `execve`)  
- Signal handling (`SIGINT`, `SIGQUIT`)  
- Parsing and handling of command-line inputs  
- Redirections (`>`, `<`, `>>`) and pipes (`|`)  



## 0 3 — S E T U P 

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
