Balabolka (конзолно приложение), версия 1.78
Авторски права (c) 2013-2021 Илия Морозов
Всички права запазени

Уебсайт: http://balabolka.site/bg/bconsole.htm
Е-поща: crossa@list.ru

Лиценз: Безплатен (Freeware)
Операционни системи: Microsoft Windows XP/Vista/7/8/10
Речев ППИ: 4.0/5.0
Microsoft Speech Platform: 11.0



*** Синтаксис ***

balcon [опции ...]


*** Опции на командния ред ***

-l
   Извежда на екрана списъка с наличните гласове.

-g
   Извежда на екрана списъка с налични звукови устройства.

-f <текстов_файл>
   Задава името на входния текстов файл. Командния ред може да съдържа повече от една [-f] опция.

-fl <име_на_файл>
   Sets the name of the text file with the list of input files (one file name per line). Командния ред може да съдържа повече от една [-fl] опция.

-w <звуков_файл>
   Задава името на изходния файл в WAV формат. Ако опцията е зададена, ще бъде създаден аудио файл. Иначе, текста ще бъде прочетен на глас.

-n <име_на_гласа>
   Задава кой глас ще бъде използван (името на гласа е достатъчно). Ако опцията не е зададена, ще бъде използван гласа зададен по подразбиране в Windows.

-id <целочислена_стойност>
   Задава регионалния идентификатор (Locale ID) за гласа. Регионалният идентификатор е езиковия код, зададен от Microsoft
   (например "1026" или "0x0402" за "Български", "1033" или "0x0409" за "Английски - САЩ"). Програмата ще избере първия глас със зададен регионален идентификатор от списъка с гласове.
   Ако тази настройка не е зададена, гласът зададен с настройката [-n] или гласът по подразбиране в Windows ще бъде използван.
   Списъкът с регионални идентификатори, може да бъде открит на следния уеб адрес:
   https://msdn.microsoft.com/en-us/library/cc233982.aspx

-m
   Извежда на екрана параметрите на гласа.

-b <целочислена стойност>
   Задава изходното звуково устройство според неговия индекс. Индексът на подразбиращото се звуково устройство е 0.

-r <текст>
   Sets the audio output device by its name.

-c
   За вход се използва текста от клипборда.

-t <текст>
   За вход може да се използва текст от командния ред. Командния ред може да съдържа повече от една [-t] опция.

-i
   За вход се използва текста от STDIN.

-o
   SAPI 4: Не се използва.
   SAPI 5 и Microsoft Speech Platform: Записва звуковите данни в STDOUT; ако е зададена тази опция, опцията [-w] бива игнорирана.

-s <целочислена_стойност>
   SAPI 4: Задава скоростта в обхват от 0 до 100 (няма стойност по подразбиране).
   SAPI 5 и Microsoft Speech Platform: Задава скоростта в обхват от -10 до 10 (по подразбиране е 0).

-p <целочислена_стойност>
   SAPI 4: Задава височината на гласа в обхват от 0 до 100 (няма стойност по подразбиране).
   SAPI 5 и Microsoft Speech Platform: Задава височината на гласа в обхват от -10 до 10 (по подразбиране е 0).

-v <целочислена_стойност>
   SAPI 4: Не се използва.
   SAPI 5 и Microsoft Speech Platform: Задава силата на звука в обхват от 0 до 100 (по подразбиране е 100).

-e <целочислена_стойност>
   Задава дължината на паузите между изреченията (в милисекунди). По подразбиране е 0.

-a <целочислена_стойност>
   Задава паузите между абзаците (в милисекунди). По подразбиране е 0.

-d <име_на_файл>
   Използва се речник за корекция на произношението (*.BXD, *.DIC или *.REX). Командния ред може да съдържа повече от една опция [-d].

-k
   Прекратява процесите на други копия на приложението в паметта на компютъра.

