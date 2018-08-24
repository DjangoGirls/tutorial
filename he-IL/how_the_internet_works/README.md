# איך עובד האינטרנט

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. בדיוק כמו הסרטים, המוסיקה או התמונות שלך. עם זאת, יש חלק אחד ייחודי עבור אתרי אינטרנט: הם כוללים קוד מחשב הנקרא HTML.

אם אתן לא מכירות תכנות זה יכול להיות קשה להבין HTML בהתחלה, אבל דפדפני האינטרנט שלך (כמו כרום, ספארי, פיירפוקס, וכו ') אוהבים את זה. דפדפני אינטרנט נועדו להבין קוד זה, לעקוב אחר ההוראות שלו, ולהציג את הקבצים מהם אתר האינטרנט שלך בנוי, בדיוק כפי שאת רוצה.

כמו עם כל קובץ, יש לאחסן קבצי HTML איפשהו בדיסק הקשיח. עבור האינטרנט, קיימים מחשבים מיוחדים שנקראים *שרתים*. אין להם מסך, עכבר או מקלדת, כי המטרה העיקרית שלהם היא כדי לאחסן נתונים ולהנגיש אותם. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

ציירנו לך תמונה! זה נראה ככה:

![איור 1.1](images/internet_1.png)

נראה כמו בלגן, נכון? In fact it is a network of connected machines (the above-mentioned *servers*). מאות אלפי מכשירים! קילומטרים רבים של כבלים ברחבי העולם! תוכלו לבקר באתר מפת הכבלים התת-ימיים (http://submarinecablemap.com) כדי לראות כמה מסובך הוא האינטרנט. הנה צילום מסך מהאתר:

![איור 1.2](images/internet_3.png)

זה מרתק, נכון? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

זה נראה כך:

![איור 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

המכתב שלך הולך לסניף הדואר הקרוב ביותר אליך. משם הוא הולך לאחד אחר, שקצת קרוב יותר לנמען, ואז לעוד אחד, ועוד אחד עד שמגיע ליעד. הדבר המיוחד היחיד הוא שכשאת שולחת מכתבים רבים (*חבילות נתונים*) לאותו המקום, הם יכולים לעבור בסניפי דואר (*נתבים*) שונים לגמרי. זה תלוי איך הם מופצים בכל אחד מהסניפים.

![איור 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

במקום כתובות עם שם רחוב, עיר, מיקוד, שם מדינה, נשתמש בכתובות IP. המחשב שלך קודם מבקש מה-DNS (Domain Name System) לתרגם את djangogirls.org לכתובת IP. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. את גם משתמשת בשפה שהנמען יבין, נכון? זה נכון גם לגבי *חבילות הנתונים* שאת שולחת על מנת לראות אתר אינטרנט. אנו נשתמש בפרוטוקול בשם HTTP (פרוטוקול העברת היפר-טקסט).

אז, בעיקרון, כאשר יש לך אתר אינטרנט, את צריכה *שרת* (מכשיר) שבו הוא חי. כאשר *השרת* מקבל *בקשה* נכנסת (במכתב), הוא שולח בחזרה את האתר שלך (במכתב אחר).

Since this is a Django tutorial, you might ask what Django does. כאשר את שולחת תגובה, את לא תמיד רוצה לשלוח לכולם את אותו הדבר. זה הרבה יותר טוב אם המכתבים שלך מותאמים אישית, במיוחד עבור האדם שרק כתב לך, נכון? Django מסייע לך ביצירת המכתבים המעניינים והמותאמים אישית האלו. :)

Enough talk – time to create!