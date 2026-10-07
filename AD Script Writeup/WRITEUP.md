# Expanding on the PowerShell Script

## Objective
The purpose of this write up is to make a PowerShell script that makes creating, deleting, and resetting passwords more convenient and fast by lowering the amount of repetitive typing. As well as to show my new understanding of the PowerShell scripting language.

## The Reasons for making the script.
1. I want the PowerShell script to do all the basic Active Directory management such as mass resetting passwords depending on the department, mass creating users, deleting single users and list of users.
2. I want everything centralized in one script since there really aren’t going to be that many commands in the script.
3. If I make more scripts in the future there will be a simple way to convention to categorize the windows PowerShell commands.
4. I want to learn more about PowerShell scripting because I find it interesting.

## Initial Script Logic
Pick a command.
1. The options will be written to the terminal at the start of the script
2. Call a single variable which will get the users input from the terminal.
3. And then an if/else statement will be nested in a while loop allowing the user to choose the options: 1. List Users, 2. Create Users, 3. Delete user, 4. rest password, and 5. exit script.

## Lessons Learned and Progress Made
I made some typo mistakes in my script where I misspelt ‘Write-Output’ and then I forgot to add a bracket to the end of an elseif’.

![Notepad Script Typo](./images/image1.png)

## Testing and Reviewing the First Iteration.
Well, I tried my current script and realized that it worked but it had a few issues. Which I can improve but first let me explain.
1. If I wanted to modify a user out of a large directory of users, it would be nice to include a feature in the script to automatically write to the terminal the existing list of users. This would improve efficiency by keeping another repetitive command in the script.
2. The password reset option is incomplete. It needs to reset the passwords to what was typed and then it also needs to make the user change their password again at logon. In the case of unauthorized account access.
3. Once you complete the command it doesn’t give you any message that the command has executed successfully. I feel the need to add this for clarity.
4. There is a lack of error checking in the script if an error happens and it is not handled properly then the script will silently fail or have other issues.

## More Errors
Looks like I did not type something correctly let me go take a look.

![PowerShell Command Error](./images/image2.png)

As you can see, I accidentally typed a space into the script

![Script Space Error Highlighted](./images/image3.png)

And now it’s fixed. I went ahead and added more changes to the script on my GitHub repo! I went and took the time to set it up properly.

## Limitations
Some of the current limitations/flaws of the script include but are not limited to:
* The script has a lack of input validation and error handling
* The script is written in monolithic, procedural architecture and needs to be upgraded into a modular fashion.

## Conclusion
Consolidating the New-ADUser, Remove-ADUser, and Set-ADAccountPassword in the script reduces a considerable amount of typing for repetitive Active Directory Management tasks. Beyond efficiency improvements, testing this iteration of the script displayed a need to include  user enumeration, better error handling, and enforcing password resets at logon. The latest iteration of the script can be found at my : Link