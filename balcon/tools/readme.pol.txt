Balabolka (aplikacja konsolowa), wersja 1.86
Copyright (c) 2013-2024 Ilya Morozov
Wszystkie prawa zastrzeżone

WWW: https://www.cross-plus-a.com/pl/bconsole.htm
E-mail: crossa@list.ru

Licenzja: Freeware
System operacyjny: Microsoft Windows XP/Vista/7/8/10/11
Microsoft Speech API: 4.0/5.0
Microsoft Speech Platform: 11.0



*** Wiersz poleceń ***

balcon [parametry ...]


*** Parametry wiersza poleceń ***

-l
   Pokazać listę głosów zainstalowanych na komputerze.

-g
   Pokazać listę dostępnych urządzeń audio.

-f <nazwa_pliku>
   Otworzyć plik tekstowy. Wiersz poleceń może zawierać kilka parametrów [-f].

-fl <nazwa_pliku>
   Sets the name of the text file with the list of input files (one file name per line). Wiersz poleceń może zawierać kilka parametrów [-fl].

-w <nazwa_pliku>
   Zapisać plik dźwiękowy w formacie WAV. Jeśli parametr jest ustawiony, plik dźwiękowy zostanie utworzony. Jeśli parametr nie jest ustawiony, tekst zostanie przeczytany na głos.

-n <nazwa_głosu>
   Wybrać głos (wystarczy podać część jego nazwy). Jeśli parametr nie jest ustawiony, będzie używany głos wybrany w Panelu sterowania systemu Windows.

-id <liczba>
   Wybrać głos komputerowy za pomocą identyfikatora języka (Language ID). Takie identyfikatory są przypisane wszystkim językom przez programistów Microsoft
   (np. "1045" lub "0x0415" - język polski, "1058" lub "0x0422" - język ukraiński).
   Program wybierze z listy pierwszy głos, identyfikator którego odpowiada określonej wartości.
   Jeśli ten parametr nie zostanie określony, będzie używany głos określony przez parametr [-n] lub wybrany w Panelu sterowania systemu Windows.
   Lista identyfikatorów: https://msdn.microsoft.com/en-us/library/cc233982.aspx

-m
   Pokazać parametry wybranego głosu.

-b <liczba>
   Wybrać urządzenie audio przez jego numer na liście dostępnych urządzeń do odtwarzania dźwięku. Numer urządzenia domyślnego dorówna 0.

-r <tekst>
   Sets the audio output device by its name.

-c
   Użyć tekstu ze schowka.

-t <tekst>
   Użyć tekstu z wiersza poleceń. Wiersz poleceń może zawierać kilka parametrów [-t].

-i
   Użyć tekstu z standarowego strumienia wejścia (STDIN).

-o
   SAPI 4: parametr nie jest używany.
   SAPI 5 i Microsoft Speech Platform: zapisać dżwięk do standarowego strumienia wyjścia (STDOUT); jeśli parametr jest ustawiony, parametr [-w] jest ignorowany.

-s <liczba>
   SAPI 4: ustawić prędkość mowy w zakresie od 0 do 100 (brak wartości domyślnych).
   SAPI 5 i Microsoft Speech Platform: ustawić prędkość mowy w zakresie od -10 do 10 (wartość domyślna dorówna 0).

-p <liczba>
   SAPI 4: ustawić ton mowy w zakresie od 0 do 100 (brak wartości domyślnych).
   SAPI 5 i Microsoft Speech Platform: ustawić ton mowy w zakresie od -10 do 10 (wartość domyślna dorówna 0).

-v <liczba>
   SAPI 4: parametr nie jest używany.
   SAPI 5 i Microsoft Speech Platform: ustawić głosność mowy w zakresie od 0 do 100 (wartość domyślna dorówna 100).

-e <liczba>
   Ustawić długość pauzy między zdaniami (milisekundy). Wartość domyślna dorówna 0.

