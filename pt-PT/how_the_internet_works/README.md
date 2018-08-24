# Como funciona a Internet

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. Tal como os teus filmes, música ou fotos. No entanto, há uma coisa que é única dos websites: incluem código chamado HTML.

Se não és familiar com programação pode ser difícil perceber HTML ao início, mas os teus browsers (como o Chrome, Safari, Firefox, etc) adoram-no. Browsers são desenhados para perceber este código, seguir as suas instruções, e apresentar estes ficheiros que constroem o teu site exactamente da forma que queres.

Como com qualquer outro ficheiro, precisamos de guardar ficheiros HTML num disco rígido. Para a Internet, usamos computadores especiais e poderosos chamados *servidores*. Estes não tem um monitor, rato nem teclado, porque o seu propósito principal é guardar e enviar dados. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

Fizemos-te um desenho! Parece isto:

![Figura 1.1](images/internet_1.png)

Parece uma confusão, certo? In fact it is a network of connected machines (the above-mentioned *servers*). Centenas de milhares de máquinas! Muitos, muitos quilómetros de cabos à volta do mundo! Podes visitar o website Mapa de Cabos Submarinos (http://submarinecablemap.com) para ver o quão complicada é a rede. Aqui está uma captura de écran do website:

![Figura 1.2](images/internet_3.png)

Fascinante, não é? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Parece-se com isto:

![Figura 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

A carta vai para os correios mais próximos de ti. Depois vai para outros que ficam um pouco mais perto do destinatário, depois outro e outro até que é entregue no destino. A única coisa diferente é que se enviares muitas cartas (*pacotes de dados*) para o mesmo destino, eles podem chegar lá através de estações de correios completamente diferentes (*routers*). Isto depende de como são distribuídos em cada estação de correios.

![Figura 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Em vez de moradas com nomes de ruas, código postal e nome do país, usamos endereços de IP. Primeiro, o teu computador pede ao DNS (do inglês *Domain Name System*, Sistema de Nomes de Domínios) que traduza djangogirls.org para um endereço de IP. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. Também usas uma linguagem que o destinatário percebe, certo? O mesmo se aplica a *pacotes de dados* que envias para ver um website. Usamos um protocolo chamado HTTP (*Hypertext Transfer Protocol*, Protocolo de Transferência de Hipertexto).

Quando tens um website, também precisas de ter um *servidor* (máquina) onde ele vive. Quando o *servidor* recebe um *pedido* (numa carta), ele responde com um website (noutra carta).

Since this is a Django tutorial, you might ask what Django does. Quando envias uam resposta, não queres sempre enviar a mesma coisa para toda a gente. É muito melhor se as tuas cartas forem personalizadas à pessoa que acabou de te escrever, certo? Django ajuda-te a criar estas cartas personalizadas e interessantes. :)

Enough talk – time to create!