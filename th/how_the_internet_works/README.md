# อินเทอร์เน็ตทำงานอย่างไร

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

สิ่งแรกที่คุณควรรู้คือ เว็บไซต์นั้นเป็นเพียงชุดของไฟล์ที่ถูกบันทึกอยู่ในฮาร์ดดิสก์ เช่นเดียวกับไฟล์ภาพยนต์ เพลง หรือรูปภาพ แต่สิ่งที่ทำให้เว็บไซต์นั้นต่างออกไปคือ: เว็บไซต์มีการรวมรหัสคอมพิวเตอร์ไปด้วย ซึ่งเรียกว่า HTML

หากคุณไม่คุ้นเคยกับการเขียนโปรแกรมเลย อาจจะยากสักหน่อยที่จะเข้าใจ HTML ในครั้งแรก แต่เว็บเบราว์เซอร์ของคุณนั้น​ (เช่น Chrome, Safari, Firefox และอื่นๆ) รักมันเลยล่ะ เว็บเบราว์เซอร์ถูกออกแบบมาเพื่อทำความเข้าใจรหัสเหล่านี้ ทำตามคำสั่งและแสดงผลจาไฟล์เว็บไซต์ของคุณ ให้ตรงกับสิ่งที่คุณต้องการ

เช่นเดียวกับไฟล์ทุกไฟล์ เราต้องการเก็บไฟล์ HTML ลงบนฮาร์ดดิสก์ สำหรับอินเทอร์เน็ตนั้น เราใช้เครื่องคอมพิวเตอร์พิเศษ และทรงพลัง เรียก่วา *servers* คอมพิวเตอร์เหล่านี้ ไม่มีหน้าจอ เมาส์ หรือแป้นพิมพ์ เพราะหน้าที่หลักคือการเก็บข้อมูลและให้บริการข้อมูลเหล่านี้ That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

เราวาดรูปมาให้คุณ! และมันหน้าตาแบบนี้:

![รูปที่ 1.1](images/internet_1.png)

ดูยุ่งเหยิง ไม่เป็นระเบียบ ใช่ไหม? In fact it is a network of connected machines (the above-mentioned *servers*). นับแสนเครื่อง! สายเคเบิ้ลไกลหลายกิโลเมตรทั่วโลก! คุณสามารถไปชมแผนที่เคเบิ้ลใต้น้ำได้ที่ (http://submarinecablemap.com) เพื่อดูว่าซับซ้อนขนาดไหน นี่เป็นภาพตัวตัวอย่างจากเว็บข้างต้น:

![รูปที่ 1.2](images/internet_3.png)

น่าสนใจใช่ไหม? แต่แน่นอนว่า มันไม่ได้เชื่อมกันระหว่างทุกเครื่องที่เชื่อมต่ออินเทอร์เน็ตหรอก So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

หน้าตาประมาณนี้:

![รูปที่ 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

จดหมายของคุณส่งไปยังที่ไปรษณีย์ใกล้บ้านคุณ และมันก็ถูกส่งต่อไปยังที่อื่นที่อยู่ห่างบ้านคุณไปนิดหน่อย และส่งไปเรื่อยๆ ไปเรื่อยๆ จนกระทั่งถึงปลายทาง สิ่งที่เป็นเอกลักษณ์คือ ถ้าคุณส่งจดหมายจำนวนมาก (*data packets*) ไปยังที่เดิม จดหมายเหล่านั้นจะถูกส่งต่อไปยังไปรษณีย์อื่นๆ (*routers*) ที่แตกต่างกันโดยสิ้นเชิง ขึ้นกับว่าพวกเขากระจายแต่ละสำนักงานยังไง

![รูป 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Of course, instead of paper and pen you use bytes of data, but the idea is the same!

แทนที่จะเป็นที่อยู่ ชื่อถนน ชื่อเมือง รหัสไปรษณีย์และชื่อประเทศ เราจะใช้ที่อยู่ IP แทน เครื่องคอมของคุณจะถามไปยัง DNS (Domain Name System) ที่จะแปลงชื่อ djangogirls.org ไปเป็นที่อยู่ IP ก่อน It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. คุณใช้ภาษาที่ผู้รับจดหมายเข้าใจด้วย ถูกไหม? เช่นเดียวกันกับ *data packets* ที่ส่งไปเพื่อขอดูเว็บไซต์ เราใช้กระบวนการหรือ protocol ที่เรียกว่า HTTP (Hypertext Transfer Protocol)

ดังนั้น โดยทั่วไป หากคุณมีเว็บไซต์ คุณต้องมี *server* (เครื่อง) ที่เก็บเว็บไซต์ เมื่อ *server* ได้รับ *request* เข้ามา (มีจดหมายส่งมา) มันจะส่งเว็บไซต์กลับไป (จดหมายตอบกลับ)

Since this is a Django tutorial, you might ask what Django does. เมื่อคุณต้องการตอบกลับ คุณไม่จำเป็นต้องส่งข้อมูลที่เหมือนๆ กัน ไปยังทุกคน มันจะดีกว่ามาก ถ้าจดหมายของคุณนั้นส่งไปในรูปแบบส่วนบุคคล โดยเฉพาะอย่างยิ่งสำหรับคุณที่เขียนถึงคุณ ถูกไหม? Django ช่วยคุณสร้างสิ่งเหล่านั้น ทำให้เป็นจดหมายที่น่าสนใจยิ่ง. :)

Enough talk – time to create!