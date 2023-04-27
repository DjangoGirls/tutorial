Alright! 
You just ran your first Python program that was saved to a file. 
Feel awesome?

You can now move on to an essential tool in programming:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. 
That's why Python has something called __if statements__.

Replace the code in your **python_intro.py** file with this:

{% filename %}python_intro.py{% endfilename %}
```python
if 3 > 2:
```

If we were to save and run this, we'd see an error like this:

{% filename %}{{ warning_icon }} command-line{% endfilename %}
```
$ python3 python_intro.py
File "python_intro.py", line 2
         ^
SyntaxError: unexpected EOF while parsing
```

Python expects us to give further instructions to it which are executed if the 
condition `3 > 2` turns out to be true (or `True` for that matter). 
Let’s try to make Python print “It works!”. 
Change your code in your **python_intro.py** file to this:

{% filename %}python_intro.py{% endfilename %}
```python
if 3 > 2:
    print('It works!')
```

Notice how we've indented the next line of code by 4 spaces? 
We need to do this so Python knows what code to run if the result is true. 
You can do one space, but nearly all Python programmers do 4 to make things 
look neat. 
A single Tab will also count as 4 spaces as long as your text editor is set to 
do so. 
When you made your choice, don't change it! 
If you already indented with 4 spaces, make any future indentation with 4 
spaces, too - otherwise you may run into problems.

Save it and give it another run:

{% filename %}command-line{% endfilename %}
```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. 
From now on, replace 'python3' with 'python' to execute the file.

### What if a condition isn't True?

In previous examples, code was executed only when the conditions were True. 
But Python also has `elif` and `else` statements:

{% filename %}python_intro.py{% endfilename %}
```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

When this is run it will print out:

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
5 is indeed greater than 2
```

If 2 were a greater number than 5, then the second command would be executed. 
Let's see how `elif` works:

{% filename %}python_intro.py{% endfilename %}
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

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hey Sonja!
```

See what happened there? `elif` lets you add extra conditions that run if the 
previous conditions fail.

You can add as many `elif` statements as you like after your initial `if` statement. 
For example:

{% filename %}python_intro.py{% endfilename %}
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

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Perfect, I can hear all the details
```

## Comments

Comments are lines beginning with `#`. 
You can write whatever you want after the `#` and Python will ignore it. 
Comments can make your code easier for other people to understand.

Let's see how that looks:

{% filename %}python_intro.py{% endfilename %}
```python
# Change the volume if it's too loud or too quiet
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

You don't need to write a comment for every line of code, but they are useful 
for explaining why your code is doing something, or providing a summary when 
it's doing something complex.


### Summary

In the last few exercises you learned about:

- __comparing things__ – in Python you can compare things by using `>`, `>=`, 
  `==`, `<=`, `<` and the `and`, `or` operators
- __Boolean__ – a type of object that can only have one of two values: `True` or `False`
- __Saving files__ – storing code in files so you can execute larger programs.
- __if … elif … else__ – statements that allow you to execute code only when 
  certain conditions are met.
- __comments__ - lines that Python won't run which let you document your code

Time for the last part of this chapter!

## Your own functions!

> For readers at home: this part is covered in the 
[Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python?
Well, good news – you will learn how to write your own functions now!

A function is a sequence of instructions that Python should execute. 
Each function in Python starts with the keyword `def`, is given a name, and 
can have some parameters. 
Let's give it a go. 
Replace the code in **python_intro.py** with the following:

{% filename %}python_intro.py{% endfilename %}
```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Okay, our first function is ready!

You may wonder why we've written the name of the function at the bottom of the file. 
When we write `def hi():` and the indented lines following, this is us writing 
instructions for what the `hi()` function should do. 
Python will read and remember these instructions, but won't run the function yet. 
To tell Python we want to run the function, we have to call the function with `hi()`. 
Python reads the file and executes it from top to bottom, so we have to define 
the function in the file before we call it.

Let's run this now and see what happens:

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hi there!
How are you?
```

Note: if it didn't work, don't panic! The output will help you to figure why:
- If you get a `NameError`, that probably means you typed something wrong, so 
  you should check that you used the same name when creating the function with 
  `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have 
  the same whitespace at the start of a line: python wants all the code inside 
  the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if 
  it is, that line will become part of the function too, and it will never get run.

Let's build our first function with parameters. We will change the previous 
example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}
```python
def hi(name):
```

As you can see, we now gave our function a parameter that we called `name`:

{% filename %}python_intro.py{% endfilename %}
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

Remember: The `print` function is indented four spaces within the `if` statement. 
This is because the function runs when the condition is met. 
Let's see how it works now:

{% filename %}{{ warning_icon }} command-line{% endfilename %}
```
$ python3 python_intro.py
Traceback (most recent call last):
File "python_intro.py", line 10, in <module>
  hi()
TypeError: hi() missing 1 required positional argument: 'name'
```

Oops, an error. Luckily, Python gives us a pretty useful error message.
It tells us that the function `hi()` (the one we defined) has one required 
argument (called `name`) and that we forgot to pass it when calling the function.
Let's fix it at the bottom of the file:

{% filename %}python_intro.py{% endfilename %}
```python
hi("Ola")
```

And run it again:

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hi Ola!
```

And if we change the name?

{% filename %}python_intro.py{% endfilename %}
```python
hi("Sonja")
```

And run it:

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hi Sonja!
```

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) 
Give it a try and see if you're right. 
It should print out this:

{% filename %}command-line{% endfilename %}
```
Hi anonymous!
```

This is awesome, right? This way you don't have to repeat yourself every time 
you want to change the name of the person the function is supposed to greet. 
And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a 
condition for each would be hard, right? 
Replace the content of your file with the following:

{% filename %}python_intro.py{% endfilename %}
```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Let's call the code now:

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hi Rachel!
```

Congratulations! You just learned how to write functions! :)

## Loops

> For readers at home: this part is covered in the 
[Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

This is the last part already. That was quick, right? :)

Programmers don't like to repeat themselves. 
Programming is all about automating things, so we don't want to greet every 
person by their name manually, right? That's where loops come in handy.

Still remember lists? Let's do a list of girls:

{% filename %}python_intro.py{% endfilename %}
```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

We want to greet all of them by their name. We have the `hi` function to do that, so let's use it in a loop:

{% filename %}python_intro.py{% endfilename %}
```python
for name in girls:
```

The `for` statement behaves similarly to the `if` statement; code below both of 
these need to be indented four spaces.

Here is the full code that will be in the file:

{% filename %}python_intro.py{% endfilename %}
```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

And when we run it:

{% filename %}command-line{% endfilename %}
```
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
```

As you can see, everything you put inside a `for` statement with an indent will 
be repeated for every element of the list `girls`.

You can also use `for` on numbers using the `range` function:

{% filename %}python_intro.py{% endfilename %}
```python
for i in range(1, 6):
    print(i)
```

Which would print:

{% filename %}command-line{% endfilename %}
```
1
2
3
4
5
```

`range` is a function that creates a list of numbers following one after the 
other (these numbers are provided by you as parameters).

Note that the second of these two numbers is not included in the list that is 
output by Python (meaning `range(1, 6)` counts from 1 to 5, but does not 
include the number 6). 
That is because "range" is half-open, and by that we mean it includes the first 
value, but not the last.

## Summary

That's it. 
__You totally rock!__ T
his was a tricky chapter, so you should feel proud of yourself. 
We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. 
This will give you a more thorough and complete study of the language. 
Cheers! :)

You might want to briefly do something else – stretch, walk around for a bit, 
rest your eyes – before going on to the next chapter. :)


![Cupcake](images/cupcake.png)
