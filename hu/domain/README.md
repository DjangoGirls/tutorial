# Domain

Heroku gave you a domain, but it's long, hard to remember, and ugly. It'd be awesome to have a domain name that is short and easy to remember, right?

In this chapter we will teach you how to buy a domain and direct it to Heroku!

## Hol tudsz domaint regisztrálni?

A typical domain costs around $15 a year. There are cheaper and more expensive options, depending on the provider. There are a lot of companies that you can buy a domain from: a simple [google search][1] will give hundreds of options.

 [1]: https://www.google.com/search?q=register%20domain

Our favourite one is [I want my name][2]. They advertise as "painless domain management" and it really is painless.

 [2]: https://iwantmyname.com/

## How to register domain in IWantMyName?

Go to [iwantmyname][3] and type a domain you want to have in the search box.

 [3]: https://iwantmyname.com

![][4]

 [4]: images/1.png

You should now see a list of all available domains with the term you put in the search box. As you can see, a smiley face indicates that the domain is available for you to buy, and a sad face that it is already taken.

![][5]

 [5]: images/2.png

We've decided to buy `djangogirls.in`:

![][6]

 [6]: images/3.png

Go to checkout. You should now sign up for iwantmyname if you don't have an account yet. After that, provide your credit card info and buy a domain!

After that, click `Domains` in the menu and choose your newly purchased domain. Then locate and click on the `manage DNS records` link:

![][7]

 [7]: images/4.png

Now you need to locate this form:

![][8]

 [8]: images/5.png

And fill it in with the following details: - Hostname: www - Type: CNAME - Value: your domain from Heroku (for example djangogirls.herokuapp.com) - TTL: 3600

![][9]

 [9]: images/6.png

Click the Add button and Save changes at the bottom.

It can take up to a couple of hours for your domain to start working, so be patient!

## A domain beállítása Herokun

You also need to tell Heroku that you want to use your custom domain.

Go to the [Heroku Dashboard][10], login to your Heroku account and choose your app. Then go into app Settings and add your domain in the `Domains` section and save your changes.

 [10]: https://dashboard.heroku.com/apps

That's it!