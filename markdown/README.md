## 1.Difference between inline code and fenced code block 

- Inline code sits inside a single sentence for short terms.wrapped in single backticks (` )

- Fenced code block stands on its own as a multi-line section.wrapped in tripple backticks(```)

## 2.Why does `1.step one` not render a list.

Markdown recquires a space character directly after the fullstop to trigger a list.without the space markdown reads it as literal plain text.

**-Broken example**
```
1.step one
2.step two
```

**-Fixed example.**
```
1. step one
2. step two
```

## 3. Examples of a table ,a nested bullet list ,a task list and an alert block.

**1.Table**
  
  - Used for organising information into columns and rows for a clear side by side view 

|**Command**|**Description**|**Example usage**|
|---|---|---|
|`touch`|Creates an empty file.|`touch markdown.md`|
|`cd`|Changes the current directory|`cd ..`|
|`cat`|Displays file contents|`cat README.md`|
|`rm`|Deletes a file|`rm file.txt`|

**2.Nested bullet list**

 Good for breaking down big topics into smaller sub details. 

- Hardware
  
  - Input devices

    - keyboard 
    - mouse 

  - Output devices

    - Monitor
    - Printer
- Storage systems 

     - Volatile storage (RAM - temporary)
     - Non-volatile storage (SSD/HDD-permanent)

**3.A task list**

used for tracking which tasks have been completed and which are still pending.

- [X] Install vs code 
- [] Create the markdown/README.md file.
- [x] Answer all four module questions.
- [] Test the nested lists rendering in the markdown preview .

**4.Alert blocks.**

Used mainly to highlight important things like warnings and tips .


>[!IMPORTANT] 
> Ensure you've saved your file before closed the pc.

>[!Tip]
> you can quickly open the terminal inside vs.

## 4.Changes i would make for an answer from alater module that would make it easier to read during an evaluation.






