# Introduction to Python

*This chapter is based on awesome tutorials by Geek Girls Carrots (http://django.carrots.pl/)*

Let's write some code!

## Python prompt

To start tinkering with Python, we need to open up a *prompt* on your computer. On Mac OS X you can do this by launching the `Terminal` application (it's in Applications → Utilities). On Windows you need to go to Start menu → All Programs → Accessories → Command Prompt. On Linux, it's probably under Applications → Accessories → Terminal.

A window should pop up on your screen. This window is a prompt, waiting for commands from you. We want to open up a Python console, so type in `python` and hit Enter.

    (workshops) ~$ python
    Python 3.4.1 (...)
    Type "copyright", "credits" or "license" for more information.
    >>>

After running the python command, the prompt changed to `>>>`. For us it means that for now we may only use commands in the Python language. You don't have to type in `>>>` - Python will do that for you.

## Your first Python command!

Let's start with something really simple. For example, try typing some math, like `2 + 3` and hit Enter.

    >>> 2 + 3
    5

Nice! See how the answer popped out? Python knows math! You could try other commands like:
- `4 * 5`
- `5 - 1`
- `40 / 2`

Have fun with this for a little while and then get back here :).

As you can see, Python is a great calculator. If you're wondering what else you can do...

## Strings

Maybe your name? Type your first name in quotes like this:

    >>> "Ola"
    'Ola'

You've now created your first string! It's a set of characters that can be processed by a computer. The string must always begin and end with the same character. This may be an apostrophe (`'`) or double quotes (`"`) - they tell Python that it is a string.

Strings can be added. Try this:

    >>> "Hi there " + "Ola"
    'Hi there Ola'

You can also multiply strings by a number:

    >>> "Ola" * 3
    'OlaOlaOla'

Nice, huh? To see your name in uppercase, simply type:

    >>> "Ola".upper()
    'OLA'

You just used the `upper` __function__ on your string! A function (`upper`) is a set of instructions that Python has to perform on a given object (`"Ola"`) once you call it.

If you want to get the number of letters in your name, there is a function for that too!

    >>> len("Ola")
    3

Wonder why sometimes you call functions by adding `.` at the end of the string (like `"Ola".upper()`) and sometimes you first call a function and place the string in parentheses? Well, in some cases, functions belong to objects, like `upper` that can only be performed on Strings. In this case, we call the function a __method__. Other times, functions don't belong to anything specific and can be used on different types of objects, just like `len`. That's why we're giving `"Ola"` as a parameter to `len` function.

### Summary

Ok, enough of strings. So far you've learned about:

- __the prompt__ - typing commands (code) into prompt give you Python answers
- __numbers and strings__ - in Python it's math and text objects
- __functions__ - are actions in Python. You've used both English-language functions (upper, len) and symbolic ones (+, *).

That's the basics of every programming language you learn. Ready for something harder? We bet you are!

## Errors

Let's try something. Can we get a length of a number, the same way we learn about the length of our name? Try typing `len(304023)` and hit Enter:

    >>> len(304023)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: object of type 'int' has no len()

We got our first error! It says that objects of type "int" (integers, whole numbers) don't have a length. So what can we do now? Maybe we can write our number as a string? Strings have length, right?

    >>> len(str(304023))
    6

It worked! We used `str` function inside of `len` function. `str` is converting everything to strings.

- The `str` function converts things into __strings__
- The `int` function converts things into __integers__

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers - what would `int('hello')` be anyway?

## Variables

An important concept in programming is variables. A variable is nothing more than a name for something so you can use it later. Programmers use these variables to store data, make their code more readable and to not help them remember what things are.

Let's say we want to create a new variable called `name`:

    >>> name = "Ola"

You see? It's easy! Simply: name equals Ola.

As you've noticed, your program didn't return anything like it did before. How do we now that the variable actually is there? Simply enter `name` and hit Enter:

    >>> name
    'Ola'

Yippee! Your first variable :)! You can always change what it is:

    >>> name = "Sonja"
    >>> name
    'Sonja'

You can use it in functions too:

    >>> len(name)
    5

Awesome, right? Of course, variables can be anything, numbers too! Try this:

    >>> a = 4
    >>> b = 6
    >>> a * b
    24

Play with this for a while and see what you can do!

## Lists