-a <liczba>
   Ustawić długość pauzy między akapitami (milisekundy). Wartość domyślna dorówna 0.

-d <nazwa_pliku>
   Użyć słownika do korekty wymowy (plik z rozszerzeniem *.BXD, *.DIC lub *.REX). Wiersz poleceń może zawierać kilka parametrów [-d].

-k
   Zatrzymać prace innych egzemplarzy aplikacji konsolowej uruchomionych na komputerze.

-ka
   Kills the active copy of the console application in the computer's memory.

-pr
   Make pause or resume reading aloud by the active copy of the application. The action is the same as for the context menu item "Pause"/"Resume".

-q
   Dodać aplikację do kolejki. Aplikacja konsolowa będzie czekać, aż inne egzemplarzy programu skończą pracę.

-lrc
   SAPI 4: parametr nie jest używany.
   SAPI 5 i Microsoft Speech Platform: utworzyć plik LRC, jeśli ustawione parametry [-w] lub [-o].

-srt
   SAPI 4: parametr nie jest używany.
   SAPI 5 i Microsoft Speech Platform: utworzyć plik SRT, jeśli ustawione parametry [-w] lub [-o].

-vs <nazwa_pliku>
   SAPI 4: parametr nie jest używany.
   SAPI 5 i Microsoft Speech Platform: sets the name of output text file with visemes, if the option [-w] is specified.
   A viseme is the mouth shape that corresponds to a particular speech sound. SAPI supports the list of 21 visemes.
   This list is based on the original Disney visemes. The application will create the audio file and then read it aloud to get visemes and their timecodes.
   The list of visemes supported by SAPI 5: https://msdn.microsoft.com/en-us/library/ms720881(v=vs.85).aspx

-sub
   Tekst wygląda jak napisy do plików i musi być przekształcony w plik dźwiękowy z wrachowaniem określonych odstępów czasu.

-tray
   Pokazać ikonę programu w obszarze powiadomień systemu operacyjnego.
   To pozwoli użytkownikowi monitorować postęp operacji, oraz przerwać proces klikając "Stop" w menu kontekstowym.

-ln <liczba>
   Selects a line from the text file by using of a line number. The line numbering starts at "1".
   The interval of numbers can be used for selecting of more than one line (for example, "26-34").
   Wiersz poleceń może zawierać kilka parametrów [-ln].

-fr <liczba>
   SAPI 4: parametr nie jest używany.
   SAPI 5 i Microsoft Speech Platform: sets the output audio sampling frequency in kHz (8, 11, 12, 16, 22, 24, 32, 44, 48).
   If the option is not specified, the default value of the selected voice will be used.

-bt <liczba>
   SAPI 4: parametr nie jest używany.
   SAPI 5 i Microsoft Speech Platform: sets the output audio bit depth (8 lub 16).
   If the option is not specified, the default value of the selected voice will be used.

-ch <liczba>
   SAPI 4: parametr nie jest używany.
   SAPI 5 i Microsoft Speech Platform: sets the output audio channel mode (1 lub 2).
   If the option is not specified, the default value of the selected voice will be used.

-dp
   Display progress information in a console window.

-cfg <nazwa_pliku>
   Sets the name of the configuration file with the command line options (a text file where each line contains one option). If the option is not specified, the file "balcon.cfg" in the same folder as the utility will be used.

-h
   Pokazać opis parametrów wiersza poleceń.

--encoding <kodowanie> lub -enc <kodowanie>
   Kodowanie tekstu ze standardowego strumiena wejściowego ("ansi", "utf8" lub "unicode"). Jeśli opcja nie zostanie określona, program wykryje kodowanie tekstu.

--silence-begin <liczba> lub -sb <liczba>
   Ustawić długość pauzy na początku pliku dźwiękowego (w milisekundach). Wartość domyślna dorówna 0.

--silence-end <liczba> lub -se <liczba>
   Ustawić długość pauzy na końcu pliku dźwiękowego (w milisekundach). Wartość domyślna dorówna 0.

