# 1.Navigating and Listing Essentials

##  The `ls` Command (List Contents)
Lists files and folders in a specified path (defaults to your current directory if no path is provided).

* **`ls -l`** (Long Listing): Displays detailed data column by column.
* **`ls -a`** (All Files): Includes hidden items 
* **`ls -la` / `ls -al`**: displays all hidden items in long detailed format.
* **`ls -t`**: Sorts entries by modification time (newest first).
* **`ls -r`**: Reverses the sorting order 
* **`ls -h`**: Formats file sizes into human-readable notation.
* **`ls -R`**: Lists recursively, showing every file inside every subfolder down the chain.

* **`ls -lat`**:List all items with newest at top, oldest at bottom




---

##  The `cd` & `pwd` Commands (Navigation)
* **`pwd`** (Print Working Directory): shows the precise, absolute folder path you are currently standing in.
* **`cd`**: Moves your terminal session to a different directory location.
  * `cd` (No arguments): goes back to home directory (`~`).
  * `cd ..` (Parent Directory): Shifts you exactly one folder step backward in your active path.
  * `cd -` (Toggle Jump): Jumps back to the exact previous folder you were working in before your last move.

---

## The `tree` Command (Visual Directory Hierarchies)
Generates a graphical branch schematic detailing folder structures and contents.
* **`tree -L 2`**: Visualizes data down to a maximum layout depth of 2 subfolder levels.
* **`tree -d`**: Filters results to print folder paths exclusively, completely hiding files.
* **`tree -a`**: Instructs the visual engine to include hidden structures.


# Viewing and Processing File Contents

## Viewing File Content

### 1.`cat` (Concatenate)
Displays file content  onto the terminal screen.
```
cat filename.txt
```

### `less` (Interactive Pager)
Opens an interactive window to read files step-by-step without cluttering terminal history.
* **Navigation:** `Space` or `PgDn` moves forward; `b` or `PgUp` moves backward.
* **Search:** Type `/` followed by search keywords, then hit `Enter`. Press `n` for next match, `N` for previous.
* **Quit:** Press `q`.

### `head` & `tail` (Boundary Reading)
* **`head -n [X]`:** Displays the first `X` lines of a file (Defaults to 10 if `-n` is omitted).
* **`tail -n [X]`:** Displays the last `X` lines of a file (Defaults to 10 if `-n` is omitted).

### `wc` (Word Count)
Counts lines, words, and byte metrics.
* **`wc -l`:** Extracts the exact count of lines inside a file.

---

##  Searching, Sorting, and Comparing

### `grep` (Pattern Matching)
Filters and outputs lines containing matching search patterns.
* **`-i`**: Ignores character casing (case-insensitive).
* **`-v`**: Inverts search (prints only lines that do **not** match the pattern).
* **`-c`**: Outputs a numerical count of matching lines instead of printing the content.


### `find` (Directory Hierarchy Search)
Locates specific entries inside directory structures based on names or types.
* **`-type f`**: Restricts the search specifically to files.
```
find . -type f -name "*.txt"
```

* **`-type d`**: Restricts the search specifically to directories.
```
find ~/Documents/git/ -type d -name "*-*"
```

* **`-name`**: Pattern matching filter (e.g., `'-name "*Zippy*"'` searches flexibly with wildcards).
```
find ~/Documents/ -iname "*zippy*"
```


### `sort` (Text Sorting)
Rearranges text lines systematically.
### `sort` (Ordering Text Rows)
Rearranges lines of text alphabetically or numerically.
* `sort names.txt` - Alphabetical sort (A to Z)
* `sort -r names.txt` - Reverse alphabetical sort (Z to A)
* `sort -n numbers.txt` - Sorts numbers by mathematical value instead of string sorting (prevents `10` from coming before `2`)
* `sort -u names.txt` - Sorts the file and completely removes duplicate lines in a single step
* `sort -t',' -k2 data.csv` - Splits data by a comma delimiter (`-t','`) and sorts the rows based on the 2nd column (`-k2`)


### `cut` (Column Extraction)
Slices and extracts sections from text rows.
* **`-d`**: Defines the custom delimiter string (e.g., `-d';'`).
```
cut -d';' -f1,3 data.txt
```

