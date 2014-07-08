# What is Django?

Django (_/ˈdʒæŋɡoʊ/ jang-goh_) is a free and open source web application framework, written in Python. It's a web framework - a set of components that helps you to develop websites faster and easier.

You see, when you're building a website, you always need a similiar set of components: a way to handle user authentication (signing up, signing in, signing out), management panel for your website, forms, uploading files, etc.

Luckily for you other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django is one of them) that gives you ready components you can use.

Frameworks exist to save you from having to re-invent the wheel and help alleviate some of the overhead when you’re building a new site.

## Why do you need a framework?

To understand what Django actually is for, we need a closer look at the servers. First thing is that the server needs to know that you want it to serve you a webpage.

Imagine a mailbox (port) which is monitored for incoming letters (requests). It is done by a web server. The web server also sends the response with a webpage. But when you want to send something, you need to have some content. And Django is something that helps you create the content.

## What happen when someone request a website from your server?

When a request comes to a web server it's passed to Django which tries to figure out what actually is requested. It takes a webpage address used and tries to figure out what to do. This part is done by Django's urlresolver (Note that a website address is called URL - Uniform Resource Locator, so the name 'urlresolver' makes sense). It is not very smart here - it takes a list of patterns and tries to match the URL. Django checks patterns from top to the bottom and if something is matched then Django passes the request to the associated function called view.

Imagine a postman with a letter who is walking down the street and checks each house number with the one on the letter. If it matches, they put the letter there.

In the 'view' all interesting things are done: we can look at the database to look for some information to return it to the user. Maybe the user asked to change something in the data? Like a letter saying "Please change description of my job title." - the view can check if you are allowed to do that, then update the job title for you and send back a message: "Done!". Then the view generates a response and Django can send it to the user's web browser.

Of course, the description above is a little bit simplified, but you don't need to know all the technical things yet. Knowing a general idea is enough.

So instead of diving too much into details, we will simply start creating something with Django and we will learn all the important parts along the way!


