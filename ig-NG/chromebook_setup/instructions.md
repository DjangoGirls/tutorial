I nwere ike [ hapụ ebe a ](http://tutorial.djangogirls.org/en/installation/#install-python) ma ọ bụrụ na ị naghị eji Chromebook. Y’ọbụrụ na ị ji ya , nwụnye gị ga-abu obere ihe dị iche I nwere ike ileghara anya ndị fọdụrụ na ntuziaka nwụnye a.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE bu ngwaọrụ eji enyere gi aka ideputa koodu ma banye na kọmputa na aru oru na ntanetị ebe inwere ike i tinye, dee ihe ma ghazie ngwanro a. Maka oge n'ime nkuzi nkuzi a, cloud IDE ga-arụ ọrụ dị ka * Igwe mpaghara gị *. l ka ga-anọ na-agba n'ime otu ọnụ oru dika ụmụ klas ibe gị nọ na OS X, Ubuntu, ma ọ bụ Windows, mana a ga-ejikọ ọnụ oru gị na kọmputa na-agba ebe ozo cloud IDE wubere gi. Nke a bụ ntuziaka maka cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9). I nwere ike ịhọrọ otu n’ime cloud IDE, ma soro kwa ntuziaka cloud IDE.

#### PaizaCloud Cloud IDE

1. Gaa na [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Debanye aha maka akaụntụ
3. Pịa * Server ọhụụ * ma họrọ Django App
4. Pịa bọtịnụ Terminal (n'akụkụ aka ekpe nke ihi oru ahụ)

Ugbu a ị ga - ahụ na obuputara ihe n’akuku ihu oru a, bọtịnụ n'aka ekpe. Pịa bọtịnụ "Terminal" ka imepee ọnụ ọrụ na-eji otu a:

{% filename %}Terminal{% endfilename %}

    $
    

A na-akwadebe ọnụ ọrụ na PaizaCloud Cloud IDE maka ntuziaka gị. I nwere ike igbubi ma ọ bụ bulie elu ihu oru ahụ iji mee ka ọ bukwuo ibu.

#### AWS Cloud9

Ugbu a Cloud 9 chọrọ ka ị debanye aha na AWS wee debanye ihe ogwugwa kaadị akwụmụgwọ.

1. Tinye Cloud 9 si na[ ụlọ ahịa weebụ Chrome](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Gaa na [ c9.io ](https://c9.io) wee pịa * Bido na AWS Cloud9 *
3. Debanye aha maka akaụntụ AWS (o na eji ihe ogwugwa kaadị akwụmụgwọ, mana ị nwere ike were ya n'efu)
4. N'ime AWS, tinye * Cloud9 * na ihe ochicho wee pịa ya
5. N’ime Cloud 9, pịa * Mepụta gburugburu *
6. Kpọọ ya * django-girls *
7. Mgbe ị na-ahazi ntọala, họrọ * Mepụta atụ ọhụụ maka gburugburu (EC2) * maka "Udị gburugburu" yana * t2.micro * "Na ụdị atu" (ọ kwesịrị kwu "Ntọpụta-aka ruru eru maka ya."). Etu echekwara iru-ego di nma ma gi nwere ike idowe nrụrụ nke ọzọ.
8. Pịa * Nzọụkwụ ọzọ *
9. Pịa * Mepụta gburugburu *

Ugbu a ị ga - ahụ ihi oru nwere ihe na akuku, nnukwu windo nwere ụfọdụ ihe ederede, na ihi oru obere na ala nke dị ka nke a:

{% filename %}bash{% endfilename %}

    aha njirimara gị: ~ / ebe ọrụ $
    

Ebe ala a bụ ọdụ oru gị. I nwere ike iji ọdụ oru a zipu ntuziaka na kọmputa Cloud 9. I nwere ike ịgbanwe ihu oru ahụ iji mee ya t'ọ bụru tu ibu.

### Gburugburu Mebere

Gburugburu ebe a na-ewu ewu (nke a na-akpọkwa virtualenv) dị ka igbe nkeonwe anyị nwere ike nyefee koodu kọmputa bara uru maka ọrụ anyị na-arụ. Anyị na-eji ha debe koodu obere ndị iche iche anyị chọrọ iji rụ ọrụ anyị dị iche iche ka ihe agagha agwakọ n'etiti oru ngo.

Ghazie 

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).