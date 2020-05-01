# Django란 무엇일까요?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*)는 Python으로 만들어진 무료 오픈소스 웹 어플리케이션 프레임워크(web application framework) 입니다. 쉽고 빠르게 웹사이트를 개발할 수 있도록 돕는 구성요소로 이루어진 웹 프레임워크인 것이죠.

웹사이트를 구축할 때, 비슷한 유형의 요소들이 항상 필요합니다. 회원가입, 로그인, 로그아웃과 같이 사용자 인증을 다루는 방법이나 웹사이트의 관리자 패널, 폼, 파일 업로드와 같은 것들 말이지요.

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## 왜 프레임워크가 필요한가요?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

편지(request, 요청) 이 도착했는지 확인해주는 메일박스(port, 포트) 가 있다고 상상해보세요. 이 것은 웹 서버가 해주는 일이에요. The web server reads the letter and then sends a response with a webpage. 그런데 무언가를 주고 싶을 때는 그 안에 내용이 있어야하죠. 장고는 그 특정 컨텐츠를 만들 수 있는 역할을 합니다.

## 누군가가 서버에 웹 사이트를 요청하면 어떤 일이 벌어질까요?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

우편배달부를 생각해보세요. 거리를 걸으며 집집마다 편지와 대조해서 주소와 번지를 확인합니다. 주소와 번지가 일치하면 우편배달부는 그곳에 편지를 배달합니다. Urlresolver 가 바로 이와 같은 일을 합니다.

In the *view* function, all the interesting things are done: we can look at a database to look for some information. 그런데 만약 사용자가 데이터를 바꿔달라고 수정을 요청한다면 어떻게 될까요? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

물론 지금까지의 설명은 아주 간단히 설명한 것에 불과해요. 하지만 모든 기술적인 부분까지 자세히 알 필요가 없답니다. 이 정도 아는 것만으로도 충분하답니다.

좀 더 자세히 아는 것보다, 지금부터는 장고를 이용해 간단하게 조그만 것부터 만들어봐요. 그렇게 하면서 중요한 모든 것들을 하나씩 배워나가도록 해요.