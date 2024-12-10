Balabolka (komentorivisovellus), versio 1.86
Copyright (c) 2013-2024 Ilya Morozov
All Rights Reserved

WWW: https://www.cross-plus-a.com/fi/bconsole.htm
E-mail: crossa@list.ru

Lisenssi: Freeware
Käyttöjärestelmä: Microsoft Windows XP/Vista/7/8/10/11
Microsoft Speech API: v4.0/5.0
Microsoft Speech Platform: v11.0



*** Komentorivi ***

balcon [options ...]


*** Komentoriviparametrit ***

-l
   Näytä kaikki tietokoneella olevat äänet.

-g
   Näytä kaikki saatavilla olevat audiolaitteet.

-f <tiedoston_nimi>
   Avaa tekstitiedosto. Komentoon voi sisältyä muutama [-f] -parametri.

-fl <tiedoston_nimi>
   Sets the name of the text file with the list of input files (one file name per line). Komentoon voi sisältyä muutama [-fl] -parametri.

-w <tiedoston_nimi>
   Kirjoittaa WAV-äänitiedosto. Jos tämä parametri on syöty, luodaan äänitiedosto. Jos parametria ei ole, tekstiä luetaan ääneen.

-n <äänen_nimi>
   Äänen nimi (nimenosa riittää). Jos tätä parametria ei ole, käytetään Windowsin ohjauspaneelilla valittu ääni.
   If the option is not specified, the voice, defined by the option [-id], or the default voice of Windows will be used.

-id <luku>
   Valita tietokoneen ääni kielitunnisteen avulla (Language ID).
   Microsoftin kehittäjät myönsivät sellaiset tunnisteet kaikille kielille (esimerkiksi, "1033" tai "0x0409" on englannin kielen tunniste ja "1035" tai "0x040B" – suomen kielen tunniste).
   Ohjelma valitsee listalta ensimmäisen äänen, jonka kielitunniste vastaa tarvittavaan koodiin. Jos parametri ei ole annettu, niin käytetään ääntä, joka annettiin [–n] -parametrin avulla, tai ääntä, joka valittiin Windowsin ohjauspaneelista.
   Tunnisteiden lista: https://msdn.microsoft.com/en-us/library/cc233982.aspx

-m
   Näyttää valitun äänen parametrit.

-b <luku>
   Valitse audiolaite sen numeron mukaan saatavilla olevien laitteiden listasta äänen esittämiseen. Oletuslaitteen numero on 0.

-r <tekstin_rivi>
   Sets the audio output device by its name.

-c
   Käytä leikepöydässä oleva teksti.

-t <tekstin_rivi>
   Käytä komentorivissä oleva teksti. Komentoon voi sisältyä muutama [-t] -parametri.

-i
   Käytä standardisyöttövirrassa oleva teksti (STDIN).

-o
   SAPI 4: parametria ei käytettävissä.
   SAPI 5 ja Microsoft Speech Platform: kirjoita äänitieto standarditulostevirtaan (STDOUT); jos parametri on mainittu, parametri [-w] on välittämättä.

-s <luku>
   SAPI 4: asenna ääninopeudeksi luku 0...100 (oletusnopeutta ei ole).
   SAPI 5 ja Microsoft Speech Platform: asenna ääninopeudeksi luku -10...10 (oletusnopeus on 0).

-p <luku>
   SAPI 4: asenna äänensävyksi luku 0...100 (oletussävyä ei ole).
   SAPI 5 ja Microsoft Speech Platform: asenna äänensävyksi luku -10...10 (oletussävy on 0).

-v <luku>
   SAPI 4: parametria ei käytettävissä.
   SAPI 5 ja Microsoft Speech Platform: asenna äänenvoimakkuudeksi luku 0...100 (oletusvoimakkuus on 100).

-e <luku>
   Asenna lauseiden väliseksi taukopituudeksi syötetty luku (yksikkönä on millisekunti). Oletuspituus on 0.

-a <luku>
   Asenna kappaleiden väliseksi taukopituudeksi syötetty luku (yksikkönä on millisekunti). Oletuspituus on 0.

-d <tiedoston_nimi>
   Käytä sanakirja ääntämyksen korjaamiseksi (tiedostolaajennus *.BXD, *.DIC tai *.REX). Komentoon voi sisältyä muutama [-d] -parametri.

-k
   Lopettaa muiden tietokoneella toimivien konsolisovellusten toimintaa.

-ka
   Lopettaa nykyhetkessä aktiivisena olevan konsolisovelluksen toimintaa.

