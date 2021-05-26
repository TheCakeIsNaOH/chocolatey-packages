Balabolka (aplicación de consola), versión 1.78
Copyright (c) 2013-2021 Ilya Morozov
Todos los derechos reservados

WWW: http://balabolka.site/es/bconsole.htm
Correo electrónico: crossa@list.ru

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
   Establece el nombre del archivo de texto con la lista de archivos de entrada (un nombre de archivo por línea). La línea de comandos puede contener varias opciones [-fl].

-w <archivo de onda>
   Establece el nombre del archivo de salida en formato WAV. Si se especifica la opción, se creará un archivo de audio. De lo contrario, el texto será leído en voz alta.

-n <nombre_de_voz>
   Nombre de la voz (basta especificar una parte del nombre). Si no se especifica, se usará la voz seleccionada en el panel de control de Windows.

-id <entero>
   Establece el identificador de idioma (Locale ID) de la voz. El identificador de idioma es el código de idioma asignado por Microsoft
   (por ejemplo, "1033" o "0x0409" para "inglés - Estados Unidos", "3082" o "0x0C0A" para "español - alfabetización internacional").
   El programa escogerá de la lista la primera voz cuyo identificador de idioma coincida con el valor especificado.
   Si no se especifica el parámetro, se utilizará la voz, especificada con ayuda del parámetro [-n], o la voz seleccionada en el panel de control de Windows.
   Lista de identificadores de idioma: https://msdn.microsoft.com/en-us/library/cc233982.aspx

-m
   Muestra los parámetros de la voz.

-b <entero>
   Establece el dispositivo de salida de audio por su índice. El índice del dispositivo de audio predeterminado es 0.

-r <texto>
   Establece el dispositivo de salida de audio por su nombre.

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
   SAPI 5 y Microsoft Speech Platform: establece la velocidad de la voz en el rango de -10 a 10 (el valor predeterminado es 0).

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
   Pausa o reanuda la lectura en voz alta por parte de la copia activa de la aplicación. Es la misma acción que la del elemento del menú contextual "Pausa"/"Reanudar".

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
   SAPI 5 y Microsoft Speech Platform: establece el nombre del archivo de texto de salida con visemas, si se especifica la opción [-w].
   Un visema es la forma de la boca correspondiente a un sonido en particular al hablar. SAPI es compatible con la lista de 21 visemas.
   Esta lista está basada en los visemas originales de Disnei. La aplicación creará el archivo de audio y lo leerá en voz alta para obtener los visemas y sus códigos de tiempo.
   La lista de visemas compatibles con SAPI 5: https://msdn.microsoft.com/en-us/library/ms720881(v=vs.85).aspx

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
   SAPI 5 y Microsoft Speech Platform: establece la frecuencia de muestreo de la salida de audio en kHz (8, 11, 12, 16, 22, 24, 32, 44, 48).
   Si no se especifica la opción, se utilizará el valor predeterminado de la voz seleccionada.

-bt <entero>
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: establece la profundidad en bits del audio de salida (8 o 16).
   Si no se especifica la opción, se utilizará el valor predeterminado de la voz seleccionada.

-ch <entero>
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: establece el modo de canal del audio de salida (1 o 2).
   Si no se especifica la opción, se utilizará el valor predeterminado de la voz seleccionada.

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
   Inserta líneas en blanco después de las frases en el archivo LRC.

--lrc-para
   Inserta líneas en blanco después de los párrafos en el archivo LRC.

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
   SAPI 5 y Microsoft Speech Platform: no grabar la dimensión de los datos de audio en el encabezado del formato WAV. La opción se utiliza junto con la opción [-o].

--sub-format <texto>
   Establece el formato de subtítulos ("srt", "lrc", "ssa", "ass", "smi" o "vtt"). Si no se especifica la opción, el formato se definirá según la extensión del archivo.

--sub-fit o -sf
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: aumenta automáticamente la velocidad del habla para que se ajuste a los intervalos de tiempo, al convertir subtítulos en un archivo de audio.

--sub-max <entero> o -sm <entero>
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: ajusta la velocidad máxima del habla en la gama de -10 a 10 (para convertir los subtítulos en un archivo de audio).

--delete-file o -df
   Al terminar el trabajo, borra el archivo de texto. La opción se utiliza junto con la opción [-f].

--ignore-square-brackets o -isb
   Ignorar el texto entre [corchetes cuadrados].

--ignore-curly-brackets o -icb
  Ignorar el texto entre {llaves}.

--ignore-angle-brackets o -iab
  Ignora el texto entre <corchetes angulares>.

--ignore-round-brackets o -irb
   Ignorar texto entre (corchetes redondos).

--ignore-url o -iu
   Ignorar las URL.

--ignore-comments o -ic
   Omite los comentarios. Los comentarios de una sola línea comienzan con // y continúan hasta el final de la línea. Los comentarios de varias líneas comienzan con /* y terminan con */.

