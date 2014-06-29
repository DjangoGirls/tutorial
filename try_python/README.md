# Let’s start with Python

Huh, it's exciting, right?! You'll write your first line of code in just minutes!

But first, let me tell you what Python is. Python is a very popular programming language that can be used to write websites, games, science, graphics, and many, many more. Python was conceived in the late 1980s and it's main goal is to be readable by human beings (not only machines!) that's why it looks much simpler than other programming laungages. That also makes it easy to learn, but don't worry, Python is also really powerful!

## Python Installation

*This subchapter is based on awesome tutorials by Geek Girls Carrots (http://django.carrots.pl/)*

Django is written in Python. We need it to do anything in Django. Let's start with installing it!

### Windows

You can download Python for Windows from website https://www.python.org/download/releases/3.4.0/. After downloading ***.msi** file, you should execute it (double-click on it) and follow the instructions there. It is important to remember the path (the folder) where we installed the Python. It will be needed later.

### Linux

It is very probable, that you already have Python installed out of the box. To check if you have it installed (and which version it is), you type in a console:

    $ python --version
    Python 3.4.0

If you don't have Python instaled or you want different version, you can install it as follows.

#### Ubuntu

You type in the console:

    sudo apt-get install python3.4


#### Fedora

Yout type in the console:

    sudo yum install python3.4

### OS X

You need to go to the website https://www.python.org/download/releases/3.4.0/ and install the appropriate package for you operating system.

----

If you have any doubts or something went wrong and you have no idea what to do next - please ask your coach! Sometimes things are not going smoothly and it's better to ask for help someone with more experience.

## Python Prompt

To start tinkering with Python, we need to open up a *prompt* on your computer. On Mac OS X you can do this by launching `Terminal` application (It's in Applications → Utilities). On Windows you need to go to Start menu → All Programs → Accessories → Command Prompt. On Linux, it's probably under Applications → Accessories → Terminal.

Black window should pop up on your screen. This window is waiting for a command from you. We want to open up a Python console, so type in `python` and hit Enter.

    (workshops) ~$ python
    Python 3.4.0 (...)
    Type "copyright", "credits" or "license" for more information.
    >>>

Earlier we were working in the operating system’s command line and we could give commands. The prompt was `~$`. After running the python command, prompt changed to `>>>`. For us that means that for now we may use commands only in Python language. You don't have to type in `>>>` - Python will do that for you.

## Your first Python command!

Let's start with something really simple. For example, try typing some math, like `2+3` and hit Enter.

    >>> 2 + 3
    5

Nice! See how the answer popped out? Python knows some math. You could try other commands like:
- `4 * 5`
- `5 - 1`
- `40 / 2`

Have fun with this for a little while and then get back here :)

As you can see, Python is a great calculator. If you're wonder what alse you can do...

## Strings

Maybe your name? Type your first name in quotes like this:

    >>> "Ola"
    'Ola'

You now created your first string! It's a set of characters that can be processed by a computer. The string must always begin and end with the same character. This may be an apostrophe (`'`) or double quotes (`"`). It has no effect on the value of the string - double quotes or apostrophes are not a part of string, they only indicate that it is a string.

Strings can be added. Try this:

    >>> "Hi there " + "Ola"
    'Hi there Ola'

You can also multiply strings by number:

    >>> "Ola" * 3
    'OlaOlaOla'

Nice, huh? To see your name in uppercase, simply type:

    >>> "Ola".upper()
    'OLA'

You just used the `upper` __method__ on your string! Method (`upper`) is a set of instructions that Python has to perform on given object (`"Ola"`) once you call it.

If you want to get a number of letters in your name, there is a method for that too!

    >>> len("Ola")
    3

Wonder why sometimes you call methods by adding `.` at the end of the string (like `"Ola".upper()`) and sometimes you first call a method and add string in parentheses? Well, in some cases, methods belong to objects, like `upper` that can only be performed on Strings. But sometimes, methods don't belong to anything specific and can be used on different types of objects, just like `len`. That's why we're giving `"Ola"` as a parameter to `len` method.

### Summary

Ok, enough of strings. So far you've learned about:

- __the prompt__ - typing commands (code) into prompt give you Python answers
- __numbers and strings__ - in Python it's math and text objects
- __methods__ - are actions in Python. You've used both English-language methods (upper, len) and symbolic ones (+, *).

That's the basic of every programming language you learn. Ready for something harder? I bet you are!

## Errors

Let's try something. Can we know the lenght of a number, the same way we learn the lenght of our name? Try typing `len(304023)` and hit Enter:

    >>> len(304023)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: object of type 'int' has no len()

We got our first error! It says that objects of type "int" (integers, whole numbers) doesn't have a lenght. Well.. so what can we do know? Maybe we can write our number as string? Strings have lenght, right?

    >>> len(str(304023))
    6

It worked! We used `str` method inside of `len` method. `str` is converting everything to Strings.

- `str` method convert things into __strings__
- `int` method convert things into __integers__

As long as we can convert numbers into text, we can't convert text into numbers.

## Variables

There is a concept in programming: variable. This is nothing more than a name for something so you can use the name rather than the something as you code. Programmers use these variable names to make their code more readable and so they won't forget what something is.

Let's say we want to create a new variable called `name`:

    >>> name = "Ola"

You see? It's easy! Simply: name equals Ola.

As you've noticed, your program didn't return anything as it did before. How do we now that the variable actually is there? Simply enter `name` and hit Enter:

    >>> name
    'Ola'

Yikes! Your first variable :) You can always change what it means:

    >>> name = "Sonja"
    >>> name
    'Sonja'

