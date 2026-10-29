## 1.which SSH keys must never be shared and what someone could do with it.
Pvivate keys ;if anyone gets hold of your private keys,they could impersonate yourised access to remote  servers and push malicious code under your identity.
 
## 2.Difference between `git commit` and `git push` ?what would you see on github after `git commit` ?
Git push: sends your saved local commits up the remote respiratory like github to bck up ypur work while 

Git push:downloads remote updates down to your local machine and merges them into your workspace.


## 3.why files must not be saved directly in the home directory.
It causes clutter and makes navigation difficult.

**Comand that proves its tidy.**

`find ~ -maxdepth 1 -type f ! -name '.*'`

## 4.Make your prompt show ? then  an arrow with a number deliberately .What does each mean?
When you run `touch scratch.txt `the prompt shows a ? meaning that theres an untracked file while an arrow shows your local branch has commits not yet pushed to the server.

## 5.Run `ssh -T git@github.com` what does the reply tell you.
***(Hi njorogeednalouise211-cell! You've successfully authenticated, but GitHub does not provide shell access)***.

This output means that github recognizes who you are and the computers local private key matches the public key uploaded to your profile .

***Permission denied(public key)*** 

means that the authentication failed and the key provided does not match any public keys registered to an account in the server.

## 6.Difference between Authentication and Authorisation 

Authentication verifies who you are /proving your identity.

Authorization verifies your access permissions and whar you're allowed to do.

Using `scm.quatrixglobal.com `as the example the SSH key handles authentication while the respiratory's internal permission settings handles authorization.

## 7.Besides a password and an SSH key ,name other ways a system can authenticate a user.

|Method|What it relies on |
|---|---|
|(1)Time-based one-time passwords|relies on something you have.|
|(2)Biometrics |relies on something you have.|
|(3)API keys |relies on something you have.|



## 8.Git remote can be reached over SSH `scm.quatrixglobal.com:...` or HTTPS `https://scm.quatrixglobal.com/...`.how authentication works in each case.
SSH uses asymmetric cryptography where the copmuter presents a hidden private key that the server automatically matches with your registered public key , no sensitive information travels over the internet.

 HTTPS recquires a long Personal Access Tokens(PAT) ,this token string gets copied and pasted when git prompts for credentials.I would pick SSH for daily use because it offers no interruption ,once it is configured it authenticates in the background and it is also device bound meaning your private key never leaves your physical machine.

## 9.Run `git remote -v` ,state which method in question 8 that it used 
Its using the SSH method .

 **Command to switch  to HTTPS**:
 
 `git remote set-url origin https://quatrixglobal.com`

 ## MY PERSONAL NOTES.

 ### Prompt Status Indicators 
* **`?`**: Untracked files exist in the repository.
* **`●`**: Tracked files have been modified but not staged.
* **`✚`**: Changes are staged and ready to be committed (`git add`).
* **`↑N`**: Local branch is ahead of the remote by N commits (needs `git push`).
* **`↓N`**: Local branch is behind the remote by N commits (needs `git pull`).

## ***GIT COMMANDS***

### Checking Status & History
* **`git status`**: Shows modified files, staged changes, and untracked files .

### Saving Changes

```
git add folder name/file name 
```
 Stages changes in a specific file, preparing it for a commit.

```
git add 
````
 Stages **all** modified, deleted, and new files in the entire directory.
```
git commit -m "your message"
```
 Permanently saves your staged snapshot into the version history with a descriptive message.

 ``` 
git push
```  
Pushes the changes made to git.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    




