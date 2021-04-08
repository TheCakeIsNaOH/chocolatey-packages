Balabolka (aplicación de consola), versión 1.75
Copyright (c) 2013-2021 Ilya Morozov
Todos los derechos reservados

WWW: http://balabolka.site/es/bconsole.htm
E-mail: crossa@list.ru

Licencia: Gratuito (Freeware)
Sistema operativo: Microsoft Windows XP/Vista/7/8/10
Microsoft Speech API: 4.0/5.0 y superiores
Microsoft Speech Platform: 11.0



*** Uso ***

balcon [opciones ...]


*** Opciones de la línea de comandos ***

-l
   Muestra la lista de voces disponibles.

-g
   Muestra la lista de dispositivos de salida de audio disponibles.

-f <archivo de texto>
   Establece el nombre del archivo de texto de entrada. La línea de comandos puede contener varias opciones [-f].

-fl <nombre_de_archivo>
   Sets the name of the text file with the list of input files (one file name per line). La línea de comandos puede contener varias opciones [-fl].

-w <archivo de onda>
   Establece el nombre del archivo de salida en formato WAV. Si se especifica la opción, se creará un archivo de audio. De lo contrario, el texto será leído en voz alta.

-n <nombre_de_voz>
   Nombre de la voz (basta especificar una parte del nombre). Si no se especifica, se usará la voz seleccionada en el panel de control de Windows.

-id <entero>
   Establece el identificador de idioma (Locale ID) de la voz. El identificador de idioma es el código de idioma asignado por Microsoft
   (por ejemplo, "1033" o "0x0409" para "inglés - Estados Unidos", "3082" o "0x0C0A" para "español - alfabetización internacional").
   El programa escogerá de la lista la primera voz cuyo identificador de idioma coincida con el valor especificado.
   Si el parámetro no está especificado, entonces se utilizará la voz, especificada con ayuda del parámetro [-n], o la voz seleccionada en el panel de control de Windows.
   Lista de identificadores de idioma: https://msdn.microsoft.com/en-us/library/cc233982.aspx

-m
   Muestra los parámetros de la voz.

-b <entero>
   Establece el dispositivo de salida de audio por su índice. El índice del dispositivo de audio predeterminado es 0.

-r <texto>
   Sets the audio output device by its name.

-c
   Toma como entrada el texto del portapapeles.

-t <texto>
   El texto de entrada se puede tomar de la línea de comandos. La línea de comandos puede contener varias opciones [-t].

-i
   Toma el texto de entrada de STDIN.

-o
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: escribe los datos sonoros en STDOUT. Si se especifica la opción, la opción [-w] se ignora.

-s <entero>
   SAPI 4: establece la velocidad de la voz en el rango de 0 a 100 (no hay valor predeterminado).
   SAPI 5 y Microsoft Speech Platform: configurar la velocidad de la voz en el rango de -10 a 10 (el valor predeterminado es 0).

-p <entero>
   SAPI 4: establece el tono de la voz en el rango de 0 a 100 (no hay valor predeterminado).
   SAPI 5 y Microsoft Speech Platform: establece el tono de la voz en el rango de -10 a 10 (el valor predeterminado es 0).

-v <entero>
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: establece el volumen en el rango de 0 a 100 (el valor predeterminado es 100).

-e <entero>
   Ajusta la longitud de las pausas entre frases (en milisegundos). El valor predeterminado es 0.

-a <entero>
   Ajusta la longitud de las pausas entre párrafos (en milisegundos). El valor predeterminado es 0.

-d <nombre_de_archivo>
   Usa un diccionario para la corrección de la pronunciación (*.BXD, *.DIC o *.REX). La línea de comandos puede contener varias opciones [-d].

-k
   Elimina otras copias de la aplicación de consola de la memoria del equipo.

-ka
   Elimina de la memoria del equipo la copia de la aplicación de consola activa.

-pr
   Make pause or resume reading aloud by the active copy of the application. The action is the same as for the context menu item "Pause"/"Resume".

-q
   Añade la aplicación a una cola. La aplicación de consola esperará hasta que otras copias del programa finalicen.

-lrc
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: Si se especifican las opciones [-w] u [-o], crea el archivo LRC.

-srt
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: Si se especifican las opciones [-w] u [-o], crea el archivo SRT.

-vs <nombre_de_archivo>
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: sets the name of output text file with visemes, if the option [-w] is specified.
   A viseme is the mouth shape that corresponds to a particular speech sound. SAPI supports the list of 21 visemes.
   This list is based on the original Disney visemes. The application will create the audio file and then read it aloud to get visemes and their timecodes.
   The list of visemes supported by SAPI 5: https://msdn.microsoft.com/en-us/library/ms720881(v=vs.85).aspx

