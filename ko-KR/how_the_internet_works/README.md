# 인터넷은 어떻게 작동할까요

> 집에서 공부하시는 분은: 이번 챕터에서 [인터넷은 어떻게 작동할까요](https://www.youtube.com/watch?v=oM9yAA09wdc) 영상을 참고하세요.
> 
> 이 챕터는 Jessica McKellar의 "인터넷은 어떻게 작동할까요"(http://web.mit.edu/jesstess/www/)에 영감을 받아 작성되었습니다.

당신은 매일 인터넷을 사용하실거에요. 하지만 당신이 브라우저 주소창에 https://djangogirls.org 를 입력하고 `enter` 키를 누르면 어떤 일이 일어나는지 확실히 알고 있나요?

먼저 웹사이트는 여러분의 영화, 음악 또는 사진과 같이 하드디스크에 저장된 파일로 이루어져 있다는 점을 이해할 필요가 있습니다. 하지만 다른 한가지는, 웹사이트는 HTML라 불리는 컴퓨터 코드가 포함되어 있다는 것이에요.

만약 프로그래밍에 익숙하지 않다면, HTML을 이해하는 게 어려울 수도 있어요. 하지만 브라우저들(크롬, 사파리, 파이어폭스 같은 것들요)은 HTML을 사랑한답니다. 웹 브라우저는 코드를 이해하고 지시에 따르고, 내가 원하는 방식으로 정확하게 구현될 수 있도록 설계되었어요.

다른 파일처럼 HTML 파일도 하드 디스크 어딘가에 저장해야합니다. 인터넷에선 *서버*라는 특별하고 강력한 컴퓨터를 사용해요. 데이터를 저장하고 제공하는 것이 주된 목적이기 때문에 모니터나 마우스, 키보드가 필요없지요. 데이터를 *제공(serve)* 하기때문에 – *서버(servers)* 라고 부릅니다.

좋아요, 하지만 인터넷이 어떻게 생겼는지도 알고 싶지 않나요?

그림을 그려봤습니다. 이렇게 생겼어요:

![그림 1.1](images/internet_1.png)

조금 지저분해 보이죠? 사실 인터넷은 수 많은 기계(앞서 얘기한 *서버*라는)들을 연결한 하나의 네트워크랍니다. 수백, 수천 대의 기계들이요! 긴, 아주 긴 케이블들이 지구 전체를 둘러싸고 있답니다! 해저 케이블 지도 사이트 (http://submarinecablemap.com/)에 가보면 케이블이 얼마나 복잡하게 연결되어있는지 알 수 있어요. 아래 사진은 웹사이트에서 가져온 스크린 샷입니다.

![그림 1.2](images/internet_3.png)

멋지지 않나요? 그렇지만 인터넷에 연결된 모든 기계를 선으로 연결하는 것은 불가능해요. 그래서 어떤 기계(예를 들어 https://djangogirls.org 이 저장되어 있는 것 같은)에 도달하기 위해서는 수없이 많은 다른 기계들을 통과해야 한답니다.

그림으로 보면 다음과 같습니다.

![그림 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

이 편지는 나와 가장 가까이에 있는 동네 우체국으로 갈거에요. 받을 사람에게 가까운 다른 우체국으로, 다른 우체국으로 전달되면서 주소지에 최종 도착하게 됩니다. 특이한 점은 같은 장소에서 많은 양의 편지(*데이터 패킷*을 보내면, 각기 다른 우체국(*라우터*) 을 통해 전달될 수 있다는 것입니다. 또 우체국마다 배포되는 방법이 달라요.

![그림 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

그리고 도로명과 도시이름, 우편번호를 쓰는 대신 IP주소라는 것을 써야해요. 컴퓨터는 먼저 DNS(도메인 주소 시스템)에게 djangogirls.org 의 IP주소가 무엇인지 물어봅니다. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. 수령인이 이해할 수 있는 언어로 적혀져야하구요. 그렇죠? 이처럼 *데이터 패킷*에도 동일하게 적용되어야 웹사이트를 볼 수 있습니다. 우리는 HTTP (하이퍼텍스트 전송 프로토콜) 라는 프로토콜을 사용합니다.

따라서 기본적으로 웹사이트를 만들려면 그 웹사이트가 동작할 *서버* (기계) 가 필요해요. *서버*에서 *요청*(편지) 을 받으면, 다시 웹사이트(다른 편지) 로 되돌려줍니다.

Since this is a Django tutorial, you might ask what Django does. 여러분이 답장을 보낼 때, 모든 사람에게 항상 동일한 내용을 보내고 싶지 않을 거에요. 받는 사람에 따라 각각 다른 답장을 보내면 더 좋지 않을까요? 이와 같이 장고는 맞춤형 편지를 보낼 수 있도록 도와준답니다. :)

이제 수다는 그만하고– 뭔가 만들어볼까요!