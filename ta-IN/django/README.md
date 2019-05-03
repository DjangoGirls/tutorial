# டிஜாங்க் என்றால் என்ன?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) பைதான் இல் எழுதப்பட்ட ஒரு இலவச மற்றும் திறந்த மூல வலை பயன்பாட்டு கட்டமைப்பாகும். வலைத்தள கட்டமைப்பானது வலைத்தளங்களை வேகமாகவும் எளிதாகவும் உருவாக்க உதவுகின்ற ஒரு கூறுகளின் தொகுப்பு ஆகும்.

நீங்கள் ஒரு வலைத்தளத்தை உருவாக்கும் போது, நீங்கள் எப்போதும் இதே போன்ற கூறுகளின் தொகுப்பு தேவை: பயனர் அங்கீகாரத்தை (கையொப்பமிடுதல், உள்நுழைதல், வெளியேறுதல்), உங்கள் வலைத்தளத்திற்கான நிர்வாக குழு, வடிவங்கள், கோப்புகளை பதிவேற்ற ஒரு வழி.

நீங்கள் அதிர்ஷ்டவசமாக, மற்றவர்கள் ஒரு புதிய தளத்தை உருவாக்கும் போது இதே போன்ற சிக்கல்களை வலை டெவலப்பர்கள் எதிர்கொள்கிறார்கள் என்பதைக் கவனித்திருக்கிறார்கள், அதனால் அவர்கள் அணிவகுத்து, கட்டமைக்கப்பட்ட கூறுகளை உருவாக்கியுள்ளனர்(Django).

சக்கரங்களை புதிதாக்குவதற்கும், ஒரு புதிய தளத்தை உருவாக்கும்போது மேல்நிலை சிலவற்றைத் தணிப்பதற்கும் உதவுவதற்கு கட்டமைப்புகள் உள்ளன.

## உங்களுக்கு ஒரு கட்டமைப்பை ஏன் வேண்டும்?

டான்ஜோ உண்மையில் என்னவென்று புரிந்துகொள்ள, சேவையகங்களில் ஒரு நெருக்கமான பார்வை எடுக்க வேண்டும். முதல் விஷயம் என்னவென்றால், சர்வர் உங்களுக்கு ஒரு வலைப்பக்கத்தை சேவை செய்ய வேண்டும் என்று தெரிந்து கொள்ள வேண்டும்.

உள்வரும் எழுத்துக்கள் (கோரிக்கைகள்) கண்காணிக்கப்படும் ஒரு அஞ்சல் பெட்டி (துறைமுகம்) கற்பனை செய்து பாருங்கள். இது வலை சேவையகத்தால் செய்யப்படுகிறது. வலை சேவையகம் கடிதத்தை படித்து, ஒரு வலைப்பக்கத்தில் பதிலை அனுப்புகிறது. ஆனால் நீங்கள் ஏதாவது அனுப்ப விரும்பும் போது, நீங்கள் சில உள்ளடக்கங்களைக் கொண்டிருக்க வேண்டும். மற்றும் உள்ளடக்கத்தை உருவாக்குவதற்கு உதவுகிற ஒன்று தான் ஜான்மோ.

## உங்கள் சேவையகத்திலிருந்து யாரோ ஒரு வலைத்தளத்தை கோரும் போது என்ன நடக்கிறது?

ஒரு கோரிக்கை வலை சேவையகத்திற்கு வரும் போது, அது உண்மையில் கேட்கப்பட்டதை கண்டுபிடிக்க முயற்சிக்கும் டிஜாங்கிற்கு அனுப்பப்படுகிறது. இது முதல் வலைப்பக்கத்தை எடுக்கும் மற்றும் என்ன செய்ய வேண்டும் என்பதை கண்டுபிடிக்க முயற்சிக்கிறது. இந்த பகுதி, டிஜாங்கோ**urlresolver**செய்யப்படுகிறது. (ஒரு வலைத்தள முகவரி URL ஐ அழைக்கப்படுகிறது - யூனிஃபார்ம் ஆதார லொக்கேட்டர் - எனவே பெயர்*urlresolver* என்பது அர்த்தம்). மிகவும் புத்திசாலி இல்லை-இது ஒரு பட்டியல் எடுக்கும் மற்றும்URLஐ பொருத்த முயற்சிக்கிறது. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Imagine a mail carrier with a letter. She is walking down the street and checks each house number against the one on the letter. If it matches, she puts the letter there. This is how the urlresolver works!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Maybe the user asked to change something in the data? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!