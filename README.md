# Introduction

Have you ever felt that world is more and more about technology and you are somehow left behind? Have you ever wondered how to create a website but have never had enough motivation to start? Have you ever thought that software world is too complicated for you to even try doing something on your own?

Well, we have good news for you! Programming is not as hard as it seems and we want to show you how fun it could be.

The tutorial will not magically turn you into programmer. If you want to be good at it, you need months or even years of learning and practice. But we want to show you that programming or creating website is not as complicated as it seems. We will try to explain different bits and pieces as good as we can, so you will not feel intimidated by technology.

We hope that we'll be able to make you love technology as much as we do!


## What will you learn during the tutorial?

When you'll finish the tutorial, you will have a simple, working web application: your own blog. We will show you how to put it online, so others will see your work!

Ok, let's begin with the very basic thing...


# How the Internet works?

*This chapter is inspired by a talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).*

We bet you use the Internet every day. But do you actually know what happens when you type an address like http://djangogirls.org in your browser and click 'Enter'?

The Internet looks like this:

![Figure 1.1](internet_1.png)

Looks like a mess, right? But in fact it is a net of connected machines. Hundreds of thousands of machines. Many, many kilometers of cables around the world! You should check out Submarine Cable Map (http://submarinecablemap.com/) to see how complicated the net is. Here is a screenshot from the website:

![Figure 1.2](internet_3.png)

It is fascinating, isn't it? But obviously, it is not possible to have a wire between every machine connected to the Internet. So to reach a machine (for example the one where djangogirls.org is) we need to pass a request through many different machines.

It looks like this:

![Figure 1.3](internet_2.png)

Imagine that when you type djangogirls.org you send a letter that says: "Dear DjangoGirls, I want to see djangogirls.org website. Send it to me, please!"

Your letter goes to the post office. Then it goes to another that is nearer your addressee, then to another and another till it is delivered to the destination. The only difference is that if you send letters (data packets) frequently to the same place, each letter could go through totally different post offices (routers), depending how they are distributed in each office.

![Figure 1.4](internet_4.png)

Yes, it is as simple as that. You send messages and you expect some response. Of course, instead of paper and pen you use bytes of data, but the idea is the same!

Instead of address with streetname, city, zipcode and country, we use IP addresses. Your computer asks DNS (Domain Name Server) first to translate djangogirls.org into IP address. It works a little bit like old-fashioned phonebooks where you could look for the name of the person and find their phonenumber.

When you send a letter it needs to have certain features to be delievered correctly: address, postmark etc.. You also use language that the receiver understand, right? The same is with data packets you send in order to see a website: you use protocol called HTTP (HyperText TransferProtocol).

So basically, when you have a website you need to have a server (machine) on which it is. Server is waiting for any incomming requests (letters that ask you to send your website) and it sends back your website (in another letter).

Since it is a Django tutorial, you will ask what Django does? When you send a response you don't always want to send the same thing to everybody. It is so much better if your letter is personalized especially for the person that has just wrote to you. Django helps you with creating this personalized, interesting letters :).

Enough talking, time to create!


# Let’s start with Python

http://try-python.appspot.com/

3. Django - why you even need a web framework?

What is Django? Why it’s useful? What does it do?

4. Start virtualenv, create django project - see files

5. Models, views, urls - how it works together

Explains workflow in Django - from receiving request to rendering template.

6. Setting everything up to see “It works!”.

Db, urls, admin, etc.

7. Models - how to model things in Django

M2M, One2Many, different fields, relations between objects. Syncdb.

8. Admin - let’s play with our models!

Add admin, register models. Play around with add/edit/delete in admin.

9. Urls

Explain that is hard. Show some popular regex (without explaining regex - only mentioning that it’s complicated): integers, slugs. Show that you can have many of those. Add names to urls.

10. View - time to create!

How to write simple functional view. It always needs to return HttpResponse (mention HttpResponse, render). Writing super easy template - without HTML. Just displaying values with django template language ({{ }})

11. Templates - make the structure with HTML

Starting from basics of HTML (if they will do a tutorial it will save us time to explain the concept). Some useful templatetags: for, if, filters.

12. Querysets
Introduce filter, exclude, underscore notation to access related objects.

13. Forms

How to create a form? Ways to display form. Exposing only some fields.

14. CSS - make it pretty

Download Bootstrap or something else which we can use easily. Talk about static files.

15. Customize a blog

Time for attendees to play a little bit on their own with a code. Try to add something, change something, etc..

16. Deploy!

Heroku

17. How I can get a nice domain name for my blog?

