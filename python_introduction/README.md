# Introduction to Python

> Part of this chapter is based on tutorials by Geek Girls Carrots (http://django.carrots.pl/).

Let's write some code!

## Python prompt

To start playing with Python, we need to open up a *command line* on your computer. You should have already knew how to do that -- you have learned it in the [Intro to Command Line](/intro_to_command_line/README.html) chapter.

Once you're ready, follow the instructions below.

We want to open up a Python console, so type in `python3` and hit Enter.

    $ python3
    Python 3.4.1 (...)
    Type "copyright", "credits" or "license" for more information.
    >>>

## Your first Python command!

After running the Python command, the prompt changed to `>>>`. For us this means that for now we may only use commands in the Python language. You don't have to type in `>>>` - Python will do that for you.

If you want to exit the Python console at any point, just type `exit()` or use the shortcut `Ctrl + Z` for Windows and `Ctrl + D` for Mac/Linux. Then you won't see `>>>` any longer.

But now, we don't want to exit the Python console. We want to learn more about it. Let's start with something really simple. For example, try typing some math, like `2 + 3` and hit Enter.

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

You've now created your first string! It's a set of characters that can be processed by a computer. The string must always begin and end with the same character. This may be single (`'`) or double (`"`) quotes - they tell Python that what's inside of them is a string.

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
    
or escaping apostrophe with a backslash (`\`):

    >>> 'Runnin\' down the hill'
    "Runnin' down the hill"

Nice, huh? To see your name in uppercase letters, simply type:

    >>> "Ola".upper()
    'OLA'

You just used the `upper` __function__ on your string! A function (like `upper()`) is a set of instructions that Python has to perform on a given object (`"Ola"`) once you call it.

If you want to know the number of letters contained in your name, there is a function for that too!

    >>> len("Ola")
    3

Wonder why sometimes you call functions with a `.` at the end of a string (like `"Ola".upper()`) and sometimes you first call a function and place the string in parentheses? Well, in some cases, functions belong to objects, like `upper()`, which can only be performed on strings. In this case, we call the function a __method__. Other times, functions don't belong to anything specific and can be used on different types of objects, just like `len()`. That's why we're giving `"Ola"` as a parameter to the `len` function.

### Summary

OK, enough of strings. So far you've learned about:

- __the prompt__ - typing commands (code) into the Python prompt results in answers in Python
- __numbers and strings__ - in Python numbers are used for math and strings for text objects
- __operators__ - like + and *, combine values to produce a new one
- __functions__ - like upper() and len(), perform actions on objects.

These are the basics of every programming language you learn. Ready for something harder? We bet you are!

## Errors

Let's try something new. Can we get the length of a number the same way we could find out the length of our name? Type in `len(304023)` and hit Enter:

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

As you've noticed, your program didn't return anything like it did before. So how do we know that the variable actually exists? Simply enter `name` and hit Enter:

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

    >>> name = "Maria"
    >>> names
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'names' is not defined

An error! As you can see, Python has different types of errors and this one is called a **NameError**. Python will give you this error if you try to use a variable that hasn't been defined yet. If you encounter this error later, check your code to see if you've mistyped any names.

Play with this for a while and see what you can do!


## The print function

Try this:

    >>> name = 'Maria'
    >>> name
    'Maria'
    >>> print(name)
    Maria

When you just type `name`, the Python interpreter responds with the string *representation* of the variable 'name', which is the letters M-a-r-i-a, surrounded by single quotes, ''.  When you say `print(name)`, Python will "print" the contents of the variable to the screen, without the quotes, which is neater.

As we'll see later, `print()` is also useful when we want to print things from inside functions, or when we want to print things on multiple lines.


## Lists

Beside strings and integers, Python has all sorts of different types of objects. Now we're going to introduce one called __list__. Lists are exactly what you think they are: they are objects which are lists of other objects :)

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

If you want to show only the first number, you can do this by using __indexes__. An index is the number that says where in a list an item occurs. Computer people like to start counting at 0, so the first object in your list is at index 0, the next one is at 1, and so on. Try this:

    >>> print(lottery[0])
    59
    >>> print(lottery[1])
    42

As you can see, you can access different objects in your list by using the list's name and the object's index inside of square brackets.

For extra fun, try some other indexes: 6, 7, 1000, -1, -6 or -1000. See if you can predict the result before trying the command. Do the results make sense?

You can find a list of all available list methods in this chapter of the Python documentation: https://docs.python.org/3/tutorial/datastructures.html

## Dictionaries

A dictionary is similar to a list, but you access values by looking up a key instead of an index. A key can be any string or number. The syntax to define an empty dictionary is:

    >>> {}
    {}

This shows that you just created an empty dictionary. Hurray!

Now, try writing the following command (try replacing your own information too):

    >>> participant = {'name' : 'Ola', 'country' : 'Poland', 'favorite_numbers' : [7, 42, 92]}

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

When to use a dictionary or a list? Well, that's a good point to ponder on. Just have a solution in mind before looking at the answer in the next line.

- Do you just need an ordered sequence of items? Go for a list.
- Do you need to associate values with keys, so you can look them up efficiently (by key) later on? Use a dictionary.

Dictionaries, like lists, are *mutable*, meaning that they can be changed after they are created. You can add new key/value pairs to the dictionary after it is created, like:

    >>> participant['favorite_language'] = 'Python'

Like lists, using `len()` method on the dictionaries, returns the number of key-value pairs in the dictionary. Go ahead and type in the command:

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

A big part of programming includes comparing things. What's the easiest thing to compare? Numbers, of course. Let's see how that works:

    >>> 5 > 2
    True
    >>> 3 < 1
    False
    >>> 5 > 2 * 2
    True
    >>> 1 == 1
    True

We gave Python some numbers to compare. As you can see, Python can compare not only numbers, but it can also compare method results. Nice, huh?

Do you wonder why we put two equal signs `==` next to each other to compare if numbers are equal? We use a single `=` for assigning values to variables. You always, __always__ need to put two `==` if you want to check if things are equal to each other.

Give Python two more tasks:

    >>> 6 >= 12 / 2
    True
    >>> 3 <= 2
    False

`>` and `<` are easy, but what do `>=` and `<=` mean? Read them like this:

- x `>` y means: x is greater than y
- x `<` y means: x is smaller than y
- x `<=` y means: x is smaller or equal to y
- x `>=` y means: x is greater or equal to y

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

But for Python to understand this, you need to always write it as True (first letter uppercased, with the rest of the letter lowercased). __true, TRUE, tRUE won't work -- only True is correct.__ (The same applies to False as well, of course.)

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

Congrats! You can now move on to an essential tool in programming:

## If...elif...else

Lots of things in code should only be executed when given conditions are met. That's why Python has something called __if statements__.

Try this:

    >>> if 3 > 2:
    ...

So far nothing has happened, as evidenced by the dots `...` instead of incentives `>>>` which we saw so far. Python expects us to give further instructions to it which are supposed to be executed if the condition `3 > 2` turns out to be true (or `True` for that matter). Let’s try to make Python print “It works!”:

    >>> if 3 > 2:
    ... print('It works!')
      File "<stdin>", line 2
        print('It works')
            ^
    IndentationError: expected an indented block

Well... something went wrong here! Python needs to know whether the instruction we have written is a continuation of `if` or a next instruction not covered by the condition. We need to indent our code to make it work:

    >>> if 3 > 2:
    ...     print('It works!')
    ...
    It works!

All you need is one space after `...`. To avoid chaos, most Python programmers use four spaces for each level of indentation.

Everything that is indented after the `if` statement will be executed if the condition is met. See:

    >>> if 3 > 2:
    ...     print('It works!')
    ...     print('Another command')
    ...
    It works!
    Another command

### What if not?

In previous examples, code was executed only when the conditions were True. But Python also has `elif` and `else` statements:

    >>> if 5 > 2:
    ...     print('5 is indeed greater than 2')
    ... else:
    ...     print('5 is not greater than 2')
    ...
    5 is indeed greater than 2

If 2 were a greater number than 5, then the second command would be executed. Easy, right? Let's see how `elif` works:

    >>> name = 'Sonja'
    >>> if name == 'Ola':
    ...     print('Hey Ola!')
    ... elif name == 'Sonja':
    ...     print('Hey Sonja!')
    ... else:
    ...     print('Hey anonymous!')
    ...
    Hey Sonja!

See what happened there?

### Summary

In the last three exercises you learned about:

- __comparing things__ - in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- __Boolean__ - a type of object that can only have one of two values: `True` or `False`
- __if...elif...else__ - statements that allow you to execute code only when certain conditions are met.

Time for the last part of this chapter!

## Your own functions!

Remember functions like `len()` that you can execute in Python? Well, good news, you will learn how to write your own functions now!

A function is a set of instructions that Python should execute. Each function in Python starts with the keyword `def`, is given a name and can have some parameters. Let's start with an easy one:

    >>> def hi():
    ...

As you can see, there are those dots again! This means that nothing has really happened yet... and yes, we need to press the `Space` key before giving our instructions:

    >>> def hi():
    ...     print('Hi there!')
    ...     print('How are you?')
    ...

OK, our first function is ready! Press Enter to get back to the Python prompt again. Now let's execute our function:

    >>> hi()
    Hi there!
    How are you?

Great! You're now a programmer, congratulate yourself :)!

That was easy! Let's build our first function with parameters. We will use the previous example - a function that says 'hi' to the person running it - with a name:

    >>> def hi(name):
    ...

As you can see, we now gave our function a parameter that we called `name`:

    >>> def hi(name):
    ...     if name == 'Ola':
    ...         print('Hi Ola!')
    ...     elif name == 'Sonja':
    ...         print('Hi Sonja!')
    ...     else:
    ...         print('Hi anonymous!')
    ...

As you can see, we needed to put two indents before the `print` function, because `if` needs to know what should happen when the condition is met. Let's see how it works now:

    >>> hi()
        Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: hi() missing 1 required positional argument: 'name'

Oops, an error. Luckily, Python gives us a pretty useful error message.
It tells us that the function `hi()` (the one we defined) has one required argument (called `name`) and that we forgot to pass it when calling the function.
Let's fix it then:

    >>> hi("Ola")
    Hi Ola!
    >>> hi("Sonja")
    Hi Sonja!
    >>> hi("Anja")
    Hi anonymous!

Awesome, right? This way you don't have to repeat yourself every time you want to change the name of the person the function is supposed to greet. And that's exactly why we need functions - you never want to repeat your code!

Let's do something smarter -- there are more names than two, and writing a condition for each would be hard, right?

    >>> def hi(name):
    ...     print('Hi ' + name + '!')
    ...

Let's call the function now:

    >>> hi("Rachel")
    Hi Rachel!

Congratulations! You just learned how to write functions :)!

## Loops

That's the last part already. That was quick, right? :)

As we mentioned, programmers are lazy, they don't like to repeat themselves. Programming is all about automating things, so we don't want to greet every person by their name manually, right? That's where loops come in handy.

Still remember lists? Let's do a list of girls:

    >>> girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']

We want to greet all of them by their name. We have the `hi` function to do that, so let's use it in a loop:

    >>> for name in girls:
    ...

Dots again! Remember what goes after the dots? Yes, a space :)

    >>> for name in girls:
    ...     hi(name)
    ...     print('Next girl')
    ...
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

You can also use `for` on numbers using the `range` method:

    >>> for i in range(1, 6):
    ...     print(i)
    ...
    1
    2
    3
    4
    5

`range` is a function that creates a list of numbers following one after the other (these numbers are provided by you as parameters).

Note that the second of these two numbers is not included in the list that is output by Python (meaning `range(1, 6)` counts from 1 to 5, but does not include the number 6).

## Exiting Python

You can exit Python and return to the command line using `exit()`.

## Summary

That's it. __You totally rock!__ This really wasn't so easy, so you should feel proud of yourself. We're definitely proud of you for making it to here!

Grab yourself a cupcake and go to the next chapter :)

![Cupcake](images/cupcake.png)