* **`-f`**: Declares specific target column numbers (e.g., `-f2` or composite lists like `-f1,3`).
```
cut -d',' -f2 students.csv
```

### `uniq` (Deduplication)
Collapses adjacent duplicate text rows.
* **Requirement:** Inputs **must be sorted first** (`sort file | uniq`).
* **`-c`**: Prepends a numerical frequency frequency count to each unique row.

### `tr` (Character Translation)
Translates, replaces, or deletes specific isolated characters. 
* **Note:** Reads input explicitly through pipes (`|`), not directly from written filenames.
* **`-d`**: Deletes target characters (e.g., `tr -d '-'` strips out all hyphens).
```
echo "2026-11-02" | tr -d '-'
```


### `join` (Relational Mapping)
Joins two files in a common field.
* **Requirement:** Both input datasets must be sorted on the key field beforehand.

```
join -t';' -1 1 -2 1 students.txt counties.txt
```


### `xargs` (Argument Conversion)
Turns lines of input into arguments of command.
*  Combine `find ... -print0` alongside `xargs -0` to handle file paths that contain spaces safely without breaking scripts.

**Example** ;command to count lines across all scripts
```
find . -name "*.sh" -print0 | xargs -0 wc -l
```


### `diff` (File Comparison)
Compares two files line-by-line to isolate modifications.
```
diff file1.txt file2.txt
```

* **`-u`**: Outputs changes in unified delta format.
```
diff -u file1.txt file2.txt
```

* **`-r`**: Runs recursively across all files inside two comparable directories.
```
diff -r backup_folder/ current_folder/
```


## Creating, Copying, Moving, and Deleting

### `mkdir` (Make Directory)
Creates one or multiple folders.
* `mkdir project_data` - Creates a single directory.
* `mkdir -p a/b/c` - Creates nested parent and child directories simultaneously without throwing errors if they already exist.
* `mkdir -m 755 data_folder` - Creates a folder with specific permissions (`755` sets `rwxr-xr-x`).

### `mv` (Move / Rename)
Shifts file paths or renames items. No `-r` flag is required to move folders.
* `mv old.txt new.txt` - Renames a file in place.
* `mv file.pdf archive/` - Moves a file into a specified folder.
* `mv -i source.txt dest.txt` - Prompts for confirmation before overwriting an existing file.

### `cp` (Copy)
Duplicates files and folders from a source to a target destination.
* `cp report.xlsx copy.xlsx` - Clones a file under a new name in the same directory.
* `cp -r folder/ backup/` - Recursively copies an entire directory, including all its subdirectories and files.
* `cp -i file.txt target/` - Prompts for confirmation before overwriting an existing file.
* **Wildcards:** Supports pattern matching (e.g., `cp 31??_* target/` copies files matching that exact character format).

### `rm` & `rmdir` (Delete)
Permanently deletes items from the system.
**There is no Recycle Bin.**
* `rm file.txt` - Permanently deletes a single file.
* `rm -i file.txt` - Prompts for confirmation before deleting.
* `rm -f file.txt` - Forces deletion, suppressing all prompts and error messages.
* `rm -r folder/` - Recursively deletes a directory and its entire internal contents.
* `rm -rf folder/` - Forces recursive deletion without prompting. 
* `rmdir folder/` - Deletes a directory **only** if it is completely empty; fails if contents exist.

### `touch` (Create / Update)
* `touch notes.txt` - Creates a blank file instantly, or updates the access/modification timestamp if the file already exists.

---

## Writing Text and Editing

### `echo` (Print Text)
Prints a line of text directly to the terminal. Frequently paired with redirection operators to write data.
* `echo "text" > file.txt` - Overwrites a file with the string.
* `echo "text" >> file.txt` - Appends the string to the bottom of a file.

### `printf` (Formatted Print)
Prints formatted text strings. Unlike `echo`, it does not append an automatic newline character unless specified.
* `printf "%s has %d files\n" "$USER" 12`
  * `%s` - Placeholder for a string variable.
  * `%d` - Placeholder for a whole number integer.
  * `\n` - Inserts an explicit newline break.

### Text Editors
* `vi` / `vim` - Command-line text editors used to write and modify files directly inside the terminal session.


## History and aliases

