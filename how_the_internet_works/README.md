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