--lrc-length <liczba>
   Ustawić maksymalną długość wierszy plika LRC (symboli).

--lrc-fname <nazwa_pliku>
   Nazwa pliku LRC. Parametr może być przydatny gdy w wierszu poleceń ustawiony parametr [-o].

--lrc-enc <kodowanie>
   Kodowanie pliku LRC ("ansi", "utf8" lub "unicode"). Wartość domyślna dorówna "ansi".

--lrc-offset <liczba>
   Ustawić przesunięcie czasu dla pliku LRC (milisekundy).

--lrc-artist <tekst>
   Znacznik dla pliku LRC: wykonawca utworu.

--lrc-album <tekst>
   Znacznik dla pliku LRC: album.

--lrc-title <tekst>
   Znacznik dla pliku LRC: nazwa utworu.

--lrc-author <tekst>
   Znacznik dla pliku LRC: autor.

--lrc-creator <tekst>
   Znacznik dla pliku LRC: twórcą pliku.

--lrc-sent
   Inserts blank lines after sentences in the LRC file.

--lrc-para
   Inserts blank lines after paragraphs in the LRC file.

--srt-length <liczba>
   Ustawić maksymalną długość wierszy plika SRT (symboli).

--srt-fname <nazwa_pliku>
   Nazwa pliku SRT. Parametr może być przydatny gdy w wierszu poleceń ustawiony parametr [-o].

--srt-enc <kodowanie>
   Kodowanie pliku SRT ("ansi", "utf8" lub "unicode"). Wartość domyślna dorówna "ansi".

--raw
   SAPI 4: parametr nie jest używany.
   SAPI 5 i Microsoft Speech Platform: zapisać dżwiek w formacie RAW PCM; dane nie zawierają tytułu formatu WAV.
   Parametr wykorzystuję się razem z parametrem [-o].

--ignore-length lub -il
   SAPI 4: parametr nie jest używany.
   SAPI 5 i Microsoft Speech Platform: nie zapisywać rozmiar audio do tytułu formatu WAV. Parametr wykorzystuję się razem z parametrem [-o].

--sub-format <tekst>
   Format napisów filmowych ("srt", "lrc", "ssa", "ass", "smi" lub "vtt"). Jeśli parametr nie określony format zostanie wybrany przez rozszerzenie nazwy pliku napisów.

--sub-fit lub -sf
   SAPI 4: parametr nie jest używany.
   SAPI 5 i Microsoft Speech Platform: automatycznie zwiększać prędkość mowy aby zmieścić się w odstępy czasu określone w napisach. The application increments the speech rate value step by step, checking whether the text fits within the given time interval or not.

--sub-fit-lib lub -sfl
   SAPI 4: parametr nie jest używany.
   SAPI 5 i Microsoft Speech Platform: automatycznie zwiększać prędkość mowy aby zmieścić się w odstępy czasu określone w napisach. The SoundTouch library will be used for changing tempo.

--sub-max <liczba> lub -sm <liczba>
   SAPI 4: parametr nie jest używany.
   SAPI 5 i Microsoft Speech Platform: ustawić maksymalną prędkość mowy w zakresie od -10 do 10 (do konwersji napisów w pliki dźwiękowe). If SoundTouch library is used, the range must be from 110% to 200%.

--delete-file lub -df
   Usunąć plik tekstowy po zakończeniu czytania na głos lub zapisywania pliku dźwiękowego.

--ignore-square-brackets lub -isb
   Ignore text in [square brackets].

--ignore-curly-brackets lub -icb
   Ignore text in {curly brackets}.

--ignore-angle-brackets lub -iab
   Ignore text in <angle brackets>.

--ignore-round-brackets lub -irb
   Ignore text in (round brackets).

--ignore-url lub -iu
   Ignore URLs.

--ignore-comments lub -ic
   Ignore comments in text. Single-line comments start with // and continue until the end of the line. Multiline comments start with /* and end with */.

