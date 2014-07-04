# Domain

Heroku gave you a domain, but it's long, hard to remember, and ugly. It'd be awesome to have a domain name that is short and easy to remember, right?

In this chapter we will teach you how to buy a domain and direct it to Heroku!

## Where to register a domain?

A typical domain costs around $15 a year. There are cheaper and more expensive options, depending on the provider. There are a lot of companies that you can buy a domain from: a simple [google search](https://www.google.pl/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=register%20domain) give hundreds of options.

Our favourite one is [I want my name](https://iwantmyname.com/). They advertise as "painless domain management" and it really is painless. We asked them if they wanted to support Django Girls and they gave us a 20% discount code for you! :) Ask organizers or coaches for it!

## How to register domain in IWantMyName?

Go to [iwantmyname](http://iwantmyname.com) and type a domain you want to have in the search box.

![](images/1.png)

You should now see a list of all available domains with the term you put in the search box. As you can see, a smiley face indicate that the domain is available for you to buy, and a sad face that it is already taken.

![](images/2.png)

We've decided to buy `djangogirls.in`:

![](images/3.png)

Go to checkout. You should now sign up for iwantmyname if you don't have your account yet. After that, provide your discount code, credit card info and buy a domain!

After that, click into `Domains` in menu and choose your newly purchased domain. Then locate and click on `manage DNS records` link:

![](images/4.png)

Now you need to locate this form:

![](images/5.png)

And fill it like this:
- Hostname: www
- Type: CNAME
- Value: your domain from Heroku (for example djangogirls.herokuapp.com)
- TTL: 3600

![](images/6.png)

Click Add button and Save changes at the bottom.

It can take up to couple of hours for your domain to start working.

## Configure domain in Heroku

You also need to tell Heroku that you want to use your custom domain.

Go to [Heroku Dashboard](https://dashboard.heroku.com/apps), login with your Heroku account and choose your app. Then go into app Settings and add your domain in `Domains` section and save changes.

That's it!