-sub
   El texto se procesará como subtítulos. La opción puede ser útil al especificar las opciones [-i] o [-c].

-tray
   Muestra el icono del programa en la bandeja del sistema. Ello permite observar el progreso de la tarea.
   Puede utilizarse el elemento "Stop" del menú contextual para detener el proceso.

-ln <entero>
   Selecciona una línea del archivo de texto empleando un número de línea. La numeración de las líneas empieza por "1".
   Para seleccionar más de una línea se puede emplear el intervalo de números (por ejemplo, "26-34").
   La línea de comandos puede contener varias opciones [-ln].

-fr <entero>
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: sets the output audio sampling frequency in kHz (8, 11, 12, 16, 22, 24, 32, 44, 48).
   If the option is not specified, the default value of the selected voice will be used.

-bt <entero>
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: sets the output audio bit depth (8 o 16).
   If the option is not specified, the default value of the selected voice will be used.

-ch <entero>
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: sets the output audio channel mode (1 o 2).
   If the option is not specified, the default value of the selected voice will be used.

-? o -h
   Muestra la lista de opciones de línea de comandos disponibles.

--encoding <codificación> o -enc <codificación>
   Establece la codificación del texto de entrada ("ansi", "utf8" o "unicode"). El valor predeterminado es "ansi".

--silence-begin <entero> o -sb <entero>
   Ajusta la longitud del silencio al principio del archivo de audio (en milisegundos). El valor predeterminado es 0.

--silence-end <entero> o -se <entero>
   Ajusta la longitud del silencio al final del archivo de audio (en milisegundos). El valor predeterminado es 0.

--lrc-length <entero>
   Ajusta la longitud máxima de líneas para el archivo LRC (en caracteres).

--lrc-fname <nombre_de_fichero>
   Establece el nombre del archivo LRC. La opción puede ser útil cuando se especifica la opción [-o].

--lrc-enc <codificación>
   Establece la codificación del archivo LRC ("ansi", "utf8" o "unicode"). El valor predeterminado es "ansi".

--lrc-offset <entero>
   Ajusta el desplazamiento del tiempo para el archivo LRC (en milisegundos).

--lrc-artist <texto>
   Establece la etiqueta de ID para el archivo LRC: intérprete.

--lrc-album <texto>
   Establece la etiqueta de ID para el archivo LRC: álbum.

--lrc-title <texto>
   Establece la etiqueta de ID para el archivo LRC: título.

--lrc-author <texto>
   Establece la etiqueta de ID para el archivo LRC: autor.

--lrc-creator <texto>
   Establece la etiqueta de ID para el archivo LRC: creador del archivo LRC.

--lrc-sent
   Inserts blank lines after sentences in the LRC file.

--lrc-para
   Inserts blank lines after paragraphs in the LRC file.

--srt-length <entero>
   Ajusta la longitud máxima de líneas para el archivo SRT (en caracteres).

--srt-fname <nombre_de_fichero>
   Establece el nombre del archivo SRT. La opción puede ser útil cuando se especifica la opción [-o].

--srt-enc <codificación>
   Establece la codificación del archivo SRT ("ansi", "utf8" o "unicode"). El valor predeterminado es "ansi".

--raw
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: grabar los datos de audio en el formato RAW PCM; los datos no contienen el encabezado del formato WAV.
   La opción se utiliza junto con la opción [-o].

--ignore-length o -il
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: no grabar la dimensión de los datos de audio en el encabezado del formato WAV.
   La opción se utiliza junto con la opción [-o].

--sub-format <texto>
   Establece el formato de subtítulos ("srt", "lrc", "ssa", "ass", "smi" o "vtt"). Si no se especifica la opción, el formato se definirá acorde a la extensión del archivo.

--sub-fit o -sf
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: aumenta automáticamente la velocidad del habla para poder ajustarse en los intervalos de tiempo, especificados en los subtítulos.

--sub-max <entero> o -sm <entero>
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: ajusta la velocidad máxima del habla en la gama de -10 a 10 (para convertir los subtítulos en un fichero de audio).

--sub-sil <nombre_de_voz> o -sl <nombre_de_voz>
   SAPI 4 y Microsoft Speech Platform: la opción no se usa.
   SAPI 5: sets the voice name for silence tag reading during converting of subtitles (the part of the name will be enough). If an old voice is used to convert subtitles to speech, the created audio file may not contain pauses between text lines. To fix that problem, an additional modern voice can be used to read the silence tag.

--delete-file o -df
   Al terminar el trabajo, borra el archivo de texto. La opción se utiliza junto con la opción [-f].

--ignore-square-brackets o -isb
   Ignore text in [square brackets].

--ignore-curly-brackets o -icb
   Ignore text in {curly brackets}.

--ignore-angle-brackets o -iab
   Ignore text in <angle brackets>.

