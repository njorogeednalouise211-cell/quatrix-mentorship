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