Beside strings and integers, Python has all sorts of different types of objects. Now we're going to introduce one called __list__. Lists are exactly what you think they are: they are objects which are lists of other objects :)

Go ahead and create a list:

    >>> []
    []

Yes, it's empty. Not very useful, right? Let's create a list of lottery numbers. We don't want to repeat ourselves all the time, so we will put it in a variable, too:

    >>> lottery = [3, 42, 12, 19, 30, 59]

All right, we have a list! What can we do with it? Let's see how many lottery numbers there are in a list. Do you have an idea which function you should use for that? You know this already!

    >>> len(lottery)
    6

Yes! `len` can give you a number of objects in a list. Handy, right? Maybe we will sort it now:

    >>> lottery.sort()

This doesn't return anything, it just changed the list in place. Let's print it out again and see what happened:

    >>> print(lottery)
    [3, 12, 19, 30, 42, 59]

As you can see, numbers are now sorted from lowest to highest in your list. Congrats!

Maybe we want to reverse the order? Let's do that!

    >>> lottery.reverse()
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3]

Easy, right? If you want to add something to the list, you can do this by typing this command:

    >>> lottery.append(199)
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3, 199]

If you want to read only the first number, you can do this by using __indexes__. Computer people like to start counting at 0, so the first object of the list is at number 0, next one is 1, and so on. Try this:

    >>> print(lottery[0])
    59
    >>> print(lottery[1])
    42

As you can see, you can access different objects in your list by using its name and index number inside of square brackets.

You can find a list of all available list methods here in Python documentation: https://docs.python.org/3/tutorial/datastructures.html

### Summary

Awesome! You know a lot about programming now. In the last part you learned about:

- __errors__ - you now know how to read and understand errors that show up if Python doesn't understand your command
- __variables__ - names for objects that allow to code more easily and make your code more readable
- __lists__ - list of objects stored in particular order.

Excited for the next part? :)

## Compare things

The big part of programming includes comparing things. What's the easiest thing to compare? Numbers, of course. Let's see how it works:

    >>> 5 > 2
    True
    >>> 3 < 1
    False
    >>> 5 > 2 * 2
    True
    >>> 1 == 1
    True

We gave Python some numbers to compare. As you can see, Python can compare not only numbers, but it can also compare method results. Nice, huh?

Do you wonder why we put two `==` next to each other to compare if numbers are equal? We use single `=` for assigning value to variables, so Python would think that we're trying to do that. You always, __always__ need to put two `==` if you want to check if things are equal to each other.

Give Python two more tasks:

    >>> 6 >= 12 / 2
    True
    >>> 3 <= 2
    False

`>` and `<` are easy, but what `>=` and `<=` means? Read this like that:

- x `>` y - x is greater than y
- x `<` y - x is smaller than y
- x `<=` y - x is smaller or equal to y
- x `>=` y - x is greater or equal to y

Awesome! Wanna do one more? Try this:

    >>> 6 > 2 and 2 < 3
    True
    >>> 3 > 2 and 2 < 1
    False
    >>> 3 > 2 or 2 < 1
    True

You can give Python as many numbers to compare as you want, and it will give you an answer! Pretty smart, right?

- __and__ - if you use `and` operator, both of the comparisons have to be True in order for the whole thing to be True
- __or__ - if you use `or` operator, only one of the comparisons has to be True in order for the whole thing to be True

## Boolean

Accidently, you just learned about a new type of object in Python. It's called a __boolean__ -- probably the easiest type there is.

There are only two boolean objects::
- True
- False

But for Python to understand it, you need to always write it as True (first letter uppercased, rest of the letter lowercased). __true, TRUE, tRUE won't work -- only True is correct.__

Booleans can be variables, too! See:

    >>> a = True
    >>> a
    True

You can also do it this way:

    >>> a = 2 > 5
    >>> a
    False

Practice and have fun with Boolean by trying to run following commands:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Congrats! You can now move on to the essence of programming:

## If...elif...else

Lots of things in code should only be executed when given conditions are met. That's why Python has something called __if statements__.

Try this:

    >>> if 3 > 2:
    ...

