# Πως λειτουργεί το internet

> Για τους αναγνώστες στο σπίτι: αυτή η ενότητα καλύπτεται στο βίντεο [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc).
> 
> Αυτό το κεφάλαιο είναι εμπνευσμένο από την ομιλία της Jessica McKellar με τίτλο "How the Internet works" (http://web.mit.edu/jesstess/www/).

Στοιχηματίζουμε ότι δουλεύετε το Internet κάθε μέρα. Αλλά ξέρετε τι συμβαίνει όταν πληκτρολογείτε μια διεύθυνση όπως https://djangogirls.org στο browser σας και μετά πατήσετε `enter`;

Το πρώτο πράγμα που πρέπει να καταλάβετε είναι ότι ένα website αποτελείτε από ένα σωρό από φακέλους αποθηκευμένους σε έναν σκληρό δίσκο. Όπως ακριβώς οι ταινίες, η μουσική και οι φωτογραφίες σας. Ωστόσο, υπάρχει ένα κομμάτι που είναι μοναδικό για τα websites: περιλαμβάνουν κώδικα υπολογιστή με το όνομα HTML.

Αν δεν είστε εξοικειωμένοι με προγραμματισμό θα σας φανεί λίγο δύσκολη η HTML στην αρχή. Αλλά οι web browsers (όπως Chrome, Safari, Firefox, κλπ) την αγαπούν. Οι web browsers σχεδιάστηκαν για να κατανοούν αυτό τον κώδικα, να ακολουθούν τις εντολές του και να παρουσιάζουν αυτά τα αρχεία από τα οποία είναι φτιαγμένα το website σας με τον τρόπο που εσείς θέλετε.

Όπως με κάθε αρχείο, χρειαζόμαστε να αποθηκεύουμε τα HTML αρχεία κάπου στον σκληρό δίσκο. Για το Internet, χρησιμοποιούμε ειδικούς υπολογιστές γι'αυτό, με το όνομα *servers*. Δεν έχουν οθόνη, ποντίκι ή πληκτρολόγιο επειδή ο μοναδικός σκοπός τους είναι να αποθηκεύουν δεδομένα και να τα εξυπηρετούν. Γι' αυτό το λόγο ονομάζονται *εξυπηρετητές*. Επειδή *εξυπηρετούν την μεταφορά* δεδομένων.

OK, but you want to know how the Internet looks, right?

We drew you a picture! It looks like this:

![Σχήμα 1.1](images/internet_1.png)

Looks like a mess, right? In fact it is a network of connected machines (the above-mentioned *servers*). Hundreds of thousands of machines! Many, many kilometers of cables around the world! You can visit a Submarine Cable Map website (http://submarinecablemap.com) to see how complicated the net is. Here is a screenshot from the website:

![Σχήμα 1.2](images/internet_3.png)

It is fascinating, isn't it? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

It looks like this:

![Σχήμα 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Your letter goes to the post office closest to you. Then it goes to another that is a bit nearer to your addressee, then to another, and another until it is delivered at its destination. The only unique thing is that if you send many letters (*data packets*) to the same place, they could go through totally different post offices (*routers*). This depends on how they are distributed at each office.

![Σχήμα 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Instead of addresses with a street name, city, zip code and country name, we use IP addresses. Your computer first asks the DNS (Domain Name System) to translate djangogirls.org into an IP address. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. You also use a language that the receiver understands, right? The same applies to the *data packets* you send to see a website. We use a protocol called HTTP (Hypertext Transfer Protocol).

So, basically, when you have a website, you need to have a *server* (machine) where it lives. When the *server* receives an incoming *request* (in a letter), it sends back your website (in another letter).

Since this is a Django tutorial, you might ask what Django does. When you send a response, you don't always want to send the same thing to everybody. It is so much better if your letters are personalized, especially for the person that has just written to you, right? Django helps you with creating these personalized, interesting letters. :)

Enough talk – time to create!