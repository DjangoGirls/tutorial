# Como a Internet funciona

> Para leitoras em casa: este capítulo é abordado no vídeo [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc).
> 
> Este capítulo é inspirado na palestra "Como a Internet funciona" de Jessica McKellar (http://web.mit.edu/jesstess/www/).

Apostamos que você usa a Internet todos os dias. Mas você sabe realmente o que acontece quando digita um endereço como https://djangogirls.org em seu navegador e aperta `Enter`?

A primeira coisa que você precisa entender é que um site é só um monte de arquivos salvos em um disco rígido. No entanto, há uma parte que é exclusiva para sites: ela inclui códigos de computador chamados HTML.

Se você não estiver familiarizada com a programação, pode ser difícil compreender o HTML no começo, mas seus navegadores da web (como o Chrome, Safari, Firefox, etc) amam ele. Os navegadores da Web são projetados para entender esse código, seguir suas instruções e apresentar os arquivos de que um site é feito, exatamente como deve.

Como qualquer arquivo, os arquivos HTML precisam ser armazenados num disco rígido. Para a internet, usamos poderosos computadores especiais chamados *servidores*. Eles não têm uma tela, um mouse ou um teclado, porque sua finalidade principal é armazenar dados e servi-los. É por isso que eles são chamados de *servidores* - eles *servem* dados a você.

OK, mas você quer saber com o quê a internet se parece, certo?

Fizemos um desenho para ajudar! Veja:

![Figura 1.1](images/internet_1.png)

Que bagunça, né? Na verdade, a internet é uma rede de máquinas conectadas (os *servidores* mencionados acima). São centenas de milhares de máquinas! Muitos, muitos quilômetros de cabos em todo o mundo! Para ver o quão complicada a internet é, você pode visitar um site (http://submarinecablemap.com/) que mostra o mapa com dos cabos submarinos. Aqui está um screenshot do site:

![Figura 1.2](images/internet_3.png)

Fascinante, né? Mas não é possível ter um fio ligando todas as máquinas que estão conectadas à internet. Logo, para alcançar uma máquina (por exemplo aquela onde https://djangogirls.org está salva), precisamos passar uma requisição por muitas máquinas diferentes.

É algo assim:

![Figura 1.3](images/internet_2.png)

Imagine que quando digita http://djangogirls.org, você envia uma carta que diz: "Queridas Django Girls, eu desejo ver o site djangogirls.org. Enviem-no para mim, por favor!"

Sua carta vai para a agência dos correios mais próxima de você. Então, ela vai para outra agência um pouco mais perto do destinatário e, em seguida, para outra e outra até ser entregue. A única coisa diferente é que se você enviar muitas cartas (*pacotes de dados*) para o mesmo lugar, elas podem passar por agências totalmente diferentes (*roteadores*). Isso depende de como elas são distribuídas em cada agência.

![Figura 1.4](images/internet_4.png)

Funciona assim - você envia mensagens e espera alguma resposta. Ao invés de papel e caneta, você usa bytes de dados, mas a ideia é a mesma!

Ao invés de endereços com o nome da rua, cidade, código postal e nome do país, na internet usamos endereços de IP. Primeiro seu computador pergunta pelo DNS (Domain Name System - Sistema de Nome de Domínio) para traduzir djangogirls.org para um endereço de IP. Isso funciona mais ou menos como as antigas listas telefônicas em que você podia procurar o número e endereço da pessoa que queria contactar.

Quando você envia uma carta, ela precisa ter certas características para ser entregue corretamente: um endereço, um selo, etc. E você usa uma linguagem que o destinatário compreende, certo? O mesmo se aplica aos *pacotes de dados* que você envia para acessar um site. Nós usamos um protocolo chamado HTTP (Hypertext Transfer Protocol).

Então, de forma simplificada, um site precisa ter um *servidor* (máquina) onde ele vive. Quando o *servidor* recebe uma *solicitação* de entrada (numa carta), ele envia em respota seu website (em outra carta).

Este é um tutorial de Django, então você deve estar imaginando o que o Django faz. Quando envia uma resposta, nem sempre você quer mandar a mesma coisa para todo mundo. É muito melhor que as cartas sejam personalizadas, especialmente para a pessoa que acabou de nos escrever, né? O Django nos ajuda a criar essas cartas personalizadas. :)

Chega de falar, é hora de criar!