So far nothing has happened, as evidenced by dots `...` instead of incentives `>>>`, which we saw so far. Python expects us to give further instructions which are supposed to be executed if the condition `3 > 2` turns to be true. Let’s try to make Python print “It works!”:

    >>> if 3 > 2:
    ... print('It works!')
      File "<stdin>", line 2
        print('It works')
            ^
    IndentationError: expected an indented block

Well...something went wrong! Python needs to know whether the instruction we have written is a continuation of `if` or it is the next instruction not covered by the condition. We need to indent our code to make it work:

    >>> if 3 > 2:
    ...     print('It works!')
    ...
    It works!

All you need is one space or `TAB` after `...`. To avoid chaos, most of the Python programmers use four spaces for each level of indentation.

Everything that is indented after `if` statement will be executed if conditions are met. See:

    >>> if 3 > 2:
    ...     print('It works!')
    ...     print('Another command')
    ...
    It works!
    Another command

### What if not?

In previous examples, code was executed only when conditions are True. But Python also has `elif` and `else` statements:

    >>> if 5 > 2:
    ...     print('5 is indeed greater than 2')
    ... else:
    ...     print('5 is not greater than 2')
    ...
    5 is indeed greater than 2

If 2 would be greater than 5, then the second command will be executed. Easy, right? Let's see how `elif` works:

    >>> name = 'Sonja'
    >>> if name == 'Ola':
    ...     print('Hey Ola!')
    ... elif name == 'Sonja':
    ...     print('Hey Sonja!')
    ... else:
    ...     print('Hey anonymous!')
    ...
    Sonja!

See what happened there?

### Summary

In the last three exercises you learned about:

- __comparing things__ - in Python you can compare things together using `>`, `>=`, `==`, `<=`, `<` and `and`, `or` operators
- __boolean__ - a type of object that can only have two values: `True` and `False`
- __if...elif...else__ - statements that allow you to execute code only when certain conditions are met.

Time for the last part of this chapter!

## Your own functions!

Remember functions like `len` that you can execute in Python? Well, good news, you will learn how to write your own functions now!

A function is a set of instructions that Python should execute. Each function in Python starts with the keyword `def`, has a name and can have some parameters. Let's start with an easy one:

    >>> def hi():
    ...

As you can see, there are the dots again! This means that nothing has really happened yet... and yes, we need to do a `TAB` before giving our instructions:

    >>> def hi():
    ...     print('Hi there!')
    ...     print('How are you?')
    ...

Ok, our first function is ready! Let's execute it:

    >>> hi()
    Hi there!
    How are you?

Great! You're now a programmer, congratulate yourself :)!

That was easy! Let's build our first function with parameters. We will use the previous example with names:

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

As you can see, we needed to put two tabs before `print` function, because `if` needs to know what should happen when condition is met. Let's see how it works now:

    >>> hi("Ola")
    Hi Ola!
    >>> hi("Sonja")
    Hi Sonja!
    >>> hi("Anja")
    Hi anonymous!

Awesome, right? This way you don't have to repeat yourself every time you want to change the name. And that's exactly why we need functions - you never want to repeat your code!

Let's do something smarter -- there is more names than two, and writing a condition for each would be hard, right?

    >>> def hi(name):
    ...     print('Hi ' + name + '!')
    ...

Let's call the function now:

    >>> hi("Rachel")
    Hi Rachel!

Congratulations! You just learned how to write functions :)!

## Loops

That's the last part already. That was quick, right?:)

As we mentioned, programmers are lazy, they don't like to repeat themselves. Programming is all about automating things, so we don't want to greet every girl by their name manually, right? That's where loops come in handy.

Remember lists yet? Let's do a list of all the girls:

    >>> girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']

We want to greet all of them by their name. We have `hi` function to do that, so let's use it in a loop:

    >>> for name in girls:
    ...

Dots again! Remember what goes after dots? Yes, tab :)

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

As you can see, everything you will put inside `for` statement with `tab` will be repeated for every element of the list `girls`.

You can also do `for` on numbers using `range` method:

    >>> for i in range(1, 6):
    ...     print(i)
    ...
    1
    2
    3
    4
    5

`range` is a function that creates a list of numbers from one number to another (numbers are given by you as parameters).

## Summary

That's it. __You totally rock!__ It really wasn't so easy, so you should feel proud of yourself. We're definitely proud of you for making it here!

Grab yourself a cupcake and go to the next chapter :)

![Cupcake](images/cupcake.png)
