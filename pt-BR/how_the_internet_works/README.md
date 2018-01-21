# Como funciona a Internet

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

A primeira coisa que você precisa entender é que um site é só um monte de arquivos salvos em um disco rígido. Igual à seus filmes, músicas, ou imagens. No entanto, há uma parte que é exclusiva para sites: essa parte inclui códigos de computador chamado HTML.

Se você não estiver familiarizada com a programação, pode ser difícil compreender o HTML no começo, mas seus navegadores da web (como o Chrome, Safari, Firefox, etc) amam ele. Os navegadores da Web são projetados para entender esse código, siga suas instruções e apresenta esses arquivos que seu site é feito, exatamente do jeito que você quer.

Igual à todos os arquivos, os arquivos HTML precisam ser armazenados num disco rígido. Pra internet nós usamos poderosos computadores especiais chamados *servidores*. Eles não têm uma tela, o mouse ou o teclado, porque sua finalidade principal é para armazenar dados e servi-los. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

Fizemos um desenho pra você! Veja:

![Figura 1.1](images/internet_1.png)

Que bagunça né? In fact it is a network of connected machines (the above-mentioned *servers*). Centenas de milhares de máquinas! Muitos, muitos quilômetros de cabos em todo o mundo! Para ver quão complicada a internet é você pode visitar um site (http://submarinecablemap.com/) que mostra o mapa com os cabos submarinos. Aqui está um screenshot do site:

![Figura 1.2](images/internet_3.png)

Fascinante, não? Mas, obviamente, não é possível ter um fio conectado a toda máquina ligada na internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Se parece com isso:

![Figura 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Sua carta vai para a agência dos correios mais próxima de você. Então ele vai para outro que é um pouco mais perto de seu destinatário e, em seguida, a outra e outra até que é entregue ao seu destino. A única coisa é que se você enviar muitas cartas (*pacotes de dados*) para o mesmo lugar, eles poderiam passar por correios totalmente diferentes (*roteadores*). Isso depende de como eles são distribuídos em cada escritório.

![Figura 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Of course, instead of paper and pen you use bytes of data, but the idea is the same!

Ao invés de endereços com o nome da rua, cidade, código postal e nome do país, nós usamos endereços IP. Primeiro seu computador pergunta pelo DNS (Domain Name System - Sistema de Nome de Domínio) para traduzir djangogirls.org para um endereço IP. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. Você também usa uma linguagem que o receptador compreende, certo? O mesmo se aplica para os *pacotes de dados* que você enviar para ver um site. Nós usamos um protocolo chamado HTTP (Hypertext Transfer Protocol).

Então, basicamente, quando você tem um site, você precisa ter um *servidor* (máquina) onde ele vive. Quando o *servidor* recebe uma *solicitação* de entrada (numa carta), ele envia seu website (em outra carta).

Since this is a Django tutorial, you might ask what Django does. Quando envia uma resposta nem sempre você quer enviar a mesma coisa para todo mundo. É muito melhor se suas cartas são personalizadas, especialmente para a pessoa que acabou de escrever para você, certo? O Django ajuda você a criar essas personalizadas e interessantes cartas. :)

Enough talk – time to create!