### 1.History
* **`history`**: Displays your complete log of previously run terminal inputs.
* **`history | tail -n 5`**: Pulls exactly the last 5 commands you ran.
* **`history | grep find`**: Searches your command logs to see how you used `find` in the past.
* **Shell Behavior Gaps:**
  * **Bash:** `history 5` prints the last 5 commands; `history -c` clears your entire history cache.
  * **Zsh:** `history 5` lists everything starting *from* entry line 5 onward (use `history -5` to see the last 5 instead).

### Aliases (Custom Shortcuts)
* **`alias ll='ls -l'`**: Maps a long command string to a quick keyword. This remains active for your current shell window only.
* **`unalias ll`**: Permanently deletes a temporary shortcut link from the active session.
* **Permanent Implementation:** Append your custom line (e.g., `alias ll='ls -lh'`) to your default shell boot file:
  * **Zsh:** Edit `~/.zshrc`
  * **Bash:** Edit `~/.bashrc`
  * **Activation:** Refresh your terminal environment settings without closing it by running: `source ~/.zshrc`


## Archives, Downloads, and Remote Management

### `tar` (Tape Archive Utilities)
Bundles multiple files or directories into a single file entity and manages file compressions.
* **Flag Index:** `c` = Create, `x` = Extract, `t` = List layout, `v` = Verbose output, `f` = Archive file name (must sit immediately before the filename target).
* **Compression Elements:** `z` = gzip (`.tar.gz`), `j` = bzip2 (`.tar.bz2`), `J` = xz (`.tar.xz`).
```
tar -czf backup.tar.gz data/
```
- Creates a gzip compressed bundle out of the `data/` folder.
```
tar -tzf backup.tar.gz
```

- Peeks inside a compressed bundle to preview files without extracting them.
```
tar -xzf backup.tar.gz -C /tmp/
```
- Extracts contents directly into a target directory location using `-C`.

### `zip` & `unzip`
* **`zip -r folder.zip target_directory/`**: Compresses an entire folder directory layout recursively (`-r`).
```
zip -r backup.zip my_folder/
```
* **`unzip folder.zip`**: Extracts a ZIP archive archive file into the current directory.
```
zip -r backup.zip my_folder/
```
* **`unzip -l folder.zip`**: Previews the list layout of a ZIP file without running extraction protocols.
```
unzip -l backup.zip
```

### Web Fetching Tools (`wget` vs `curl`)
* **`wget [URL]`**: Downloads a file package and saves it directly to your folder.
  * Use `-O filename.pdf` to force download under a different name.
  * Use `-P ~/Downloads/` to declare a target file drop destination path.
* **`curl [URL]`**: Streams and outputs website source text directly to your screen by default.
- fetches the raw Html or JSON data from url and displays it on the screen.
  * Use `-O` (Capital O)downloads a file and saves it with the exact name on its remote server.
```
curl -O https://example.com
```
  * Use `-o custom.zip` lets you download and give a custom name.
  
  ```
  curl -o project_backup.zip https://example.com
  ```

### Remote Network Transfers (`scp`, `rsync`, `ssh`)
* **`scp file.txt user@server:/home/path/`**: Standard secure file copy operation to remote network environments over SSH.
* **`rsync -av source/ user@server:/destination/`**: Efficient synchronization engine. Scans files and transfers *only* edited file components. Highly recommended for heavy backup loops. (Trailing `/` on a source transfers internal folder contents exclusively).
* **`ssh user@remote_host`**: Boots a encrypted terminal control tunnel interface to an external system.

---

##  Paths 


### Absolute Paths
* Always start with a root forward slash (`/`) or a user home directory tilde abbreviation (`~`).
* Remains constant and reliable regardless of your current terminal position.
* **Example:** 
```
cat ~/Documents/quatrix/quatrix-mentorship/week1.txt
```

### Relative Paths
* Never begin with a forward slash (`/`) or tilde (`~`). They measure space relative to your active location (`pwd`).
* **Structural Shortcodes:**
  * **`.`** = The active folder path you are currently standing in.
  * **`..`** = Stepping exactly one level upward to the parent folder directory.


### Absolute Path

An absolute path gives the complete location of a file or folder, starting from the root directory (`/`).

- It starts with `/` or `~`.
- It works regardless of the current directory.
- It provides the full location of a file or folder.

Example:

