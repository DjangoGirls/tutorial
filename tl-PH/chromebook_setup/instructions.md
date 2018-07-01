Pwede kang [lumaktaw sa seksiyon na ito](http://tutorial.djangogirls.org/en/installation/#install-python) kung hindi ka gumamit ng Chromebook. Kung ikaw ay, ang iyong karanasan sa pag-install ay medyo kakaiba. Pede mo nang isawalang bahala ang iba mga tagubilin sa pag-install.

### Cloud 9

Cloud 9 is a tool that gives you a code editor and access to a computer running on the Internet where you can install, write, and run the software. Sa durasyon ng tutorial, ang Cloud 9 ay magsilbi mong *local machine*. Magpapatakbo ka pa rin ng mga direksyon sa interface ng terminal gaya ng mga kamag-aral na gumagamit ng OS X, Ubuntu, or Windows, pero ang terminal mo nakaugnay sa isang kompyuter na pinatakabo sa ibang lugar na hinanda ni Cloud 9 para sa ito.

1. I-install ang Cloud 9 mula sa [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Pumunta sa [c9.io](https://c9.io)
3. Magsign-up ng account
4. I-click ang *Maglikha ng Bagong Workspace*
5. Pangalanan mo ito nang *django-girls*
6. Piliin ang *Blanko* (pangalawa mula sa kanan, sa ibabang hanay na may dalandan na logo)

Ngayon, makikita mo na dapat ang interface na may sidebar, isang malaking pangunahing window na maroong mga teksto, at isang maliit na window sa baba gaya nito:

{% filename %}Cloud 9{% endfilename %}

    iyongusername:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

### Virtual na Environment

Ang virtual na kaligirian (tinatawag din na virtualenv) ay parang isang pribadong kahon kung saan pede mong ilagay ang mga code ng computer na ginawa mo para sa isang proyekto. Ginagamit namin ito para lalagyan ng mga piraso ng aming code na ginamit naming sa iba-ibang proyekto para ihiwalay nang hindi mahalo sa pagitan ng mga proyekto.

Sa iyong terminal sa baba ng interface ng Cloud 9, patakbuhin mo ang sumunod:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

If hindi pa rin gumagana, humingi ka ng tulong sa iyong coach.

Sa sunod, patakbuhin ang:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~=1.11.0
    

(paalala na sa huling linya, kami ay gumagamit ng tilde na sinundan ng equal na sign: ~=).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

Kalakip sa Tutorial ng Django Girls ay isang seksyon na tinatawag na Deployment, ito ay isang proseso kung saan gagamiting ang iyong code para paganahin ang iyong bagong web application at paglipat nito sa isang kompyuter na pwedeng ma-access (tinatawag na server) para makita ng ibang tao ang iyong ginagawa.

Ang parte na ito ay medyo kakaiba kung gumamit ka ng Chromebook sa tutorial na ito dahil tayo ay gumagamit na ng kompyuter na nakakonekta sa Internet (kumpara sa tinatawag nating, laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Kaya naman, magsign-up para sa bagong account sa Python Anywhere sa [www.pythonanywhere.com](https://www.pythonanywhere.com).