--voice1-name <nombre_de_voz>
   SAPI 4: la opción no se usa.
   SAPI 5 y Microsoft Speech Platform: establece el nombre de la voz adicional para leer palabras del texto en otros idiomas (bastará con parte del nombre).
   La opción se utiliza junto con la opción [--voice1-langid]. Pueden establecerse otras voces con las opciones [--voice2-name], [--voice3-name], etc.

--voice1-langid <ID_de_idioma>
   Establece el identificador de idioma para palabras del texto que estén en otros idiomas. La opción se utiliza junto con la opción [--voice1-name]. La línea de comandos puede contener más de una opción [--voice1-langid]. Además, una opción puede contener una lista de identificadores separados por comas.
   La lista de identificadores de idioma compatibles está basada en los códigos ISO 639-1: am, ar, az, ba, bg, be, ca, cs, cu, cv, da, de, el, en, es, et, eu, fi, fil, fr, ja, he, hi, hr, hu, hy, it, gn, gu, ka, kk-Cyr, kk-Lat, kn, ko, ky, lo, lt, lv, mk, no, pl, pt, ro, ru, sk, sl, sr-Cyr, sr-Lat, sv, tg, th, tr, tt, uk, zh.

--voice1-rate <entero>
  Ajusta la velocidad de la voz adicional en la gama de -10 a 10 (la predeterminada es 0).

--voice1-pitch <entero>
  Ajusta el tono de la voz adicional en la gama de -10 a 10 (el predeterminado es 0).

--voice1-volume <entero>
  Ajusta el volumen de la voz adicional en la gama de 0 a 100 (el predeterminado es 100).

--voice1-roman
   Para leer números romanos en el texto, utiliza la voz predeterminada. Si un texto con caracteres no latinos contiene números romanos, la aplicación no cambiará de voz para leerlos.

--voice1-digit
   Para leer números en el texto, utiliza la voz predeterminada.

--voice1-length <entero>
   Establece la longitud mínima de las partes de texto en otros idiomas que leerá la voz adicional (en caracteres).


*** Ejemplos ***

balcon -l

balcon -n "Microsoft Anna" -m

balcon -f "d:\Texto\libro.txt" -w "d:\Sonido\libro.wav" -n "Emma"

balcon -n "Callie" -c -d "d:\rex\reglas.rex" -d "d:\dic\reglas.dic"

balcon -n "Conchita" -t "El texto será leído lentamente." -s -5 -v 70

balcon -k

balcon -f "d:\Texto\libro.txt" -w "d:\Sonido\libro.wav" -lrc --lrc-length 80 --lrc-title "El Señor de los Anillos"

balcon -f "d:\Texto\film.srt" -w "d:\Sonido\film.wav" -n "Laura" --sub-fit --sub-max 2

balcon -f "d:\Texto\libro.txt" -n Diego --voice1-name Tatyana --voice1-langid ru


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
-d d:\Dicc\reglas.bxd
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


*** Etiqueta "Voice" ***

Si durante la lectura en voz alta fuera necesario cambiar la voz o sus propiedades, para SAPI 5 y Microsoft Speech Platform se puede usar una etiqueta especial (las voces SAPI 4 la ignorarán).

El formato de la etiqueta:

{{Voice=Nombre;Velocidad;Tono;Volumen}}

- Nombre: el nombre de alguna voz (basta con una palabra o parte de ésta);
- Velocidad: la velocidad de la voz (los valores van de -10 a 10);
- Tono: el tono de la voz (los valores van de -10 a 10);
- Volumen: el volumen (los valores van de 0 a 100).

La etiqueta se aplica a todo el texto que le siga. Los valores se separan por punto y comas. Por ejemplo:

Este texto lo leerá la voz de Balabolka predeterminada. {{Voice=Esperanza;0;0;100}} El otro texto lo leerá la voz Marta.

EL contenido de la etiqueta no distingue entre mayúsculas y minúsculas. Pueden omitirse los valores de algunas propiedades:

{{voice=enrique;;;50}}

{{Voice=Pablo;-1}}

{{Voice=Rosa}}

Para volver a la voz predeterminada, use esta etiqueta:

{{Voice=}}

Aviso: Es imposible cambiar entre voces SAPI 5 y voces de Microsoft Speech Platform.


*** Etiqueta "Pause" ***

Se puede insertar el número especificado de milisegundos de silencio en el archivo de audio de salida. Por ejemplo:

Ciento veinte milisegundos de silencio {{Pause=120}} acabaron de pasar.


*** Licencia ***

Es libre de utilizar y distribuir el software sin fines comerciales. Para uso o distribución con fines comerciales, tiene que obtener permiso del titular de los derechos de autor. La aplicación no se puede utilizar en el territorio de Belarús, Cuba, Irán, Corea del Norte, Syria ni en la Región de Crimea.

###
