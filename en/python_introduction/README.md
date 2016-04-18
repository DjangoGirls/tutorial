# Introduction to Python

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Let's write some code!

## Python prompt

> For readers at home: this part is covered in [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

To start playing with Python, we need to open up a *command line* on your computer. You should already know how to do that -- you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

Once you're ready, follow the instructions below.

We want to open up a Python console, so type in `python` on Windows or `python3` on Mac OS/Linux and hit `enter`.

    $ python3
    Python 3.4.3 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>

## Your first Python command!

After running the Python command, the prompt changed to `>>>`. For us this means that for now we may only use commands in the Python language. You don't have to type in `>>>` - Python will do that for you.

If you want to exit the Python console at any point, just type `exit()` or use the shortcut `Ctrl + Z` for Windows and `Ctrl + D` for Mac/Linux. Then you won't see `>>>` any longer.

For now, we don't want to exit the Python console. We want to learn more about it. Let's start with something really simple. For example, try typing some math, like `2 + 3` and hit `enter`.

    >>> 2 + 3
    5

Nice! See how the answer popped out? Python knows math! You could try other commands like:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Have fun with this for a little while and then get back here :).

As you can see, Python is a great calculator. If you're wondering what else you can do...

## Strings

How about your name? Type your first name in quotes like this:

    >>> "Ola"
    'Ola'

You've now created your first string! It's a sequence of characters that can be processed by a computer. The string must always begin and end with the same character. This may be single (`'`) or double (`"`) quotes (there is no difference!) The quotes tell Python that what's inside of them is a string.

Strings can be strung together. Try this:

    >>> "Hi there " + "Ola"
    'Hi there Ola'

You can also multiply strings with a number:

    >>> "Ola" * 3
    'OlaOlaOla'

If you need to put an apostrophe inside your string, you have two ways to do it.

Using double quotes:

    >>> "Runnin' down the hill"
    "Runnin' down the hill"