```bash
ls /home/jdoe/Documents/quatrix/quatrix-mentorship
```

You can also use `~`, which represents the home directory:

```bash
ls ~/Documents/quatrix/quatrix-mentorship
```

###  Relative Path

A relative path gives the location of a file or folder based on the current working directory.

- It does not start with `/` or `~`.
- It depends on where you are currently working.
- It is usually shorter than an absolute path.

Example:

```bash
ls quatrix/quatrix-mentorship
```

This works if your current directory is `~/Documents`.

### Special Path Symbols

| Symbol | Meaning |
|---|---|
| `.` | Current directory |
| `..` | Parent directory (one level up) |
| `../..` | Two levels up |
| `~` | Home directory |

### Difference Between Absolute and Relative Paths

| Absolute Path | Relative Path |
|---|---|
| Gives the full location. | Gives the location from the current directory. |
| Starts with `/` or `~`. | Does not start with `/` or `~`. |
| Works from any directory. | Depends on the current directory. |

**When to use them:**

- Use absolute paths when you need to access a location from anywhere.
- Use relative paths when working with files or folders close to your current location.

---

## Working With Other Folders Without Changing Directories

You do not always need to use `cd` to enter a folder before working with its contents.

You can provide the folder path directly in your command.

### Examples

**List the contents of another folder:**

```bash
ls ~/Documents/quatrix/quatrix-mentorship
```

**Read a file in another folder:**

```bash
cat ~/Documents/quatrix/quatrix-mentorship/week1.txt
```

**Copy a file into the current directory:**

```bash
cp ~/Documents/quatrix/quatrix-mentorship/week1.txt .
```

The `.` represents the current directory.

**Move a file to another folder:**

```bash
mv ~/Documents/quatrix/quatrix-mentorship/week1.txt ~/Documents/career/
```

**Create a folder in another location:**

```bash
mkdir -p ~/Documents/career/cvs
```

**View a folder structure:**

```bash
tree -L 2 ~/Documents/quatrix
```

The `tree` command displays folders and files in a tree-like structure.


---

## Pipes and Wildcards

###  Pipes (`|`)
A pipe is used to connect two commands. It takes the result of the first command and sends it to the second command.


It allows you to combine commands to perform different tasks.

Example:

```bash
history | grep find
```

Explanation:

1. `history` displays previously used commands.
2. `|` passes the output to the next command.
3. `grep find` searches for lines containing the word `find`.

You can also use multiple pipes:

```bash
history | grep find | less
```

**Remember:** A pipe connects commands by passing output from one command to another.

### Wildcards

Wildcards are special characters used to match file and folder names.

The two common wildcards are `*` and `?`.

#### Asterisk (`*`)

The asterisk represents any number of characters, including no characters.

Examples:

```bash
ls *
```

Matches names in the current directory.

```bash
ls s*
```

Matches names starting with the letter `s`.

```bash
ls *l
```

Matches names ending with the letter `l`.

```bash
ls *pp*
```

Matches names containing `pp`.

```bash
ls *.txt
```

Matches files ending in `.txt`.

#### Question Mark (`?`)

The question mark represents exactly one character.

Examples:

```bash
ls ????
```

Matches names containing exactly four characters.

```bash
ls ????*
```

Matches names containing at least four characters.

#### Combining Wildcards

You can combine `*` and `?` in one command.

Example:

```bash
ls 31??_*
```

This matches names that start with `31`, followed by two characters, an underscore, and any number of additional characters.


---

## Redirection

Redirection allows you to send command output into a file instead of displaying it on the terminal.

| Symbol | Meaning |
|---|---|
| `>` | Sends output into a file, overwriting existing content |
| `>>` | Adds output to the end of a file |
| `2>` | Sends error messages into a file |
| `2>&1` | Sends errors to the same destination as normal output |

### Using `>` to Create or Overwrite a File

```bash
echo "Hello World" > output.txt
```

Creates `output.txt` and stores the text inside it.

If the file already exists, its previous contents are overwritten.

###  Using `>>` to Append Information

```bash
echo "Second line" >> output.txt
```

Adds another line without deleting the existing content.

To display the contents:

```bash
cat output.txt
```

### Redirecting Error Messages

```bash
ls /nonexistent 2> errors.txt
```

Saves the error message in `errors.txt`.

