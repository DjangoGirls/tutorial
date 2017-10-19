# Como funciona a internet

> Este capítulo é inspirado na palestra "Como a Internet funciona" de Jessica McKellar (http://web.mit.edu/jesstess/www/).

Apostamos que você usa a Internet todos os dias. Mas você sabe realmente o que acontece quando você digita um endereço como https://djangogirls.org em seu navegador e pressiona `Enter`?

A primeira coisa que você precisa entender é que um site é só um monte de arquivos salvos em um disco rígido. Assim como acontece com os filmes, músicas ou fotos que você tem no computador. No entanto, existe uma parte que é exclusiva para sites: essa parte inclui código de computador chamado HTML.

Se você não estiver familiarizada com programação, pode ser difícil compreender o HTML no começo, mas seu navegador web (como o Chrome, Safari, Firefox, etc) ama ele. Navegadores web são projetados para entender esse código, seguir suas instruções e apresentar todos esses arquivos de que seu site é feito, exatamente do jeito que você quer que eles sejam apresentados.

Então, igual a todos os outros arquivos, os arquivos HTML precisam ser armazenados em um disco rígido. Para a internet, nós usamos especiais e poderosos computadores chamados de *servidores*. Eles não têm tela, mouse ou teclado, porque sua finalidade principal é armazenar dados e servi-los. É por isso que eles são chamados de *servidores*..--porque eles *servem*, a você, dados.

OK, mas você quer saber com o quê a internet se parece, certo?

Fizemos um desenho pra você! Veja:

![Figura 1.1](images/internet_1.png)

Parece uma bagunça, não é? Na verdade é uma rede de máquinas conectadas (os *servidores* mencionados acima). Centenas de milhares de máquinas! Muitos, muitos quilômetros de cabos por todo o mundo! Para ver o quão complicada a internet é, você pode visitar um site (http://submarinecablemap.com/) que mostra um mapa com os cabos submarinos. Aqui está uma captura de tela do site:

![Figura 1.2](images/internet_3.png)

Fascinante, não? Mas, obviamente, não é possível ter um cabo que ligue todas as máquinas conectas na internet. Logo, para chegar em uma máquina (por exemplo aquela onde https://djangogirls.org está salva), nós precisamos passar uma requisição através de muitas e muitas máquinas diferentes.

O que parece com isso:

![Figura 1.3](images/internet_2.png)

Imagine que, quando você digita https://djangogirls.org, você envia uma carta que diz: "Queridas djangoGirls.org, eu desejo ver o site da Django Girls. Envie pra mim, por favor!"

Sua carta vai para a agência dos correios mais próxima de você. Depois vai para outra que é um pouco mais perto de seu destinatário, depois para outra e outra, até que ela seja entregue ao seu destino. A única diferença é que, se você enviar muitas cartas (*pacotes de dados*) para o mesmo lugar, cada carta pode passar por diferentes agências de correios (*roteadores*). Isso depende de como elas são distribuídas em cada agência.

![Figura 1.4](images/internet_4.png)

Sim, é simples assim. Você envia mensagens e espera alguma resposta. Claro, ao invés de papel e caneta você usa bytes de dados, mas a ideia é a mesma!

Em vez de endereços com o nome da rua, cidade, código postal e nome do país, nós usamos endereços IP. Primeiro, seu computador pede ao DNS (Domain Name System - Sistema de Nome de Domínio) para traduzir djangogirls.org para um endereço IP. O funcionamento dele se parece um pouco com as antigas listas telefônicas onde você pode olhar para o nome da pessoa que quer entrar em contato e achar o seu número de telefone e endereço.

Quando você envia uma carta, ela precisa ter certas características para ser entregue corretamente: um endereço, selo, etc. Você também usa uma linguagem que o receptador compreende, certo? O mesmo acontece com os *pacotes de dados* que você envia para ver um site: você usa um protocolo chamado HTTP (Hypertext Transfer Protocol - Protocolo de Transferência de Hipertexto).

Então, basicamente, quando você tem um site, você precisa ter um *servidor* (máquina) onde ele fica hospedado. O *servidor* está à espera de quaisquer *requisições* recebidas (cartas que solicitam ao servidor o envio do seu site) e ele envia de volta seu site (em outra carta).

Como este é um tutorial de Django, você vai perguntar o que o Django faz. Quando você envia uma resposta, nem sempre você quer enviar a mesma coisa para todo mundo. Será muito melhor se suas cartas forem personalizadas, especialmente para a pessoa que acabou de escrever para você, certo? O Django ajuda você a criar essas personalizadas e interessantes cartas. :)

Chega de falar, é hora de criar!
