# Como a Internet funciona

> Para leitoras em casa: este capítulo é abordado no vídeo [Como a Internet funciona](https://www.youtube.com/watch?v=oM9yAA09wdc).
> 
> Este capítulo é inspirado na palestra "Como a Internet funciona" de Jessica McKellar (http://web.mit.edu/jesstess/www/).

Apostamos que você usa a Internet todos os dias. Mas você sabe realmente o que acontece quando digita um endereço como https://djangogirls.org em seu navegador e aperta `Enter`?

A primeira coisa que você precisa entender é que um site é só um monte de arquivos salvos em um disco rígido. Igual a seus filmes, músicas, ou imagens. No entanto, há uma parte que é exclusiva para sites: ela inclui códigos de computador chamado HTML.

Se você não estiver familiarizada com programação, pode ser difícil compreender o HTML no começo, mas seus navegadores da web (como o Chrome, Safari, Firefox, etc) amam ele. Os navegadores da Web são projetados para entender esse código, seguir suas instruções e apresentar esses arquivos de que seu site é feito, exatamente como você quer.

Igual a todos os arquivos, os arquivos HTML precisam ser armazenados num disco rígido. Para a internet, usamos poderosos computadores especiais chamados *servidores*. Eles não têm uma tela, um mouse ou um teclado, porque sua finalidade principal é armazenar dados e servi-los. É por isso que eles são chamados de *servidores* -- eles *servem* dados a você.

OK, mas você quer saber com o quê a internet se parece, certo?

Fizemos um desenho para ajudar! Veja:

![Figura 1.1](images/internet_1.png)

Que bagunça, né? Na verdade é uma rede de máquinas conectadas (os *servidores* mencionados acima). Centenas de milhares de máquinas! Muitos, muitos quilômetros de cabos em todo o mundo! Para ver quão complicada a internet é você pode visitar um site (http://submarinecablemap.com/) que mostra o mapa com os cabos submarinos. Aqui está um screenshot do site:

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