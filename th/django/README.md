# Django คืออะไร?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. มีส่วนประกอบต่างๆ ที่ช่วยให้คุณสามารถพัฒนาเว็บไซต์ได้อย่างรวดเร็วและง่าย

เมื่อคุณสร้างเว็บไซต์, คุณมักจะต้องการส่วนประกอบที่ใช้บ่อยๆ เช่น วิธีจัดการจับผู้ใช้ (สร้างผู้ใช้ใหม่, เข้าระบบ, ออกจากระบบ), ตัวจัดการเว็บไซต์, ฟอร์ม, วิธีอัปโหลดไฟล์ และ อื่นๆ

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## ทำไมเราต้องการ framework?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

ลองจินตนาการถึงกล่องจดหมาย (พอร์ต) ซึ่งจดหมายที่เข้ามา​ (request) จะถูกตรวจสอบ ซึ่งตรงนี้ เว็บเซิร์ฟเวอร์เป็นคนจัดการ The web server reads the letter and then sends a response with a webpage. แต่ก่อนที่คุณจะส่ง คุณจำเป็นต้องมีเนื้อหาที่จะส่งไปก่อน ซึ่ง Django คือสิ่งที่จะช่วยคุณสร้างเนื้อหา

## เกิดอะไรขึ้นเมื่อมีบางคนร้องขอหน้าเว็บจากเซิร์ฟเวอร์ของคุณ

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

ลองนึกถึงคนส่งจดหมายนางนึง นางจะเดินไปตามถนนแล้วก็ส่องดูบ้านเลขที่ในแต่ละบ้าน ถ้าตรงกัน นางก็จะหย่อนจดหมายลงไปให้ นี่คือวิธีที่ urlresolver ทำงานไงล่ะ!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. บางทีผู้ใช้ อาจจะอยากเปลี่ยนข้อมูลบางอย่างก็เป็นได้? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

แน่นอนว่าคำอธิบายข้างต้นฟังดูเหมือนง่าย แต่คุณไม่จำเป็นรู้รายละเอียดทางเทคนิคทั้งหมดหรอกนะ รู้ไอเดียทั่วๆ ไปก็เพียงพอแล้วล่ะ

ดังนั้น แทนที่เราจะลงลึกในรายละเอียดให้มากกว่านี้ เรามาสร้างบางอย่างด้วย Django แบบง่ายๆ และเราจะได้เรียนกรู้ส่วนที่สำคัญไปพร้อมๆ กันเลย!