-pr
   Make pause or resume reading aloud by the active copy of the application. The action is the same as for the context menu item "Pause"/"Resume".

-q
   Lisätä sovellus jonoon. Konsolisovellus odottaa kunnes muut ohjelmat lopettavat toimintaan.

-lrc
   SAPI 4: parametria ei käytettävissä.
   SAPI 5 ja Microsoft Speech Platform: luoda LRC-muotoinen tiedosto, jos on annettu [–w] tai [–o] –parametrit.

-srt
   SAPI 4: parametria ei käytettävissä.
   SAPI 5 ja Microsoft Speech Platform: luoda SRT-muotoinen tiedosto, jos on annettu [–w] tai [–o] –parametrit.

-vs <tiedoston_nimi>
   SAPI 4: parametria ei käytettävissä.
   SAPI 5 ja Microsoft Speech Platform: sets the name of output text file with visemes, if the option [-w] is specified.
   A viseme is the mouth shape that corresponds to a particular speech sound. SAPI supports the list of 21 visemes.
   This list is based on the original Disney visemes. The application will create the audio file and then read it aloud to get visemes and their timecodes.
   The list of visemes supported by SAPI 5: https://msdn.microsoft.com/en-us/library/ms720881(v=vs.85).aspx

-sub
   Tekstin muotona on tekstitys, joka pitää muuttaa äänitiedostoksi ottaen huomioon annetut väliajat.

-tray
   Näyttää ohjelman kuvake käyttöjärjestelmän tiedotusten alueella.
   Se antaa käyttäjälle mahdollisuutta seurata operaation suorittamista, sekä lopettaa prosessi pikavalikon "Stop"-kohdan avulla.

-ln <luku>
   Selects a line from the text file by using of a line number. The line numbering starts at "1".
   The interval of numbers can be used for selecting of more than one line (for example, "26-34").
   Komentoon voi sisältyä muutama [-ln] -parametri.

-fr <luku>
   SAPI 4: parametria ei käytettävissä.
   SAPI 5 ja Microsoft Speech Platform: sets the output audio sampling frequency in kHz (8, 11, 12, 16, 22, 24, 32, 44, 48).
   If the option is not specified, the default value of the selected voice will be used.

-bt <luku>
   SAPI 4: parametria ei käytettävissä.
   SAPI 5 ja Microsoft Speech Platform: sets the output audio bit depth (8 tai 16).
   If the option is not specified, the default value of the selected voice will be used.

-ch <luku>
   SAPI 4: parametria ei käytettävissä.
   SAPI 5 ja Microsoft Speech Platform: sets the output audio channel mode (1 tai 2).
   If the option is not specified, the default value of the selected voice will be used.

-dp
   Display progress information in a console window.

-cfg <file_name>
   Sets the name of the configuration file with the command line options (a text file where each line contains one option). If the option is not specified, the file "balcon.cfg" in the same folder as the utility will be used.

-h
   Näytä kaikki mahdolliset parametrit.

--encoding <merkistö> tai –enc <merkistö>
   Tekstin koodaus tavallisesta syöttövirrasta ("ansi", "utf8" tai "unicode"). Oletuksena parametri on "ansi".

--silence-begin <luku> tai -sb <luku>
   Määrittää äänitiedoston alussa olevan tauon pituus (millisekunneissa). Oletuspituus on 0.

--silence-end <luku> tai -se <luku>
   Määrittää äänitiedoston lopussa olevan tauon pituus (millisekunneissa). Oletuspituus on 0.

--lrc-length <luku>
   Määrittää LRC-muotoisen tiedoston maksimaalinen rivin pituus (symboleissa).

--lrc-fname <tiedoston_nimi>
   LRC-muotoisen tiedoston nimi. Tämä parametri voi olla hyödyllinen niissä tapauksissa, kun komentorivissä on annettu parametri [–o].

--lrc-enc <merkistö>
   LRC-muotoisen tiedoston koodaus ("ansi", "utf8" tai "unicode"). Oletuksena parametri on "ansi".

--lrc-offset <luku>
   Antaa ajansiirto LRC-muotoiselle tiedostolle (millisekunneissa).

--lrc-artist <tekstin_rivi>
   LRC-muotoisen tiedoston tag: teoksen esittäjä.

--lrc-album <tekstin_rivi>
   LRC-muotoisen tiedoston tag: albumi.

--lrc-title <tekstin_rivi>
   LRC-muotoisen tiedoston tag: teoksen nimi.

--lrc-author <tekstin_rivi>
   LRC-muotoisen tiedoston tag: luoja.