-ka
   Прекратява процеса на текущо зареденото в паметта на компютъра копие на конзолното приложение.

-pr
   Make pause or resume reading aloud by the active copy of the application. The action is the same as for the context menu item "Pause"/"Resume".

-q
   Добавя приложението в опашка. Конзолното приложение ще изчака докато другите копия на приложението приключат с работата си.

-lrc
   SAPI 4: Не се използва.
   SAPI 5 и Microsoft Speech Platform: Създава LRC файл, ако параметрите [-w] или [-o] са зададени.

-srt
   SAPI 4: Не се използва.
   SAPI 5 и Microsoft Speech Platform: Създава SRT файл, ако параметрите [-w] или [-o] са зададени.

-vs <име_на_файл>
   SAPI 4: Не се използва.
   SAPI 5 и Microsoft Speech Platform: Задава името на изходния текстов файл с виземи, ако опцията [-w] е указана.
   Визема е формата на устата, която съответства на конкретен речеви звук. SAPI поддържа списъка от 21 виземи.
   Този списък е базиран на оригиналните виземи създадени от Disney. Приложението ще създаде аудио файла и след това ще го прочете на глас, за да получи виземите и техните времеви кодове.
   Списъкът с поддържани от SAPI 5 виземи: https://msdn.microsoft.com/en-us/library/ms720881(v=vs.85).aspx

-sub
   Текстът ще бъде обработван като субтитри. Параметърът може да е полезен, когато са зададени параметрите [-i] или [-c].

-tray
   Показване на иконата на програмата в областта за уведомяване. Това ви позволява да следите напредъка на изпълняваната задача.
   Командата "Спри" в контекстното меню може да се използва за спиране на процеса.

-ln <целочислена_стойност>
   Избира ред от текстовия файл чрез номера на реда. Номерирането започва от "1".
   Интервалът от номера може да се използва за избиране на повече от един ред (например: "26-34").
   Командния ред може да съдържа повече от една опция [-ln].

-fr <целочислена стойност>
   SAPI 4: Не се използва.
   SAPI 5 и Microsoft Speech Platform: Задава изходната звукова честота в КХц (8, 11, 12, 16, 22, 24, 32, 44, 48).
   Ако опцията не е указана, Ще се използва стойността по подразбиране за избрания глас.

-bt <целочислена стойност>
   SAPI 4: Не се използва.
   SAPI 5 и Microsoft Speech Platform: Задава изходната дълбочина на звука в битове (8 или 16).
   Ако опцията не е указана, Ще се използва стойността по подразбиране за избрания глас.

-ch <целочислена стойност>
   SAPI 4: Не се използва.
   SAPI 5 и Microsoft Speech Platform: Задава броя на изходните звукови канали (1 или 2).
   Ако опцията не е указана, Ще се използва стойността по подразбиране за избрания глас.

-? или -h
   Извежда на екрана списъка с поддържаните опции за командния ред.

--encoding <кодиране> или -enc <кодиране>
   Задава кодирането на входния текст ("ansi", "utf8" или "unicode"). Кодирането по подразбиране е "ansi".

--silence-begin <целочислена_стойност> или -sb <целочислена_стойност>
   Задава времетраенето на тишината в началото на аудио файла (в милисекунди). По подразбиране е 0.

--silence-end <целочислена_стойност> или -se <целочислена_стойност>
   Задава времетраенето на тишината в края на аудио файла (в милисекунди). По подразбиране е 0.

--lrc-length <целочислена_стойност>
   Задава максималната дължина на редовете в LRC файла (в брой знаци).

--lrc-fname <име_на_файл>
   Задава името на LRC файла. Параметърът би бил полезен, когато е зададен параметъра [-o].

--lrc-enc <кодиране>
   Задава кодирането на LRC файла ("ansi", "utf8" или "unicode"). Кодирането по подразбиране е "ansi".

--lrc-offset <целочислена_стойност>
   Задава времевото отместване за LRC файла (в милисекунди).