or escaping the apostrophe with a backslash (`\`):

    >>> 'Runnin\' down the hill'
    "Runnin' down the hill"

Nice, huh? To see your name in uppercase letters, simply type:

    >>> "Ola".upper()
    'OLA'

You just used the `upper` __method__ on your string! A method (like `upper()`) is a sequence of instructions that Python has to perform on a given object (`"Ola"`) once you call it.

If you want to know the number of letters contained in your name, there is a __function__ for that too!

    >>> len("Ola")
    3

Wonder why sometimes you call functions with a `.` at the end of a string (like `"Ola".upper()`) and sometimes you first call a function and place the string in parentheses? Well, in some cases, functions belong to objects, like `upper()`, which can only be performed on strings. In this case, we call the function a __method__. Other times, functions don't belong to anything specific and can be used on different types of objects, just like `len()`. That's why we're giving `"Ola"` as a parameter to the `len` function.

### Summary

OK, enough of strings. So far you've learned about:

- __the prompt__ - typing commands (code) into the Python prompt results in answers in Python
- __numbers and strings__ - in Python numbers are used for math and strings for text objects
- __operators__ - like + and \*, combine values to produce a new one
- __functions__ - like upper() and len(), perform actions on objects.

These are the basics of every programming language you learn. Ready for something harder? We bet you are!

## Errors

Let's try something new. Can we get the length of a number the same way we could find out the length of our name? Type in `len(304023)` and hit `enter`:

    >>> len(304023)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: object of type 'int' has no len()

We got our first error! It says that objects of type "int" (integers, whole numbers) have no length. So what can we do now? Maybe we can write our number as a string? Strings have a length, right?

    >>> len(str(304023))
    6

It worked! We used the `str` function inside of the `len` function. `str()` converts everything to strings.

- The `str` function converts things into __strings__
- The `int` function converts things into __integers__

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers - what would `int('hello')` be anyway?

## Variables

An important concept in programming is variables. A variable is nothing more than a name for something so you can use it later. Programmers use these variables to store data, make their code more readable and so they don't have to keep remembering what things are.

Let's say we want to create a new variable called `name`:

    >>> name = "Ola"

You see? It's easy! It's simply: name equals Ola.

As you've noticed, your program didn't return anything like it did before. So how do we know that the variable actually exists? Simply enter `name` and hit `enter`:

    >>> name
    'Ola'

Yippee! Your first variable :)! You can always change what it refers to:

    >>> name = "Sonja"
    >>> name
    'Sonja'

You can use it in functions too:

    >>> len(name)
    5

Awesome, right? Of course, variables can be anything, so numbers too! Try this:

    >>> a = 4
    >>> b = 6
    >>> a * b
    24

But what if we used the wrong name? Can you guess what would happen? Let's try!

    >>> city = "Tokyo"
    >>> ctiy
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'ctiy' is not defined

An error! As you can see, Python has different types of errors and this one is called a **NameError**. Python will give you this error if you try to use a variable that hasn't been defined yet. If you encounter this error later, check your code to see if you've mistyped any names.

Play with this for a while and see what you can do!


## The print function

Try this:

    >>> name = 'Maria'
    >>> name
    'Maria'
    >>> print(name)
    Maria

When you just type `name`, the Python interpreter responds with the string *representation* of the variable 'name', which is the letters M-a-r-i-a, surrounded by single quotes, ''. When you say `print(name)`, Python will "print" the contents of the variable to the screen, without the quotes, which is neater.

As we'll see later, `print()` is also useful when we want to print things from inside functions, or when we want to print things on multiple lines.


## Lists

Beside strings and integers, Python has all sorts of different types of objects. Now we're going to introduce one called __list__. Lists are exactly what you think they are: objects which are lists of other objects :)

Go ahead and create a list:

    >>> []
    []

Yes, this list is empty. Not very useful, right? Let's create a list of lottery numbers. We don't want to repeat ourselves all the time, so we will put it in a variable, too:

    >>> lottery = [3, 42, 12, 19, 30, 59]

All right, we have a list! What can we do with it? Let's see how many lottery numbers there are in a list. Do you have any idea which function you should use for that? You know this already!

    >>> len(lottery)
    6

Yes! `len()` can give you a number of objects in a list. Handy, right? Maybe we will sort it now:

    >>> lottery.sort()

This doesn't return anything, it just changed the order in which the numbers appear in the list. Let's print it out again and see what happened:

    >>> print(lottery)
    [3, 12, 19, 30, 42, 59]

As you can see, the numbers in your list are now sorted from the lowest to highest value. Congrats!

Maybe we want to reverse that order? Let's do that!

    >>> lottery.reverse()
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3]

Easy, right? If you want to add something to your list, you can do this by typing this command:

    >>> lottery.append(199)
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3, 199]

If you want to show only the first number, you can do this by using __indexes__. An index is the number that says where in a list an item occurs. Programmers prefer to start counting at 0, so the first object in your list is at index 0, the next one is at 1, and so on. Try this:

    >>> print(lottery[0])
    59
    >>> print(lottery[1])
    42

As you can see, you can access different objects in your list by using the list's name and the object's index inside of square brackets.

To delete something from your list you will need to use __indexes__ as we learnt above and the __del__ statement (del is an abbreviation for delete). Let's try an example and reinforce what we learnt previously; we will be deleting the first number of our list.

    >>> print(lottery)
    [59, 42, 30, 19, 12, 3, 199]
    >>> print(lottery[0])
    59
    >>> del lottery[0]
    >>> print(lottery)
    [42, 30, 19, 12, 3, 199]

That worked like a charm!

For extra fun, try some other indexes: 6, 7, 1000, -1, -6 or -1000. See if you can predict the result before trying the command. Do the results make sense?

You can find a list of all available list methods in this chapter of the Python documentation: https://docs.python.org/3/tutorial/datastructures.html

## Dictionaries

> For readers at home: this part is covered in [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of an index. A key can be any string or number. The syntax to define an empty dictionary is:

    >>> {}
    {}

This shows that you just created an empty dictionary. Hurray!

Now, try writing the following command (try replacing your own information too):

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key-value pairs:

- The key `name` points to the value `'Ola'` (a `string` object),
- `country` points to `'Poland'` (another `string`),
- and `favorite_numbers` points to `[7, 42, 92]` (a `list` with three numbers in it).

You can check the content of individual keys with this syntax:

    >>> print(participant['name'])
    Ola

See, it's similar to a list. But you don't need to remember the index - just the name.

What happens if we ask Python the value of a key that doesn't exist? Can you guess? Let's try it and see!

    >>> participant['age']
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    KeyError: 'age'

Look, another error! This one is a **KeyError**. Python is helpful and tells you that the key `'age'` doesn't exist in this dictionary.

When should you use a dictionary or a list? Well, that's a good point to ponder. Just have a solution in mind before looking at the answer in the next line.

- Do you just need an ordered sequence of items? Go for a list.
- Do you need to associate values with keys, so you can look them up efficiently (by key) later on? Use a dictionary.

Dictionaries, like lists, are *mutable*, meaning that they can be changed after they are created. You can add new key/value pairs to a dictionary after it is created, like:

    >>> participant['favorite_language'] = 'Python'

Like lists, using the `len()` method on the dictionaries returns the number of key-value pairs in the dictionary. Go ahead and type in the command:

    >>> len(participant)
    4

I hope it makes sense up to now. :) Ready for some more fun with dictionaries? Hop onto the next line for some amazing things.

You can use the `del` command to delete an item in the dictionary. Say, if you want to delete the entry corresponding to the key `'favorite_numbers'`, just type in the following command:

    >>> del participant['favorite_numbers']
    >>> participant
    {'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}

As you can see from the output, the key-value pair corresponding to  the 'favorite_numbers' key has been deleted.

As well as this, you can also change a value associated with an already created key in the dictionary. Type:

    >>> participant['country'] = 'Germany'
    >>> participant
    {'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}

As you can see, the value of the key `'country'` has been altered from `'Poland'` to `'Germany'`. :) Exciting? Hurrah! You just learnt another amazing thing.

### Summary

Awesome! You know a lot about programming now. In this last part you learned about:

- __errors__ - you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- __variables__ - names for objects that allow you to code more easily and to make your code more readable
- __lists__ - lists of objects stored in a particular order
- __dictionaries__ - objects stored as key-value pairs

Excited for the next part? :)

## Compare things

> For readers at home: this part is covered in [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) video.

A big part of programming includes comparing things. What's the easiest thing to compare? Numbers, of course. Let's see how that works:

    >>> 5 > 2
    True
    >>> 3 < 1
    False
    >>> 5 > 2 * 2
    True
    >>> 1 == 1
    True
    >>> 5 != 2
    True

We gave Python some numbers to compare. As you can see, Python can compare not only numbers, but it can also compare method results. Nice, huh?

Do you wonder why we put two equal signs `==` next to each other to compare if numbers are equal? We use a single `=` for assigning values to variables. You always, __always__ need to put two `==` if you want to check if things are equal to each other. We can also state that things are unequal to each other. For that, we use the symbol `!=`, as shown in the example above.

Give Python two more tasks:

    >>> 6 >= 12 / 2
    True
    >>> 3 <= 2
    False

`>` and `<` are easy, but what do `>=` and `<=` mean? Read them like this:

- x `>` y means: x is greater than y
- x `<` y means: x is less than y
- x `<=` y means: x is less than or equal to y
- x `>=` y means: x is greater than or equal to y

Awesome! Wanna do one more? Try this:

    >>> 6 > 2 and 2 < 3
    True
    >>> 3 > 2 and 2 < 1
    False
    >>> 3 > 2 or 2 < 1
    True

You can give Python as many numbers to compare as you want, and it will give you an answer! Pretty smart, right?

- __and__ - if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- __or__ - if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Have you heard of the expression "comparing apples to oranges"? Let's try the Python equivalent:

    >>> 1 > 'django'
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: unorderable types: int() > str()

Here you see that just like in the expression, Python is not able to compare a number (`int`) and a string (`str`).
Instead, it shows a **TypeError** and tells us the two types can't be compared together.

## Boolean

Incidentally, you just learned about a new type of object in Python. It's called a __Boolean__ -- and it probably is the easiest type there is.

There are only two Boolean objects:
- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercased, with the rest of the letter lowercased). __true, TRUE, tRUE won't work -- only True is correct.__ (The same applies to 'False' as well, of course.)

Booleans can be variables, too! See here:

    >>> a = True
    >>> a
    True

You can also do it this way:

    >>> a = 2 > 5
    >>> a
    False

Practice and have fun with Booleans by trying to run the following commands:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Congrats! Booleans are one of the coolest features in programming, and you just learned how to use them!

# Save it!

> For readers at home: this part is covered in [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.


So far we've been writing all our python code in the interpreter, which limits us to entering one line of code at a time. Normal programs are saved in files and executed by our programming language __interpreter__ or __compiler__. So far we've been running our programs one line at a time in the Python __interpreter__. We're going to need more than one line of code for the next few tasks, so we'll quickly need to:

- Exit the Python interpreter
- Open up our code editor of choice
- Save some code into a new python file
- Run it!

To exit from the Python interpreter that we've been using, simply type the ```exit()``` function:

    >>> exit()
    $

This will put you back into the command prompt.

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file:

```python
print('Hello, Django girls!')
```

Obviously, you're a pretty seasoned Python developer now, so feel free to write some code that you've learned today.

Now we need to save the file and give it a descriptive name. Let's call the file **python_intro.py** and save it to your desktop. We can name the file anything we want, but the important part here is to make sure the file ends in __.py__. The __.py__ extension tells our operating system that this is a **python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colours! In the Python console, everything was the same colour, now you should see that the `print` function is a different colour from the string. This is called "syntax highlighting", and it's a really useful feature when coding. The colour of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). This is one of the reasons we use a code editor :)


With the file saved, it's time to run it! Using the skills you've learned in the command line section, use the terminal to **change directories** to the desktop.  (**Note**:  Replace `<your_name>` including the `<` and `>` with your user name)

On a Mac, the command will look something like this:

    $ cd /Users/<your_name>/Desktop

On Linux, it will be like this (the word "Desktop" might be translated to your language):

    $ cd /home/<your_name>/Desktop

And on windows, it will be like this:

    > cd C:\Users\<your_name>\Desktop

If you get stuck, just ask for help.

Now use Python to execute the code in the file like this:

    $ python3 python_intro.py
    Hello, Django girls!

Alright! You just ran your first Python program that was saved to a file. Feel awesome?

You can now move on to an essential tool in programming:

## If...elif...else

Lots of things in code should only be executed when given conditions are met. That's why Python has something called __if statements__.

Replace the code in your **python_intro.py** file with this:

```python
if 3 > 2:
```

If we saved this and ran it, we'd see an error like this:

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing

Python expects us to give further instructions to it which are executed if the condition `3 > 2` turns out to be true (or `True` for that matter). Let’s try to make Python print “It works!”. Change your code in your **python_intro.py** file to this:

```python
if 3 > 2:
    print('It works!')
```

Notice how we've indented the next line of code by 4 spaces? We need to do this so Python knows what code to run if the result is true. You can do one space, but nearly all Python programmers do 4 to make things look neat. A single `tab` will also count as 4 spaces.

Save it and give it another run:

    $ python3 python_intro.py
    It works!

### What if a condition isn't True?

In previous examples, code was executed only when the conditions were True. But Python also has `elif` and `else` statements:

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

When this is run it will print out:

    $ python3 python_intro.py
    5 is indeed greater than 2

If 2 were a greater number than 5, then the second command would be executed. Easy, right? Let's see how `elif` works:

```python
name = 'Sonja'
if name == 'Ola':
    print('Hey Ola!')
elif name == 'Sonja':
    print('Hey Sonja!')
else:
    print('Hey anonymous!')
```

and executed:

    $ python3 python_intro.py
    Hey Sonja!

See what happened there? `elif` lets you add extra conditions that run if the previous conditions fail. 

You can add as many `elif` statements as you like after your initial `if` statement. For example:

```python
volume = 57
if volume < 20:
    print("It's kinda quiet.")
elif 20 <= volume < 40:
    print("It's nice for background music")
elif 40 <= volume < 60:
    print("Perfect, I can hear all the details")
elif 60 <= volume < 80:
    print("Nice for parties")
elif 80 <= volume < 100:
    print("A bit loud!")
else:
    print("My ears are hurting! :(")
```

Python runs through each test in sequence and prints:
     
    $ python3 python_intro.py
    Perfect, I can hear all the details

### Summary

In the last three exercises you learned about:

- __comparing things__ - in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- __Boolean__ - a type of object that can only have one of two values: `True` or `False`
- __Saving files__ - storing code in files so you can execute larger programs.
- __if...elif...else__ - statements that allow you to execute code only when certain conditions are met.

Time for the last part of this chapter!

## Your own functions!

> For readers at home: this part is covered in [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news - you will learn how to write your own functions now!

A function is a sequence of instructions that Python should execute. Each function in Python starts with the keyword `def`, is given a name, and can have some parameters. Let's start with an easy one. Replace the code in **python_intro.py** with the following:

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Okay, our first function is ready!

You may wonder why we've written the name of the function at the bottom of the file. This is because Python reads the file and executes it from top to bottom. So in order to use our function, we have to re-write it at the bottom.

Let's run this now and see what happens:

    $ python3 python_intro.py
    Hi there!
    How are you?

That was easy! Let's build our first function with parameters. We will use the previous example - a function that says 'hi' to the person running it - with a name:

```python
def hi(name):
```

As you can see, we now gave our function a parameter that we called `name`:

```python
def hi(name):
    if name == 'Ola':
        print('Hi Ola!')
    elif name == 'Sonja':
        print('Hi Sonja!')
    else:
        print('Hi anonymous!')

hi()
```

Remember: The `print` function is indented four spaces within the `if` statement. This is because the function runs when the condition is met. Let's see how it works now:

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'

Oops, an error. Luckily, Python gives us a pretty useful error message.
It tells us that the function `hi()` (the one we defined) has one required argument (called `name`) and that we forgot to pass it when calling the function.
Let's fix it at the bottom of the file:

```python
hi("Ola")
```

And run it again:

    $ python3 python_intro.py
    Hi Ola!

And if we change the name?

```python
hi("Sonja")
```

And run it:

    $ python3 python_intro.py
    Hi Sonja!

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja) Give it a try and see if you're right. It should print out this:

    Hi anonymous!

This is awesome, right? This way you don't have to repeat yourself every time you want to change the name of the person the function is supposed to greet. And that's exactly why we need functions - you never want to repeat your code!

Let's do something smarter -- there are more names than two, and writing a condition for each would be hard, right?

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Let's call the code now:

    $ python3 python_intro.py
    Hi Rachel!

Congratulations! You just learned how to write functions! :)

## Loops

> For readers at home: this part is covered in [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

This is the last part already. That was quick, right? :)

Programmers don't like to repeat themselves. Programming is all about automating things, so we don't want to greet every person by their name manually, right? That's where loops come in handy.

Still remember lists? Let's do a list of girls:

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

We want to greet all of them by their name. We have the `hi` function to do that, so let's use it in a loop:

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

Here is the full code that will be in the file:

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

And when we run it:

    $ python3 python_intro.py
    Hi Rachel!
    Next girl
    Hi Monica!
    Next girl
    Hi Phoebe!
    Next girl
    Hi Ola!
    Next girl
    Hi You!
    Next girl

As you can see, everything you put inside a `for` statement with an indent will be repeated for every element of the list `girls`.

You can also use `for` on numbers using the `range` function:

    for i in range(1, 6):
        print(i)

Which would print:

    1
    2
    3
    4
    5

`range` is a function that creates a list of numbers following one after the other (these numbers are provided by you as parameters).

Note that the second of these two numbers is not included in the list that is output by Python (meaning `range(1, 6)` counts from 1 to 5, but does not include the number 6). That is because "range" is half-open, and with that we mean it includes the first value, but not the last.

## Summary

That's it. __You totally rock!__ This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

You might want to briefly do something else - stretch, walk around for a bit, rest your eyes - before going on to the next chapter. :)

![Cupcake](images/cupcake.png)
