 #!/bin/bash
echo "==========================="
echo "Welcome to Bash Assistant!"
echo "==========================="
echo -e "Pick a task:\n1)Check Disk Usage \n2)File count \n3)Search and replace DB\n"
echo "Which task? [1-3]: "
read task

if [ $task -eq 1 ]
then
	echo "Checking disk usage..."
	echo "$(du -ah --max-depth=1 | sort -h)"
elif [ $task -eq 2 ]
then
	echo "Counting files..."
	echo "$(find . -printf "%h\n" | cut -d/ -f-2 | sort | uniq -c | sort -rn)"
elif [ $task -eq 3 ]
then
    echo -e "What do you want to do?\n1)Do a dry-run first \n2)Proceed with Search & Replace\n"
    echo "Which task?"
    read searchreplace
        if [ $searchreplace -eq 1 ]
        then
	       echo "Enter old domain: "
	       read old
	       echo "Enter new domain: "
	       read new
	       echo "$(wp search-replace $old $new --dry-run)"
        elif [ $searchreplace -eq 2 ]
        then
           echo "Enter old domain: "
	       read old
	       echo "Enter new domain: "
	       read new
           echo "$(wp search-replace $old $new)"
        fi
fi
