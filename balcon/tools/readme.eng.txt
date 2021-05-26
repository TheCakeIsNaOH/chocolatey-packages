Balabolka (Command Line Utility), version 1.78
Copyright (c) 2013-2021 Ilya Morozov
All Rights Reserved

WWW: http://balabolka.site/bconsole.htm
E-mail: crossa@list.ru

Licence: Freeware
Operating System: Microsoft Windows XP/Vista/7/8/10
Microsoft Speech API: v4.0/5.0 and above
Microsoft Speech Platform: v11.0



*** Usage ***

balcon [options ...]


*** Command Line Options ***

-l
   Prints the list of available voices.

-g
   Prints the list of available audio output devices.

-f <file_name>
   Sets the name of the input text file. The command line may contain few options [-f].

-fl <file_name>
   Sets the name of the text file with the list of input files (one file name per line). The command line may contain few options [-fl].

-w <file_name>
   Sets the name of the output file in WAV format. If the option is specified, an audio file will be created. Otherwise, text will be read aloud.

-n <voice_name>
   Sets the voice name (the part of the name will be enough). If the option is not specified, the voice, defined by the option [-id], or the default voice of Windows will be used.

-id <integer>
   Sets Locale ID for the voice. Locale ID is the language code, assigned by Microsoft (for example, "1033" or "0x0409" for "English - United States", "2057" or "0x0809" for "English - United Kingdom").
   The program will choose the first voice with specified Locale ID from the list of voices. If the option is not specified, the voice, defined by the option [-n], or the default voice of Windows will be used.
   The list of Locale IDs: https://msdn.microsoft.com/en-us/library/cc233982.aspx

-m
   Prints the parameters of the voice.

-b <integer>
   Sets the audio output device by its index. The index of the default audio device is 0.

-r <text>
   Sets the audio output device by its name.

-c
   Takes the text input from clipboard.

-t <text>
   Text input can be taken from the command line. The command line may contain few options [-t].

-i
   Takes the text input from STDIN.

-o
   SAPI 4: not used.
   SAPI 5 and Microsoft Speech Platform: writes sound data to STDOUT; if the option is specified, the option [-w] is ignored.

-s <integer>
   SAPI 4: sets the rate in a range of 0 to 100 (no default value).
   SAPI 5 and Microsoft Speech Platform: sets the rate in a range of -10 to 10 (the default is 0).

-p <integer>
   SAPI 4: sets the pitch in a range of 0 to 100 (no default value).
   SAPI 5 and Microsoft Speech Platform: sets the pitch in a range of -10 to 10 (the default is 0).

-v <integer>
   SAPI 4: not used.
   SAPI 5 and Microsoft Speech Platform: sets the volume in a range of 0 to 100 (the default is 100).

-e <integer>
   Sets the length of pauses between sentences (in milliseconds). The default is 0.

-a <integer>
   Sets the length of pauses between paragraphs (in milliseconds). The default is 0.

-d <file_name>
   Applies a dictionary for pronunciation correction (*.BXD, *.DIC or *.REX). The command line may contain few options [-d].
   You may use the desktop application 'Balabolka' to edit a dictionary.

-k
   Kills other copies of the application in the computer's memory.

-ka
   Kills the active copy of the application in the computer's memory.

-pr
   Make pause or resume reading aloud by the active copy of the application. The action is the same as for the context menu item "Pause"/"Resume".

-q
   Adds the application to a queue. The utility will wait until other copies of the application have finished.

-lrc
   SAPI 4: not used.
   SAPI 5 and Microsoft Speech Platform: creates the LRC file, if the option [-w] or [-o] is specified.

-srt
   SAPI 4: not used.
   SAPI 5 and Microsoft Speech Platform: creates the SRT file, if the option [-w] or [-o] is specified.

-vs <file_name>
   SAPI 4: not used.
   SAPI 5 and Microsoft Speech Platform: sets the name of output text file with visemes, if the option [-w] is specified.
   A viseme is the mouth shape that corresponds to a particular speech sound. SAPI supports the list of 21 visemes.
   This list is based on the original Disney visemes. The application will create the audio file and then read it aloud to get visemes and their timecodes.
   The list of visemes supported by SAPI 5: https://msdn.microsoft.com/en-us/library/ms720881(v=vs.85).aspx

