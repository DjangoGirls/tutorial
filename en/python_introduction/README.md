# Introduction to Python

## What is it? ##

- An interpreted programming language that works in pretty much any operating system
- Allows for object-oriented design
- We are using Python 3.4.0

## HowTo ##

- Open the interpreter
	- Call ```python3``` from any directory in your terminal

*Example*

    student@adminuser-VirtualBox:~ > python3
    Python 3.4.0 (default, Apr 11 2014, 13:05:11) 
    [GCC 4.8.2] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> 

- Run a Python script from the terminal
	- ```python3 <path to file>```

*Example*

    student@adminuser-VirtualBox:~/workspace > python3 hello.py 
    Hello, world!

- Assign a variable
	- ```<variable> = <value>```

*Example*
    
    >>> x = 7
    >>> y = "Hello"

- Manipulate strings
	- Double quotes
		- ```"Hello world"```
	- Single quotes
		- ```'Hello world'```
	- Get string length
		- ```len(<string>)```
	- Convert other things to strings with the ```str()``` function
	- Concatenate (add two strings together) with ```+```

*Example*

    >>> str(256)
    '256'
    >>> x = 55
    >>> print("X is " + x)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: Can't convert 'int' object to str implicitly
    >>> print("X is " + str(x))
    X is 55
    >>> len("Hello world")
    11

- Print out a value
	- In the interpreter you can just type the value
		- ```>>> x```
	- Use a print statement
		- ```>>> print(x)```

*Example*

    >>> print("Hello world")
    Hello world
    >>> x = 7
    >>> x
    7
    >>> print(x)
    7
    >>> print ("X is " + str(x))
    X is 7

- Boolean values (```True``` and ```False```)
	- Remember they have to start with a capital letter
	- Will also get boolean values from comparisons
	- "Is it equal?" uses the symbol ```==```
	- "Is it not equal?" uses the symbol ```!=``` where ```!``` usually means "not"
	- **IMPORTANT** To check if two values are equal you must use **two** equal signs, not one: **YES:** ```==``` **NO:** ```=``` because one ```=``` is how you assign a value to a variable.

*Example*
    
    >>> 7 > 4
    True
    >>> 10 <= 3
    False
    >>> a = 5
    >>> b = 6
    >>> a == b
    False
    >>> a != b
    True
    >>> a < b
    True
    
- Manipulate lists
	- Lists are in square brackets like ```[ ]```
	- An empty list: ```[]```
	- A list can have lots of things in it: ```["apple", 5, -2]```
	- Save it to a variable: my_list = ```["uno", "dos", 8, 4]```
	- Lists have a length: ```len(<your list>)```
	- Add to the list: ```my_list.append(<value>)```
	- Look at a specific item in the list: ```my_list[2]``` will be 8
		- **IMPORTANT** Remember the first item in a list is number ```0```, not number ```1```

*Example*

    >>> []
    []
    >>> ["apple", 5, -2]
    ['apple', 5, -2]
    >>> my_list = ["uno", "dos", 8, 4]
    >>> len(my_list)
    4
    >>> my_list[2]
    8
    >>> my_list[0]
    'uno'
    >>> my_list.append("last")
    >>> print(my_list)
    ['uno', 'dos', 8, 4, 'last']

- Manipulate dictionaries
	- Uses curly braces: ```{ }```
	- Always a ```name: value``` pair
	- Manipulated a lot like lists except you use the name of the dictionary entry instead of the index number

*Example*

    >>> {}
    {}
    >>> my_dictionary = { 'uno': 1, 'dos': 2, 'tres': 3, 'quatro':4}
    >>> my_dictionary['tres']
    3
    >>> my_dictionary.keys()
    dict_keys(['dos', 'quatro', 'tres', 'uno'])
    >>> my_dictionary.values()
    dict_values([2, 4, 3, 1])
    >>> my_dictionary['new'] = 8
    >>> print(my_dictionary)
    {'dos': 2, 'quatro': 4, 'tres': 3, 'uno': 1, 'new': 8}

- Using if elif else statements

*Example*
    
    if(x < 5):
      print("Less than 5")
    elif(x == 5):
      print("Equals 5")
    else
      print("Not less than or equal to 5")
or

    if(input == "yes"):
      x = True
    else
      x = False


- While loop
	- While the condition is true, do the thing underneath

*Example*

    >>> i = 0
    >>> while(i < 5):
    ...   print(i)
    ...   i = i + 1
    ... 
    0
    1
    2
    3
    4

- For loop
	- For each one of a thing, do the thing underneath

*Example*

    >>> for i in range(1,5):
    ...   print(i)
    ... 
    1
    2
    3
    4
or

    >>> my_list = ["cats", "dogs", "bunnies"]
    >>> for animal in my_list:
    ...   print("I like " + animal)
    ... 
    I like cats
    I like dogs
    I like bunnies