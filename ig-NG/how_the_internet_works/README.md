# Otu Intanetị si arụ ọrụ

> Maka ndị na-agụ akwụkwọ n’ụlọ: a kọwara isiakwụkwọ na vidiyo- Otu Intanet si arụ ọrụ.
> 
> Isi okwu a kpalitere n'okwu "Otu Intanet si arụ ọrụ" nke Jessica McKellar (http://web.mit.edu/jesstess/www/).

Anyị na-ekwenye na ị na-eji Intaneti kwa ụbọchị. Mana ị maara n'ezie ihe na-eme mgbe ị pịnyere adreesị dị ka https://djangogirls.org n'ime ihe nchọgharị gị wee pịa `enter`?

Ihe mbụ ikwesiri ighọta bụ na webụsaiti nwere ọtụtụ faịlụ echekwara na diski ike - dika ihe nkiri, egwu, ma ọbu ihe onyonyo/foto gi Agbanyeghị, enwere otu ebe pụrụ iche maka webụsaịtị: ha gụnyere koodu kọmputa akpọrọ HTML.

Ọ bụrụ na ị maghị programin, o nwere ike isiri gị ike ịghọta HTML na mbụ, mana ihe nchọgharị weebụ gị (dịka Chrome, Safari, Firefox, wdg) dị ya mma. E mere ihe nchọgharị weebụ iji ghọta koodu a, soro ntuziaka ya, ma gosipụta faịlụ ndị a eji mee weebụsaịtị gị, otu ị chọrọ.

Dị ka faịlụ ọ bụla, anyị kwesịrị ịchekwa faịlụ HTML n'ebe dị iche na diski ike Maka Intanet, anyị na-eji kọmputa pụrụ iche, nke dị ike a na-akpọ server. Ha enweghị ihuenyo, mouse ma ọ bụ ahụigodo, n'ihi na isi nzube ha bụ ịchekwa data ma jeere ya ozi. Ọ bụ ya mere eji akpọ ha server - n'ihi na ha na - enye gị data.

Ọ dị mma, mana ịchọrọ ịma ka ịntanetị si dị?

We drew you a picture! It looks like this:

![Figure 1.1](images/internet_1.png)

Looks like a mess, right? In fact it is a network of connected machines (the above-mentioned *servers*). Hundreds of thousands of machines! Many, many kilometers of cables around the world! You can visit a Submarine Cable Map website (http://submarinecablemap.com) to see how complicated the net is. Here is a screenshot from the website:

![Figure 1.2](images/internet_3.png)

It is fascinating, isn't it? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

It looks like this:

![Figure 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Your letter goes to the post office closest to you. Then it goes to another that is a bit nearer to your addressee, then to another, and another until it is delivered at its destination. The only unique thing is that if you send many letters (*data packets*) to the same place, they could go through totally different post offices (*routers*). This depends on how they are distributed at each office.

![Figure 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Instead of addresses with a street name, city, zip code and country name, we use IP addresses. Your computer first asks the DNS (Domain Name System) to translate djangogirls.org into an IP address. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. You also use a language that the receiver understands, right? The same applies to the *data packets* you send to see a website. We use a protocol called HTTP (Hypertext Transfer Protocol).

So, basically, when you have a website, you need to have a *server* (machine) where it lives. When the *server* receives an incoming *request* (in a letter), it sends back your website (in another letter).

Since this is a Django tutorial, you might ask what Django does. When you send a response, you don't always want to send the same thing to everybody. It is so much better if your letters are personalized, especially for the person that has just written to you, right? Django helps you with creating these personalized, interesting letters. :)

Enough talk – time to create!