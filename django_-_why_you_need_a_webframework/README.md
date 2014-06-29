# Django - why you need a webframework?

To understand what Django actually is for, we need a closer look at the servers. First thing is that the server needs to know, that you want it to serve you a webpage.

Imagine a mailbox (port) which is monitored for incoming letters (requests). It is done by a web server. The web server also sends the response with webpage. But when you want something to send, you need to have some content. And Django is something that helps you create the content.

## What Django does with a request?

When request comes to a web server it passes it to Django. Django tries to figure out what actually is requested. It takes a webpage address used and tries to figure out what to. This part is done by Django's urlresolver (Note that a website address is called URL - Uniform Resource Locator, so the name 'urlresolver' makes sense). It is not very smart here - it takes a list of patterns and tries to match the URL. Django checks patterns from top to the bottom and if something is matched then Django passes the request to the associated function called view.

Imagine a postman with a letter who is walking down the street and checks each house number with the one on the letter. If it matches, they put the letter there.

In 'view' all interesting things are done: we can look at the database to look for some information to return it to user. Maybe user asked to change something in the data? Like a letter saying "Please change description of my job title." - view can check if you are allowed to do that, then update the job title for you and send back a message: "Done!". Then view is generating a response and Django can send it back to web server.

Of course, the description above is a little bit simplified, but you don't need to know all the technical things yet. Knowing a general idea is enough.

So instead of diving too much into details, we will simply start creating something with Django and we will learn all important parts on the way!