--lrc-creator <tekstin_rivi>
   LRC-muotoisen tiedoston tag: tiedoston luoja.

--lrc-sent
   Inserts blank lines after sentences in the LRC file.

--lrc-para
   Inserts blank lines after paragraphs in the LRC file.

--srt-length <luku>
   Määrittää SRT-muotoisen tiedoston maksimaalinen rivin pituus (symboleissa).

--srt-fname <tiedoston_nimi>
   SRT-muotoisen tiedoston nimi. Tämä parametri voi olla hyödyllinen niissä tapauksissa, kun komentorivissä on annettu parametri [–o].

--srt-enc <merkistö>
   SRT-muotoisen tiedoston koodaus ("ansi", "utf8" tai "unicode"). Oletuksena parametri on "ansi".

--raw
   SAPI 4: parametria ei käytettävissä.
   SAPI 5 ja Microsoft Speech Platform: tallentaa äänitiedostot RAW PCM-muotoon; tiedostot eivät sisällä WAV-muotoista otsikkoa.
   Parametria käytetään [–o] -parametrin parissa.

--ignore-length tai -il
   SAPI 4: parametria ei käytettävissä.
   SAPI 5 ja Microsoft Speech Platform: ei kirjoita äänitiedoston kokoa WAV-muotoiseen otsikkoon.
   Parametria käytetään [–o] -parametrin parissa.

--sub-format <tekstin_rivi>
   Tekstityksen muoto ("srt", "lrc", "ssa", "ass", "smi" tai "vtt"). Jos parametri ei ole annettu, niin parametri määritetään tekstityksen tiedostopäätteen mukaan.

--sub-fit tai -sf
   SAPI 4: parametria ei käytettävissä.
   SAPI 5 ja Microsoft Speech Platform: lisätä automaattisesti puheen nopeutta pysyäkseen tekstityksessä annettujen väliaikojen rajoissa. The application increments the speech rate value step by step, checking whether the text fits within the given time interval or not.

--sub-fit-lib tai -sfl
   SAPI 4: parametria ei käytettävissä.
   SAPI 5 ja Microsoft Speech Platform: lisätä automaattisesti puheen nopeutta pysyäkseen tekstityksessä annettujen väliaikojen rajoissa. The SoundTouch library will be used for changing tempo.

--sub-max <luku> tai -sm <luku>
   SAPI 4: parametria ei käytettävissä.
   SAPI 5 ja Microsoft Speech Platform: määrittää maksimaalinen puheen nopeus äänialueella -10:stä 10:een (muuttaakseen tekstitys äänitiedostoksi). If SoundTouch library is used, the range must be from 110% to 200%.

--delete-file tai -df
   Poistaa tekstitiedosto ääneen lukemisen tai äänitiedoston tallentamisen jälkeen.

--ignore-square-brackets tai -isb
   Ignore text in [square brackets].

--ignore-curly-brackets tai -icb
   Ignore text in {curly brackets}.

--ignore-angle-brackets tai -iab
   Ignore text in <angle brackets>.

--ignore-round-brackets tai -irb
   Ignore text in (round brackets).

--ignore-url tai -iu
   Ignore URLs.

--ignore-comments tai -ic
   Ignore comments in text. Single-line comments start with // and continue until the end of the line. Multiline comments start with /* and end with */.

--voice1-name <äänen_nimi>
   SAPI 4: parametria ei käytettävissä.
   SAPI 5 ja Microsoft Speech Platform: sets the additional voice name to read foreign words in text (the part of the name will be enough).
   The option is used together with the option [--voice1-langid]. Other voices can be set by options [--voice2-name], [--voice3-name], etc.

--voice1-langid <kielen tunnus>
   Sets the language ID for foreign words in text. The option is used together with the option [--voice1-name]. The command line may contain more than one option [--voice1-langid]. Also an option may contain a comma-separated list of IDs.
   The list of supported language IDs is based on ISO 639-1 codes: am, ar, az, ba, bg, be, ca, cs, cu, cv, da, de, el, en, es, et, eu, fi, fil, fr, ja, he, hi, hr, hu, hy, it, gn, gu, ka, kk-Cyr, kk-Lat, kn, ko, ky, lo, lt, lv, mk, no, pl, pt, ro, ru, sk, sl, sr-Cyr, sr-Lat, sv, tg, th, tk, tr, tt, uk, zh.

--voice1-rate <luku>
   Sets the rate for the additional voice in a range of -10 to 10 (the default is 0).