-sub
   Input text will be processed as subtitles. The option may be useful, when the options [-i] or [-c] are specified.

-tray
   Show the application's icon in the system tray. This allows to view the progress of the task.
   The context menu item "Stop" can be used to stop the process.

-ln <integer>
   Selects a line from the text file by using of a line number. The line numbering starts at "1".
   The interval of numbers can be used for selecting of more than one line (for example, "26-34").
   The command line may contain more than one option [-ln].

-fr <integer>
   SAPI 4: not used.
   SAPI 5 and Microsoft Speech Platform: sets the output audio sampling frequency in kHz (8, 11, 12, 16, 22, 24, 32, 44, 48).
   If the option is not specified, the default value for the selected voice will be used.

-bt <integer>
   SAPI 4: not used.
   SAPI 5 and Microsoft Speech Platform: sets the output audio bit depth (8 or 16).
   If the option is not specified, the default value for the selected voice will be used.

-ch <integer>
   SAPI 4: not used.
   SAPI 5 and Microsoft Speech Platform: sets the output audio channel mode (1 or 2).
   If the option is not specified, the default value for the selected voice will be used.

-? or -h
   Prints the list of available command line options.

--encoding <encoding> or -enc <encoding>
   Sets the input text encoding ("ansi", "utf8" or "unicode"). The default is "ansi".

--silence-begin <integer> or -sb <integer>
   Sets the length of silence at the beginning of the audio file (in milliseconds). The default is 0.

--silence-end <integer> or -se <integer>
   Sets the length of silence at the end of the audio file (in milliseconds). The default is 0.

--lrc-length <integer>
   Sets the maximal length of text lines for the LRC file (in characters).

--lrc-fname <file_name>
   Sets the name of the LRC file that will be created. The option may be useful, when the option [-o] is specified.

--lrc-enc <encoding>
   Sets the encoding for the LRC file ("ansi", "utf8" or "unicode"). The default is "ansi".

--lrc-offset <integer>
   Sets the time shift for the LRC file (in milliseconds).

--lrc-artist <text>
   Sets the ID tag for the LRC file: artist.

--lrc-album <text>
   Sets the ID tag for the LRC file: album.

--lrc-title <text>
   Sets the ID tag for the LRC file: title.

--lrc-author <text>
   Sets the ID tag for the LRC file: author.

--lrc-creator <text>
   Sets the ID tag for the LRC file: creator of the LRC file.

--lrc-sent
   Inserts blank lines after sentences when creating the LRC file.

--lrc-para
   Inserts blank lines after paragraphs when creating the LRC file.

--srt-length <integer>
   Sets the maximal length of text lines for the SRT file (in characters).

--srt-fname <file_name>
   Sets the name of the SRT file. The option may be useful, when the option [-o] is specified.

--srt-enc <encoding>
   Sets the encoding for the SRT file ("ansi", "utf8" or "unicode"). The default is "ansi".

--raw
   SAPI 4: not used.
   SAPI 5 and Microsoft Speech Platform: output is raw PCM; audio data does not contain the WAV header.
   The option is used together with the option [-o].

--ignore-length or -il
   SAPI 4: not used.
   SAPI 5 and Microsoft Speech Platform: omits the length of data in the WAV header.
   The option is used together with the option [-o].

--sub-format <text>
   Sets the format of input subtitles ("srt", "lrc", "ssa", "ass", "smi" or "vtt"). If the option is not specified, the format will be determined through the file extension.

--sub-fit or -sf
   SAPI 4: not used.
   SAPI 5 and Microsoft Speech Platform: automatically increases the speed to fit time intervals (when the program converts subtitles to audio file).

--sub-max <integer> or -sm <integer>
   SAPI 4: not used.
   SAPI 5 and Microsoft Speech Platform: sets the maximal speed of speech in a range of -10 to 10 (when the program converts subtitles to audio file).

--delete-file or -df
   Removes the text file, when job is done. The option is used together with the option [-f].

--ignore-square-brackets or -isb
   Ignore text in [square brackets].

--ignore-curly-brackets or -icb
   Ignore text in {curly brackets}.

--ignore-angle-brackets or -iab
   Ignore text in <angle brackets>.

--ignore-round-brackets or -irb
   Ignore text in (round brackets).

--ignore-url or -iu
   Ignore URLs.