--lrc-artist <текст>
   Задава ID тага за LRC файла: изпълнител.

--lrc-album <текст>
   Задава ID тага за LRC файла: албум.

--lrc-title <текст>
   Задава ID тага за LRC файла: заглавие.

--lrc-author <текст>
   Задава ID тага за LRC файла: автор.

--lrc-creator <текст>
   Задава ID тага за LRC файла: създател на LRC файла.

--lrc-sent
   Inserts blank lines after sentences in the LRC file.

--lrc-para
   Inserts blank lines after paragraphs in the LRC file.

--srt-length <целочислена_стойност>
   Задава максималната дължина на редовете в SRT файла (в брой знаци).

--srt-fname <име_на_файл>
   Задава името на SRT файла. Параметърът би бил полезен, когато е зададен параметъра [-o].

--srt-enc <кодиране>
   Задава кодирането на SRT файла ("ansi", "utf8" или "unicode"). Кодирането по подразбиране е "ansi".

--raw
   SAPI 4: Не се използва.
   SAPI 5 и Microsoft Speech Platform: Изходният аудио файл е в суров PCM формат; аудио данните не съдържат WAV заглавката. 
   Този параметър се използва в комбинация с параметъра [-o].

--ignore-length или -il
   SAPI 4: Не се използва.
   SAPI 5 и Microsoft Speech Platform: Пропуска определената дължина от данни в WAV заглавката. 
   Този параметър се използва в комбинация с параметъра [-o].

--sub-format <текст>
   Задава формата на субтитрите ("srt", "lrc", "ssa", "ass", "smi" или "vtt"). Ако параметърът не е зададен, форматът ще бъде определен чрез файловото разширение.

--sub-fit или -sf
   SAPI 4: Не се използва.
   SAPI 5 и Microsoft Speech Platform: Автоматично увеличава скоростта, за да съвпадне с времевите интервали на субтитрите (когато програмата конвертира субтитри в аудио файл).

--sub-max <целочислена_стойност> или -sm <целочислена_стойност>
   SAPI 4: Не се използва.
   SAPI 5 и Microsoft Speech Platform: Задава максималната скорост на речта в обхвата от -10 до 10 (когато програмата конвертира субтитри в аудио файл).

--delete-file или -df
   Премахва текстовия файл, когато задачата бъде завършена. Този параметър се използва в комбинация с параметъра [-f].

--ignore-square-brackets или -isb
   Ignore text in [square brackets].

--ignore-curly-brackets или -icb
   Ignore text in {curly brackets}.

--ignore-angle-brackets или -iab
   Ignore text in <angle brackets>.

--ignore-round-brackets или -irb
   Ignore text in (round brackets).

--ignore-url или -iu
   Ignore URLs.

--ignore-comments или -ic
   Ignore comments in text. Single-line comments start with // and continue until the end of the line. Multiline comments start with /* and end with */.

--voice1-name <име_на_гласа>
   SAPI 4: Не се използва.
   SAPI 5 и Microsoft Speech Platform: Sets the additional voice name to read foreign words in text (the part of the name will be enough).
   The option is used together with the option [--voice1-langid]. Other voices can be set by options [--voice2-name], [--voice3-name], etc.

--voice1-langid <идентификатор_на_езика>
   Sets the language ID for foreign words in text. The option is used together with the option [--voice1-name]. The command line may contain more than one option [--voice1-langid]. Also an option may contain a comma-separated list of IDs.
   The list of supported language IDs is based on ISO 639-1 codes: am, ar, az, ba, bg, be, ca, cs, cu, cv, da, de, el, en, es, et, eu, fi, fil, fr, ja, he, hi, hr, hu, hy, it, gn, gu, ka, kk-Cyr, kk-Lat, kn, ko, ky, lo, lt, lv, mk, no, pl, pt, ro, ru, sk, sl, sr-Cyr, sr-Lat, sv, tg, th, tr, tt, uk, zh.

