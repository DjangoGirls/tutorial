यदि आप Chromebook का उपयोग नहीं कर रहे हैं तो आप [ इस अनुभाग को छोड़ सकते हैं।](http://tutorial.djangogirls.org/en/installation/#install-python) अगर आप उपयोग करते हैं, आपका इंस्टॉलेशन अनुभव थोड़ा अलग होगा। आप बाकी इंस्टालेशन निर्देश को अनदेखा कर सकते हैं।

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE एक ऐसा उपकरण है जो आपको कोड एडिटर और इंटरनेट से कंप्यूटर चलाने देता है, जहाँ आप सॉफ़्टवेयर इंस्टॉल, लिख और चला सकते हैं। ट्यूटोरियल के दौरान, cloud IDE आपके लिए *स्थानीय मशीन* की तरह कार्य करेगा। आप अभी भी अपने सहपाठियों की तरह OS X, Ubuntu, या Windows पर टर्मिनल इंटरफ़ेस में कमांड चला पा रहे होंगे, लेकिन आपका टर्मिनल कहीं और चलने वाले कंप्यूटर से कनेक्ट होगा जो cloud IDE आपके लिए सेट अप करता है। cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9) के लिए निर्देश यहाँ दिए गए हैं। आप cloud IDEs में से एक चुन सकते हैं, और cloud IDE के निर्देशों का पालन कर सकते हैं।

#### PaizaCloud Cloud IDE

1. [PaizaCloud Cloud IDE](https://paiza.cloud/) पर जाएँ
2. खाता के लिए साइन अप करें
3. *नया सर्वर* क्लिक करें
4. टर्मिनल बटन पर क्लिक करें (विंडो के बाईं तरफ)

अब आपको बाईं ओर बटन, एक साइडबार के साथ एक इंटरफ़ेस देखना चाहिए। इस तरह के प्रॉम्प्ट से टर्मिनल विंडो खोलने के लिए "Terminal" बटन पर क्लिक करें:

{% filename %}Terminal{% endfilename %}

    $
    

PaizaCloud Cloud IDE का टर्मिनल आपके निर्देशों के लिए तैयार हो जाता है। आप इसे थोड़ा बड़ा बनाने के लिए विंडो को resize या maximize कर सकते हैं।

#### AWS Cloud9

1. [AWS Cloud9](https://aws.amazon.com/cloud9/) पर जाएँ
2. खाता के लिए साइन अप करें
3. *Create Environment* क्लिक करें

अब आपको साइडबार के साथ एक इंटरफेस देखना चाहिए, कुछ टेक्स्ट के साथ एक बड़ी मुख्य विंडो, और नीचे छोटी विंडो जो इस तरह दिखती है

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

### Virtual Environment

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

In your terminal at the bottom of the Cloud 9 interface, run the following:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

If this still doesn't work, ask your coach for some help.

Next, run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: ~=).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).