### Creating an Empty File

You can create an empty file using:

```bash
touch my_notes.txt
```

Or:

```bash
echo -n > my_notes.txt
```

**Important:** Be careful when using `>` because it can erase the contents of an existing file.

---

##  Variables and Environment Variables

A variable is a named space used to store information that can be used later.

Example:

```bash
name="Edna"
echo "$name"
```

Output:

```text
Edna
```

There should be no spaces around the `=` sign when assigning a variable.

### Common Environment Variables

| Variable | Meaning |
|---|---|
| `$HOME` | Home directory |
| `$USER` | Current username |
| `$SHELL` | Default shell |
| `$PWD` | Current working directory |
| `$PATH` | Directories searched for commands |

Examples:

```bash
echo $HOME
echo $USER
echo $SHELL
echo $PWD
echo $PATH
```

To display environment variables:

```bash
printenv
```

---

## Command Substitution

Command substitution allows you to run a command and use its output inside another command.

It uses the format:

```bash
$(command)
```

###  Display the Current Date

```bash
echo "Current time: $(date)"
```

The `date` command runs, and its output is inserted into the message.

### Create a File Using Today's Date

```bash
touch log_$(date +%Y%m%d).txt
```

This creates a file with the current date in its name.

Example:

```text
log_20261103.txt
```





---

## sed – Stream Editor Basics

`sed` stands for **Stream Editor**.

It is a Linux command used to search, replace, delete and display specific parts of text.

It is useful when working with text files.

By default, `sed` displays changes on the terminal without modifying the original file.

The `-i` option can be used to edit the original file.

### Common sed Commands

**1. Replace a word:**

```bash
sed 's/Nate/Nathan/g' file.txt
```

Replaces every occurrence of `Nate` with `Nathan` on each line.

- `s` means substitute.
- `g` means replace every occurrence on the line.

**2. Delete a specific line:**

```bash
sed '3d' file.txt
```

Deletes the third line from the displayed output.

**3. Delete a range of lines:**

```bash
sed '5,10d' file.txt
```

Deletes lines 5 to 10 from the displayed output.

**4. Display specific lines:**

```bash
sed -n '2,4p' file.txt
```

Displays only lines 2 to 4.

- `-n` prevents automatic printing.
- `p` prints the selected lines.

**5. Remove empty lines:**

```bash
sed '/^$/d' file.txt
```

Removes empty lines from the displayed output.

**Remember:** `sed` is mainly used to manipulate text.

---

## awk – Column Extraction

`awk` is a command used to process text and extract information from specific columns.

It is useful when working with data arranged in rows and columns, such as CSV files.

###  Extract File Names

```bash
ls -l | awk '{print $9}'
```

Displays the ninth column of a standard `ls -l` listing, which commonly contains the file name.

### Extract File Size and Name

```bash
ls -l | awk '{print $5, $9}'
```

Displays:

- `$5` - File size.
- `$9` - File name.

### Extract Information From a CSV File

```bash
awk -F';' '{print $2}' file.csv
```

Extracts the second column from a semicolon-separated file.

- `-F';'` sets the column separator to a semicolon.
- `$2` represents the second column.
- `$0` represents the entire line.

**Remember:** `awk` is mainly used to extract and process columns of text.

---

## Bash Scripting Basics

A Bash script is a text file containing commands that Bash executes in order.

Scripts are useful for automating tasks and avoiding repetitive typing.

###  Creating First Script

Example:

```bash
#!/bin/bash

echo "Hello, $USER. Today is $(date +%A)."
```

Explanation:

- `#!/bin/bash` is called the shebang. It tells the system to use Bash to run the script.
- `echo` displays a message.
- `$USER` displays the username.
- `$(date +%A)` displays the current day.

### Running a Script

Save the script as `hello.sh`.

Make it executable:

```bash
chmod +x hello.sh
```

Run it:

```bash
./hello.sh
```

You can also run it using:

```bash
bash hello.sh
```

The `./` means that the script is located in the current directory.

### Variables, Arguments and Quoting

Variables store information that can be used inside a script.

Example:

```bash
name="Amber"
echo "Hello, $name"
```

Output:

```text
Hello, Amber
```

### Script Arguments

Arguments are values supplied when running a script.

Example:

```bash
./hello.sh Edna
```