--voice1-name <nazwa_głosu>
   SAPI 4: parametr nie jest używany.
   SAPI 5 i Microsoft Speech Platform: sets the additional voice name to read foreign words in text (the part of the name will be enough).
   The option is used together with the option [--voice1-langid]. Other voices can be set by options [--voice2-name], [--voice3-name], etc.

--voice1-langid <identyfikator_języka>
   Sets the language ID for foreign words in text. The option is used together with the option [--voice1-name]. The command line may contain more than one option [--voice1-langid]. Also an option may contain a comma-separated list of IDs.
   The list of supported language IDs is based on ISO 639-1 codes: am, ar, az, ba, bg, be, ca, cs, cu, cv, da, de, el, en, es, et, eu, fi, fil, fr, ja, he, hi, hr, hu, hy, it, gn, gu, ka, kk-Cyr, kk-Lat, kn, ko, ky, lo, lt, lv, mk, no, pl, pt, ro, ru, sk, sl, sr-Cyr, sr-Lat, sv, tg, th, tk, tr, tt, uk, zh.

--voice1-rate <liczba>
   Sets the rate for the additional voice in a range of -10 to 10 (the default is 0).

--voice1-pitch <liczba>
   Sets the pitch for the additional voice in a range of -10 to 10 (the default is 0).

--voice1-volume <liczba>
   Sets the volume for the additional voice in a range of 0 to 100 (the default is 100).

--voice1-roman
   Use the default voice to read Roman numerals in text. If text with non-Latin characters contains Roman numerals, the application will not change a voice to read them.

--voice1-digit
   Use the default voice to read numbers in text.

--voice1-length <liczba>
   Set the minimal length of foreign text parts that will be read by the additional voice (in characters).


*** Przykłady ***

balcon -l

balcon -n "Microsoft Anna" -m

balcon -f "d:\Text\book.txt" -w "d:\Sound\book.wav" -n "Emma"

balcon -n "Callie" -c -d "d:\rex\rules.rex" -d "d:\dic\rules.dic"

balcon -n "Ewa" -t "Tekst będzie czytany wolno." -s -5 -v 70

balcon -k

balcon -f "d:\Text\book.txt" -w "d:\Sound\book.wav" -lrc --lrc-length 80 --lrc-title "The Lord of the Rings"

balcon -f "d:\Text\film.srt" -w "d:\Sound\film.wav" -n "Laura" --sub-fit --sub-max 2

balcon -f "d:\Text\film.srt" -w "d:\Sound\film.wav" -n Laura --sub-fit-lib

balcon -f "d:\Text\book.txt" -n Kimberly --voice1-name Tatyana --voice1-langid ru


Przykład wykorzystania aplikacji razem z oprogramowaniem narzędziowym LAME.EXE:

balcon -f d:\book.txt -n Heather -o --raw | lame -r -s 22.05 -m m -h - d:\book.mp3


Przykład wykorzystania aplikacji razem z oprogramowaniem narzędziowym OGGENC2.EXE:

balcon -f d:\book.txt -n Heather -o -il | oggenc2 --ignorelength - -o d:\book.ogg


Przykład wykorzystania aplikacji razem z oprogramowaniem narzędziowym WMAENCODE.EXE:

balcon -f d:\book.txt -n Heather -o -il | wmaencode - d:\book.wma --ignorelength


*** Plik konfiguracyjny ***

Parametry można zachować jak plik konfiguracyjny "balcon.cfg" w tym samym folderze co aplikacja konsolowa.

Przykład zawartości pliku:
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

Program może kombinować parametry z pliku konfiguracyjnego i wiersza poleceń.


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


*** Licencja ***

Prawo do użytku niekomercyjnego: 
- dla osób fizycznych - bez ograniczeń;
- dla osób prawnych - z zastrzeżeniem ograniczeń, co określa "Umowa licencyjna" programu Balabolka.

Użytek komercyjny dozwolony jedynie za wcześniejszą zgodą posiadacza praw autorskich.

###