You can use it in methods too:

    >>> len(name)
    5

Awesome, right? Of course, variables can be anything, numbers too! Try this:

    >>> a = 4
    >>> b = 6
    >>> a * b
    24

Play with this for a while and see what you can do!

## Lists

Beside strings and integers, Python has all sorts of different types of objects. Now we're going to introduce another one called __lists__. List is the exact thing you think about now: object that is a list of objects :)

Go ahead and create a list:

    >>> []
    []

Yes, it's empty. Not very useful, right? Let's create a list of lottery numbers. We don't want to repear ourselves all the time, so we will put it in a variable, too:

    >>> lottery = [3, 42, 12, 19, 30, 59]

All right, we have a list! What can we do with it? Let's see how many lottery numbers there is in a list. Do you have an idea which method you should use for that? You've know this already!

    >>> len(lottery)
    6

Yes! `len` can give you a number of objects in a list. Handy, right? Let's sort this list now.

    >>> lottery.sort()

This doesn't return anything... because we didn't print it! Let's try this:

    >>> print(lottery)
    [3, 12, 19, 30, 42, 59]

As you can see, numbers are now sorted from lowest to highest in your list. Congrats!

Maybe we want to reverse the order? Let's do that!

    >>> lottery.reverse()
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3]

It worked! If you want to add something to the list, you can do this by typing this command:

    >>> lottery.append(199)
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3, 199]

If you want to only read the first number, you can do this by using index. The first objects of list is an object number 0, next one is 1, and so on. Try this:

    >>> print(lottery[0])
    59
    >>> print(lottery[1])
    42

As you can see, you can access different objects in your list by using its name and index number inside of brackets.

You can find a list of all available list methods here in Python documentation: https://docs.python.org/2/tutorial/datastructures.html

### Summary

Awesome! You know a lot about programming now. In the last part you learned about:

- __errors__ - you now know how to read and understand errors that show up if Python doesn't understand your command
- __variables__ - names for objects that allow to code more easily and make your code more readable
- __lists__ - list of objects stored in particular order.

Exicted for the next part? :)

## Dicts

creating dicts
reading dicts
editing dicts

## Comparisions, boolean

true, false

## If, then

### Sumarry

## If, then, else

## For loops

## While loops

### Sumarry