--ignore-comments or -ic
   Ignore comments in text. Single-line comments start with // and continue until the end of the line. Multiline comments start with /* and end with */.

--voice1-name <voice_name>
   SAPI 4: not used.
   SAPI 5 and Microsoft Speech Platform: sets the additional voice name to read foreign words in text (the part of the name will be enough).
   The option is used together with the option [--voice1-langid]. Other voices can be set by options [--voice2-name], [--voice3-name], etc.

--voice1-langid <language_id>
   Sets the language ID for foreign words in text. The option is used together with the option [--voice1-name]. The command line may contain more than one option [--voice1-langid]. Also an option may contain a comma-separated list of IDs.
   The list of supported language IDs is based on ISO 639-1 codes: am, ar, az, ba, bg, be, ca, cs, cu, cv, da, de, el, en, es, et, eu, fi, fil, fr, ja, he, hi, hr, hu, hy, it, gn, gu, ka, kk-Cyr, kk-Lat, kn, ko, ky, lo, lt, lv, mk, no, pl, pt, ro, ru, sk, sl, sr-Cyr, sr-Lat, sv, tg, th, tr, tt, uk, zh.

--voice1-rate <integer>
   Sets the rate for the additional voice in a range of -10 to 10 (the default is 0).

--voice1-pitch <integer>
   Sets the pitch for the additional voice in a range of -10 to 10 (the default is 0).

--voice1-volume <integer>
   Sets the volume for the additional voice in a range of 0 to 100 (the default is 100).

--voice1-roman
   Use the default voice to read Roman numerals in text. If text with non-Latin characters contains Roman numerals, the application will not change a voice to read them.

--voice1-digit
   Use the default voice to read numbers in text.

--voice1-length <integer>
   Set the minimal length of foreign text parts that will be read by the additional voice (in characters).


*** Examples ***

Create the text file VOICE.TXT with the list of the installed voices:

balcon -l > voice.txt


View the specifications of the Microsoft Anna voice:

balcon -n "Microsoft Anna" -m


Convert text from BOOK.TXT to speech and save as BOOK.WAV:

balcon -f "d:\Text\book.txt" -w "d:\Sound\book.wav" -n Emma


Get text from the clipboard, apply rules for the pronunciation correction and read aloud:

balcon -n Callie -c -d "d:\rex\rules.rex" -d "d:\dic\rules.dic"


Read aloud text from the command line with specified rate and volume:

balcon -n Emily -t "The text will be read slowly." -s -5 -v 70


Kill other copies of the application in the computer's memory:

balcon -k


Convert text from STDIN to speech, save as BOOK.WAV and create BOOK.LRC:

balcon -w "d:\book.wav" -i -lrc --lrc-length 80 --lrc-title "The Lord of the Rings"


Read aloud English, Russian and Belarusian sentences by different voices:

balcon -f "d:\Text\book.txt" -n Kimberly --voice1-name Tatyana --voice1-langid ru,be


Convert subtitles to FILM.WAV:

balcon -f "d:\Text\film.srt" -w "d:\Sound\film.wav" -n Laura --sub-fit --sub-max 2


The example of use together with LAME.EXE:

balcon -f d:\book.txt -n Heather -o --raw | lame -r -s 22.05 -m m -h - d:\book.mp3


The example of use together with OGGENC2.EXE:

balcon -f d:\book.txt -n Heather -o -il | oggenc2 --ignorelength - -o d:\book.ogg


The example of use together with WMAENCODE.EXE:

balcon -f d:\book.txt -n Heather -o -il | wmaencode - d:\book.wma --ignorelength


*** Configuration File ***

The command line options can be stored as a configuration file "balcon.cfg" in the same folder as the utility.

The sample configuration file:
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

The utility may combine options from the configuration file and the command line.


*** Audio Clips ***

The application allows to insert links to external WAV and MP3 files (audio clips) into text. Audio clip tag will look like:

{{Audio=C:\Sounds\ring.wav}}

When speaking text aloud, the utility will pause when the audio clip tag is reached, play the audio clip and resume speaking.
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


*** Licence ***

You are free to use and distribute software for noncommercial purposes. For commercial use or distribution, you need to get permission from the copyright holder. The application can not be used on the territory of Belarus, Cuba, Iran, North Korea, Syria, and the Crimea Region.

###