--voice1-rate <целочислена_стойност>
   Sets the rate for the additional voice in a range of -10 to 10 (the default is 0).

--voice1-pitch <целочислена_стойност>
   Sets the pitch for the additional voice in a range of -10 to 10 (the default is 0).

--voice1-volume <целочислена_стойност>
   Sets the volume for the additional voice in a range of 0 to 100 (the default is 100).

--voice1-roman
   Use the default voice to read Roman numerals in text. If text with non-Latin characters contains Roman numerals, the application will not change a voice to read them. Например: XIX век, Елизабет II.

--voice1-digit
   Use the default voice to read numbers in text.

--voice1-length <целочислена_стойност>
   Set the minimal length of foreign text parts that will be read by the additional voice (in characters).


*** Примери ***

Създаване на файл с име VOICE.TXT, съдържащ списък с инсталираните гласове:

balcon -l > voice.txt


Преглед на характеристиките на гласа Microsoft Anna:

balcon -n "Microsoft Anna" -m


Конвертиране на текста от BOOK.TXT в реч и записване като BOOK.WAV:

balcon -f "d:\Text\book.txt" -w "d:\Sound\book.wav" -n "Emma"


Получаване на текста от клипборда, прилагане на правила за корекция на произношението и прочитане на глас:

balcon -n "Callie" -c -d "d:\rex\rules.rex" -d "d:\dic\rules.dic"


Прочитане на глас на текст от командния ред с указани скорост и сила на звука:

balcon -n "Irina" -t "Текстът ще бъде прочетен бавно." -s -5 -v 70


Прекратяване на процесите на други копия на приложението в паметта на компютъра:

balcon -k


Конвертиране на текст от STDIN в реч, записване като BOOK.WAV и създаване на BOOK.LRC:

balcon -f "d:\Text\book.txt" -w "d:\Sound\book.wav" -lrc --lrc-length 80 --lrc-title "The Lord of the Rings"


Read aloud English and Russian sentences by different voices:

balcon -f "d:\Text\book.txt" -n Kimberly --voice1-name Tatyana --voice1-langid ru


Конвертиране на субтитри във FILM.WAV:

balcon -f "d:\Text\film.srt" -w "d:\Sound\film.wav" -n "Laura" --sub-fit --sub-max 2


Пример за използване в комбинация с LAME.EXE:

balcon -f d:\book.txt -n Irina -o --raw | lame -r -s 22.05 -m m -h - d:\book.mp3


Пример за използване в комбинация с OGGENC2.EXE:

balcon -f d:\book.txt -n Irina -o -il | oggenc2 --ignorelength - -o d:\book.ogg


Пример за използване в комбинация с WMAENCODE.EXE:

balcon -f d:\book.txt -n Irina -o -il | wmaencode - d:\book.wma --ignorelength


*** Конфигурационен файл ***

Опциите за командния ред може да бъдат съхранени в конфигурационен файл с име "balcon.cfg" в същата папка, в която е и конзолното приложение.

Пример за конфигурационен файл:
===============
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
===============

Програмата може да използва комбинация от опции от конфигурационния файл и от командния ред.


*** Звукови клипове ***

Програмата позволява вмъкването на препратки към външни WAV и MP3 файлове (звукови клипове) в текста. Тагът за звуковите клипове, би изглеждал по следния начин:

{{Audio=C:\Sounds\ring.wav}}

При прочитането на текста на глас, програмата ще спре когато тагът за звуковия клип бъде достигнат, ще възпроизведе звуковия клип и ще поднови четенето на глас.
При конвертирането в аудио файлове, звуковият клип ще бъде вграден в създадения от програмата аудио файл.


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


*** Лиценз ***

You are free to use and distribute software for noncommercial purposes. For commercial use or distribution, you need to get permission from the copyright holder.

###