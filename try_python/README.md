# Let’s start with Python

Huh, it's exciting, right?! You'll write your first line of code in just minutes!

But first, let me tell you what Python is. Python is a very popular programming language that can be used to write websites, games, science, graphics, and many, many more. Python was conceived in the late 1980s and it's main goal is to be readable by human beings (not only machines!) that's why it looks much simpler than other programming laungages. That also makes it easy to learn, but don't worry, Python is also really powerful!

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

Wonder why sometimes you call methods by adding `.` at the end of the string (like `"Ola".upper()`) and sometimes you first call a method and add string in brackets? Well, in some cases, methods belong to objects, like `upper` that can only be performed on Strings. But sometimes, methods don't belong to anything specific and can be used on different types of objects, just like `len`. That's why we're giving `"Ola"` as a parameter to `len` method.

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

## Lists

empty list
list with elements
methods on lists

## Variables

### Summary

## Dicts

creating dicts
reading dicts
editing dicts

## Boolean

true, false

## If, then, comparisions (>, <)

### Sumarry

## If, then, else

## For loops

## While loops

### Sumarry