--ignore-round-brackets o -irb
   Ignore text in (round brackets).

--ignore-url o -iu
   Ignore URLs.

--ignore-comments o -ic
   Omite los comentarios. Los comentarios de una sola línea comienzan con // y continúan hasta el final de la línea. Los comentarios de varias líneas comienzan con /* y terminan con */.

--voice1-name <nombre_de_voz>
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: sets the additional voice name to read foreign words in text (the part of the name will be enough).
   The option is used together with the option [--voice1-langid]. Other voices can be set by options [--voice2-name], [--voice3-name], etc.

--voice1-langid <ID_de_idioma>
   Sets the language ID for foreign words in text. The option is used together with the option [--voice1-name]. The command line may contain more than one option [--voice1-langid]. Also an option may contain a comma-separated list of IDs.
   The list of supported language IDs is based on ISO 639-1 codes: am, ar, az, ba, bg, be, ca, cs, cu, cv, da, de, el, en, es, et, eu, fi, fil, fr, ja, he, hi, hr, hu, hy, it, gn, gu, ka, kk-Cyr, kk-Lat, kn, ko, ky, lo, lt, lv, mk, no, pl, pt, ro, ru, sk, sl, sr-Cyr, sr-Lat, sv, tg, th, tr, tt, uk, zh.

--voice1-rate <entero>
   Sets the rate for the additional voice in a range of -10 to 10 (the default is 0).

--voice1-pitch <entero>
   Sets the pitch for the additional voice in a range of -10 to 10 (the default is 0).

--voice1-volume <entero>
   Sets the volume for the additional voice in a range of 0 to 100 (the default is 100).

--voice1-roman
   Use the default voice to read Roman numerals in text. If text with non-Latin characters contains Roman numerals, the application will not change a voice to read them.

--voice1-digit
   Use the default voice to read numbers in text.

--voice1-length <entero>
   Set the minimal length of foreign text parts that will be read by the additional voice (in characters).


*** Ejemplos ***

balcon -l

balcon -n "Microsoft Anna" -m

balcon -f "d:\Texto\libro.txt" -w "d:\Sonido\libro.wav" -n "Emma"

balcon -n "Callie" -c -d "d:\rex\reglas.rex" -d "d:\dic\reglas.dic"

balcon -n "Conchita" -t "El texto será leído lentamente." -s -5 -v 70

balcon -k

balcon -f "d:\Texto\libro.txt" -w "d:\Sonido\libro.wav" -lrc --lrc-length 80 --lrc-title "El Señor de los Anillos"

balcon -f "d:\Texto\film.srt" -w "d:\Sonido\film.wav" -n "Laura" --sub-fit --sub-max 2

balcon -f "d:\Text\book.txt" -n Kimberly --voice1-name Tatyana --voice1-langid ru


Ejemplo de utilización de la aplicación junto con la utilidad LAME.EXE:

balcon -f d:\libro.txt -n Ines -o --raw | lame -r -s 22.05 -m m -h - d:\libro.mp3


Ejemplo de utilización de la aplicación junto con la utilidad OGGENC2.EXE:

balcon -f d:\libro.txt -n Ines -o -il | oggenc2 --ignorelength - -o d:\libro.ogg


Ejemplo de utilización de la aplicación junto con la utilidad WMAENCODE.EXE:

balcon -f d:\libro.txt -n Ines -o -il | wmaencode - d:\libro.wma --ignorelength


*** Archivo de configuración ***

Se puede guardar el archivo de configuración "balcon.cfg" en la misma carpeta que la aplicación de consola.

Un ejemplo del contenido del archivo:
===============
-f d:\Texto\libro.txt
-w d:\Sonido\libro.wav
-n Microsoft Anna
-s 2
-p -1
-v 95
-e 300
-d d:\Dict\reglas.bxd
-lrc
--lrc-length 75
--lrc-enc utf8
--lrc-offset 300
===============

El programa puede combinar opciones del archivo de configuración y de la línea de comandos.


*** Clips de audio ***

La aplicación permite insertar vínculos a archivos WAV externos (clips de audio) en el texto. La etiqueta de clip de audio será similar a esto:

{{Audio=C:\Sonidos\timbre.wav}}

Al leer el texto en voz alta, el programa se pausará cuando llegue a la etiqueta del clip de audio, reproducirá el clip de audio y seguirá hablando.
Al convertir en archivos de audio, el clip de audio se incrustará en el archivo de audio que cree la aplicación.


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


*** Licencia ***

Derecho al uso no comercial del programa:
- para las personas naturales: sin ningún tipo de restricciones;
- para las personas jurídicas: sujeto a las restricciones que figuran en el "Contrato de licencia" del software Balabolka.

El uso comercial del programa sólo se permite con previa autorización del titular de derechos de autor.

###