--voice1-pitch <luku>
   Sets the pitch for the additional voice in a range of -10 to 10 (the default is 0).

--voice1-volume <luku>
   Sets the volume for the additional voice in a range of 0 to 100 (the default is 100).

--voice1-roman
   Use the default voice to read Roman numerals in text. If text with non-Latin characters contains Roman numerals, the application will not change a voice to read them.

--voice1-digit
   Use the default voice to read numbers in text.

--voice1-length <luku>
   Set the minimal length of foreign text parts that will be read by the additional voice (in characters).


*** Esimerkkejä ***

balcon -l

balcon -n "Microsoft Anna" -m

balcon -f "d:\Text\book.txt" -w "d:\Sound\book.wav" -n "Emma"

balcon -n "Callie" -c -d "d:\rex\rules.rex" -d "d:\dic\rules.dic"

balcon -n "Sanna" -t "Teksi luetaan hitaasti." -s -5 -v 70

balcon -k

balcon -f "d:\Text\book.txt" -w "d:\Sound\book.wav" -lrc --lrc-length 80 --lrc-title "The Lord of the Rings"

balcon -f "d:\Text\film.srt" -w "d:\Sound\film.wav" -n "Laura" --sub-fit --sub-max 2

balcon -f "d:\Text\book.txt" -n Kimberly --voice1-name Tatyana --voice1-langid ru


Esimerkki sovelluksen käyttämistä LAME.EXE –apuohjelman parissa:

balcon -f d:\book.txt -n Sanna -o --raw | lame -r -s 22.05 -m m -h - d:\book.mp3


Esimerkki sovelluksen käyttämistä OGGENC2.EXE –apuohjelman parissa:

balcon -f d:\book.txt -n Sanna -o -il | oggenc2 --ignorelength - -o d:\book.ogg


Esimerkki sovelluksen käyttämistä WMAENCODE.EXE –apuohjelman parissa:

balcon -f d:\book.txt -n Sanna -o -il | wmaencode - d:\book.wma --ignorelength


*** Konfiguraatiotiedosto ***

Parametrit voi tallentaa "balcon.cfg" -nimiseen konfiguraatiotiedostoon, joka sijaitsee sovelluksen kansiossa.

Tiedoston sisällyksen esimerkki:
===================
-f d:\Text\book.txt
-w d:\Sound\book.wav
-n Microsoft Anna
-s 2
-p -1
-v 95
-e 300
-d d:\Dict\rules.bxd
-lrc
--lrc-length 75
--lrc-enc utf8
--lrc-offset 300
===================

Sovellus voi yhdistää konfiguraatiotiedostossa olevat ja komentorivin parametrit.


*** Audio Clips ***

The application allows to insert links to external WAV files (audio clips) into text. Audio clip tag will look like:

{{Audio=C:\Sounds\ring.wav}}

When speaking text aloud, the program will pause when the audio clip tag is reached, play the audio clip and resume speaking.
When converting to audio files, the audio clip will be embedded in the audio file created by the application.


*** "Voice" Tag ***

If it is necessary to change a voice or its properties during reading aloud, a special tag can be used for SAPI 5 and Microsoft Speech Platform (SAPI 4 voices will ignore this tag).

The tag format:

{{Voice=Name;Rate;Pitch;Volume}}

- Name: the name of a voice (one word or the part of a word is enough);
- Rate: the rate of a voice (values range from -10 to 10);
- Pitch: the pitch of a voice (values range from -10 to 10);
- Volume: the volume (values range from 0 to 100).

A tag applies to all subsequent text. The values are separated by semicolons. For example:

This text will be spoken by the default voice of Balabolka. {{Voice=Kimberly;0;0;100}} The voice 'Kimberly' will read the other text.

The tag's content is case insensitive. Values for some properties can be omitted:

{{voice=eric;;;50}}

{{Voice=Hans;-1}}

{{Voice=Rachel}}

To return to the default voice, use this tag:

{{Voice=}}

Warning! It is impossible to switch between SAPI 5 voices and voices of the Microsoft Speech Platform.


*** "Pause" Tag ***

A specified number of milliseconds of silence can be inserted into the output audio file. For example:

One hundred twenty milliseconds of silence {{Pause=120}} just occurred.


*** Lisenssi ***

Sovelluksen kaupallinen käyttöoikeus:
- toiminimelle rajoituksetta;
- oikeushenkilöitä koskevat rajoitukset on mainittu Balabolkan lisenssisopimuksessa.

Sovelluksen kaupallinen käyttö sallittu ainoastaan oikeudenomistajan luvasta.

###