| Symbol | Meaning |
|---|---|
| `$0` | Name of the script |
| `$1` | First argument |
| `$2` | Second argument |
| `$#` | Number of arguments |

### Single Quotes vs Double Quotes

Double quotes allow variables to expand:

```bash
echo "Hello, $name"
```

Single quotes display the text literally:

```bash
echo 'Hello, $name'
```

**Remember:** Double quotes expand variables, while single quotes preserve the text exactly as written.

### Exit Status

An exit status tells you whether a command completed successfully.

- `0` means success.
- A non-zero number means failure or an error.

To display the exit status of the last command:

```bash
echo $?
```

Example:

```bash
ls /etc
echo $?
```

A successful command normally returns `0`.

### Useful Operators

```bash
command1 && command2
```

Runs `command2` only if `command1` succeeds.

```bash
command1 || command2
```

Runs `command2` only if `command1` fails.

Inside a script:

```bash
exit 0
```

Ends the script successfully.

```bash
exit 1
```

Ends the script with an error status.

###  Decisions Using if Statements

An `if` statement allows a script to make decisions based on conditions.

Example:

```bash
if [ -f "$1" ]; then
    echo "$1 is a file"
elif [ -d "$1" ]; then
    echo "$1 is a directory"
else
    echo "$1 does not exist"
fi
```


- `if` checks the first condition.
- `-f` checks whether the path is a regular file.
- `elif` checks another condition.
- `-d` checks whether the path is a directory.
- `else` runs if the earlier conditions are false.
- `fi` ends the statement.

### Useful File Tests

| Test | Meaning |
|---|---|
| `-e` | Checks whether something exists |
| `-f` | Checks whether it is a regular file |
| `-d` | Checks whether it is a directory |
| `-z` | Checks whether a string is empty |
| `-n` | Checks whether a string is not empty |
| `-eq` | Checks whether two numbers are equal |
| `-lt` | Checks whether a number is less than another |
| `-gt` | Checks whether a number is greater than another |

**Important:** Spaces inside `[ ]` are required.

Correct:

```bash
[ -f "$1" ]
```

Incorrect:

```bash
[-f "$1"]
```

### Repeating Commands Using Loops

Loops allow you to repeat commands multiple times.

There are two common types: `for` and `while`.

#### For Loop

A `for` loop repeats commands for each item in a list.

Example:

```bash
for f in *.txt; do
    echo "Found $f"
done
```

Displays the names of matching `.txt` files in the current directory.

#### While Loop

A `while` loop repeats commands while a condition remains true.

Example:

```bash
while read -r line; do
    echo "Line: $line"
done < file.txt
```

Reads the file one line at a time and displays each line.

### Asking the User for Information

The `read` command allows a script to receive information from the user.

Example:

```bash
read -p "What is your name? " name
echo "Hello, $name"
```

The script asks for a name and displays a greeting.

### Debugging and Checking Scripts

Debugging means finding and correcting errors in a script.

**Using bash -x:**

```bash
bash -x hello.sh
```

Displays commands as they execute, helping you identify problems.

**Using ShellCheck:**

```bash
shellcheck hello.sh
```

ShellCheck checks scripts for common errors and possible problems.

---

## Files, Folders and Permissions

Linux uses permissions to control who can access, read, modify or execute files and folders.


```bash
ls
```

- Lists files and folders in the current directory.

```bash
ls -d */
```

- Lists only directories.

```bash
ls -p | grep -v /
```

- Lists files while excluding directories.

```bash
find . -maxdepth 1 -type f
```

- Finds files in the current directory.

```bash
find . -maxdepth 1 -type d
```

- Finds directories in the current directory.

### Users and Groups

Linux uses users and groups to manage access to files.

Every file has:

- **Owner:** The user who owns the file.
- **Group:** The group associated with the file.
- **Others:** Everyone else.


| Command | Purpose |
|---|---|
| `whoami` | Displays your username |
| `groups` | Displays the groups you belong to |
| `id` | Displays your user and group IDs |

### File and Folder Permissions

Linux has three main permissions:

| Permission | Meaning | Numeric Value |
|---|---|---|
| `r` | Read | 4 |
| `w` | Write | 2 |
| `x` | Execute | 1 |

For files:

- Read allows you to view the contents.
- Write allows you to modify the contents.
- Execute allows you to run the file as a program or script.

For directories:

- Read allows you to list the names inside.
- Write allows you to create or delete entries, subject to other permissions.
- Execute allows you to enter the directory and access items inside.

### Understanding ls -l

Example:

```text
-rwxr-xr--
```

The first character shows the file type, while the remaining characters show permissions.

| Part | Meaning |
|---|---|
| `-` | Regular file |
| `rwx` | Owner permissions |
| `r-x` | Group permissions |
| `r--` | Others' permissions |

A `d` in the first position represents a directory.

**Changing Permissions Using chmod**

`chmod` means change mode. It is used to change file and directory permissions.

Permission values:

| Number | Permission |
|---|---|
| `7` | Read, write and execute (`rwx`) |
| `6` | Read and write (`rw-`) |
| `5` | Read and execute (`r-x`) |
| `4` | Read only (`r--`) |
| `0` | No permissions (`---`) |

Examples:

```bash
chmod 755 script.sh
```

Gives the owner full permissions and gives the group and others read and execute permissions.

```bash
chmod 644 file.txt
```

Gives the owner read and write permissions, while the group and others can only read.

```bash
chmod 600 file.txt
```

Allows only the owner to read and write.

### Symbolic Permissions

```bash
chmod +x script.sh
```

Adds execute permission for everyone.

```bash
chmod u+x script.sh
```

Adds execute permission for the owner only.

```bash
chmod go-w file.txt
```

Removes write permission from the group and others.

```bash
chmod a+r file.txt
```

Adds read permission for everyone.

To check permissions:

```bash
ls -l file.txt
```

### Changing Ownership

Ownership determines which user and group are associated with a file or directory.

| Command | Purpose |
|---|---|
| `chown` | Changes the owner |
| `chgrp` | Changes the group |
| `chmod` | Changes permissions |

Examples:

```bash
sudo chown user1 file.txt
```

Changes the owner to `user1`.

```bash
sudo chown user1:group1 file.txt
```

Changes both the owner and group.

```bash
sudo chgrp group1 file.txt
```

Changes the group only.

`sudo` runs a command with administrator privileges when the user is authorized.

The `-R` option means recursive. It applies a change to a directory and its contents.

### Hidden Files

Hidden files are files or folders whose names begin with a dot (`.`).

Examples:

```text
.ssh
.git
.sampledata
```

Linux does not display hidden files when using the normal `ls` command.

To display hidden files:

```bash
ls -a
```


### Home Directory


To display your home directory:

```bash
echo $HOME
```

To move into it:

```bash
cd
```

Or:

```bash
cd ~
```

To check your current location:

```bash
pwd
```



---

## Important Linux Commands

| Command | Purpose |
|---|---|
| `pwd` | Shows the current directory |
| `ls` | Lists files and folders |
| `cd` | Changes directory |
| `mkdir` | Creates a directory |
| `mkdir -p` | Creates directories and missing parent directories |
| `touch` | Creates an empty file |
| `cp` | Copies files or folders |
| `mv` | Moves or renames files or folders |
| `rm` | Deletes files |
| `cat` | Displays file contents |
| `head` | Displays the beginning of a file |
| `tail` | Displays the end of a file |
| `grep` | Searches for matching text |
| `find` | Searches for files and directories |
| `chmod` | Changes permissions |
| `chown` | Changes ownership |
| `chgrp` | Changes group ownership |
| `history` | Displays previously used commands |
| `clear` | Clears the terminal screen |
| `man` | Displays a command's manual |
| `sed` | Manipulates text |
| `awk` | Extracts and processes columns |

---




##  Key Points 

1. Absolute path - Full location of a file or folder.
2. Relative path - Location based on the current directory.
3. Pipe (`|`) - Passes output between commands.
4. Wildcard (`*`) - Matches any number of characters.
5. Wildcard (`?`) - Matches exactly one character.
6. Redirection (`>`) - Overwrites a file.
7. Redirection (`>>`) - Appends information to a file.
8. `sed` - Manipulates text.
9. `awk` - Extracts and processes columns.
10. Bash script - Automates commands.
11. `chmod` - Changes permissions.
12. `chown` - Changes ownership.
13. `~` - Represents the home directory.

