# Test the python script

    $ python3 main.py password.txt

- It returns duplicated users like that -> 100:{'user3', 'user1'}

# Getting duplicated id for password.txt

    $ awk -F":" '$2 != "" {print ($2)} ' password.txt | sort | uniq -d
