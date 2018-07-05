# Django คืออะไร?

Django (อ่านว่า *แจง-โก้*) เป็น web application framework ที่ฟรีและเป็นโอเพ่นซอร์ส เขียนโดยใช้ภาษา Python มีส่วนประกอบต่างๆ ที่ช่วยให้คุณสามารถพัฒนาเว็บไซต์ได้อย่างรวดเร็วและง่าย

เมื่อคุณสร้างเว็บไซต์, คุณมักจะต้องการส่วนประกอบที่ใช้บ่อยๆ เช่น วิธีจัดการจับผู้ใช้ (สร้างผู้ใช้ใหม่, เข้าระบบ, ออกจากระบบ), ตัวจัดการเว็บไซต์, ฟอร์ม, วิธีอัปโหลดไฟล์ และ อื่นๆ

เป็นโชคดีของคุณ เพราะคนในสมัยก่อนก็เจอปัญหานี้แหละเวลาทำเว็บ เพราะงั้นเค้าเลยรวมตัวกันทำ framework ขึ้นมา (Django ก็เป็นหนึ่งในนั้น) ซึ่งจะมีส่วนประกอบสำเร็จรูปให้เราได้ใช้

Framework มีไว้เพื่อให้คุณไม่ต้องสร้างอะไรที่ซ้ำกับของเดิม และประหยัดเวลาในการทำได้มาก

## ทำไมเราต้องการ framework?

การที่จะเข้าใจว่า Django มีไว้ทำอะไร เราต้องดูในส่วนของ server โดยสิ่งที่ server ทำคือการส่งหน้าเว็บกลับมาให้คุณ

ลองจินตนาการถึงกล่องจดหมาย (พอร์ต) ซึ่งจดหมายที่เข้ามา​ (request) จะถูกตรวจสอบ ซึ่งตรงนี้ เว็บเซิร์ฟเวอร์เป็นคนจัดการ เว็บเซิร์ฟเวอร์อ่านจดหมาย และตอบกลับเป็นหน้าเว็บเพจ แต่ก่อนที่คุณจะส่ง คุณจำเป็นต้องมีเนื้อหาที่จะส่งไปก่อน ซึ่ง Django คือสิ่งที่จะช่วยคุณสร้างเนื้อหา

## เกิดอะไรขึ้นเมื่อมีบางคนร้องขอหน้าเว็บจากเซิร์ฟเวอร์ของคุณ

เมื่อการร้องขอ(request) ถูกส่งมาถึงเว็บเซิร์ฟเวอร์ มันจะถูกส่งต่อมาที่ Django ซึ่ง Django จะพยายามที่จะดูว่าอะไรที่ถูกร้องขอมากันแน่ โดยจะดูจากที่อยู่เว็บที่ร้องขอมาเป็นอันดับแรกและพยายามที่จะดูว่าจะทำอย่างไรกับมันดี This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

ลองนึกถึงคนส่งจดหมายนางนึง นางจะเดินไปตามถนนแล้วก็ส่องดูบ้านเลขที่ในแต่ละบ้าน ถ้าตรงกัน นางก็จะหย่อนจดหมายลงไปให้ นี่คือวิธีที่ urlresolver ทำงานไงล่ะ!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. บางทีผู้ใช้ อาจจะอยากเปลี่ยนข้อมูลบางอย่างก็เป็นได้? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

แน่นอนว่าคำอธิบายข้างต้นฟังดูเหมือนง่าย แต่คุณไม่จำเป็นรู้รายละเอียดทางเทคนิคทั้งหมดหรอกนะ รู้ไอเดียทั่วๆ ไปก็เพียงพอแล้วล่ะ

ดังนั้น แทนที่เราจะลงลึกในรายละเอียดให้มากกว่านี้ เรามาสร้างบางอย่างด้วย Django แบบง่ายๆ และเราจะได้เรียนกรู้ส่วนที่สำคัญไปพร้อมๆ กันเลย!