# Django কি?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. ওয়েব ফ্রেমওয়ার্ক হল উপকরনের সমষ্টি যা অাপনাকে দ্রুত ও সহজে ওয়েবসাইট বানাতে সাহায্য করে।.

ওয়েবসাইট বানাতে হলে অামাদের সবসময়ই একই টাইপের উপকরন প্রয়োজন হয় । যেমন সাইন অাপ, সাইন ইন, ওয়েব সাইটের জন্য ম্যানেজমেন্ট প্যানেল, ফর্ম, ফাইল অাপলোডের জন্য ব্যাবস্থা করা ইত্যাদি।

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## ফ্রেমওয়ার্ক কেন প্রয়োজন?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

মনে কর একটা মেইলবক্স (পোর্ট) যেটার উপর প্রেরিত চিঠির(রিকুয়েস্ট) জন্য মনিটর করা হয়। এই সার্ভার একই কাজ করে। The web server reads the letter and then sends a response with a webpage. কিন্তু তুমি কিছু পাঠাতে চাইলে তোমার নকটেন্ট লাগবে। অার জ্যাঙ্গো হল সেটা যা তোমাকে কনটেন্ট তৈরিতে সাহাযা করবে।

## কেউ তোমার সার্ভার থেকে রিকুয়েস্ট পাঠালে কি ঘটবে?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

চিঠিসহ একজন পত্রবাহককে কল্পনা কর। সে রাস্তা দিয়ে হাটছে অার চিঠির নাম্বারের সাথে বাড়ীর নাম্বার মিলিয়ে দেখছে। যদি এটা মিলে যায় তবে সে চিঠি রেখে অাসছে। একই ভাবে ইউঅার এল সার্ভার কাজ করে।

In the *view* function, all the interesting things are done: we can look at a database to look for some information. অাবার ইউজার ডাটাতে কোন পরিবর্তনের জন্য অনুরোধ করতে পারে। Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!