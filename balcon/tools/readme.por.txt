Balabolka (aplicativo de console), versão 1.78
Copyright (c) 2013-2021 Ilya Morozov
All Rights Reserved

WWW: http://balabolka.site/br/bconsole.htm
E-mail: crossa@list.ru

Licença: Freeware
Sistema operacional: Microsoft Windows XP/Vista/7/8/10
Microsoft Speech API: 4.0/5.0
Microsoft Speech Platform: 11.0



*** Linha de comando ***

balcon [opções ...]


*** Opções de comando ***

-l
   Mostrar a lista das vozes instaladas no seu computador.

-g
   Mostrar a lista dos dispositivos de áudio disponíveis.

-f <nome_do_arquivo>
   Abrir o arquivo de texto. A linha de comando pode conter várias opções [-f].

-fl <nome_do_arquivo>
   Sets the name of the text file with the list of input files (one file name per line). A linha de comando pode conter várias opções [-fl].

-w <nome_do_arquivo>
   Gravar um arquivo de áudio em formato WAV. Especificando a opção, será criado o arquivo de áudio. Se a opção não é especificada, o texto será lido em voz alta.

-n <nome_da_voz>
   Nome de voz (basta digitar uma parte do nome). No caso de não ser especificada, será usada a voz selecionada no painel de controlo do Windows.

-id <número>
   Selecione a voz artificial usando o identificador de língua (Locale ID). Esses identificadores estão atribuídos a todas as línguas pelos desenvolvedores da Microsoft
   (por exemplo, "1033" ou "0x0409" para inglês, "1046" ou "0x0416" para o português brasileiro).
   O programa vai selecionar a partir de uma lista a primeira voz, cujo identificador de língua corresponde a um valor especificado.
   Se a opção não for especificada, será usada a voz indicada pelo parámetro [-n], ou a voz selecionada no Painel de Controlo do Windows.
   Lista de identificadores: https://msdn.microsoft.com/en-us/library/cc233982.aspx

-m
   Mostrar parámetros para a voz selecionada.

-b <número>
   Escolher o dispositivo de áudio segundo o número na lista de dispositivos disponíveis para reprodução de áudio. O número padrão do dispositivo é 0.

-r <texto>
   Sets the audio output device by its name.

-c
   Usar o texto a partir da área de transferência.

-t <linha_de_texto>
   Usar o texto a partir da linha de comando. A linha de comando pode conter várias opções [-t].

-i
   Usar o texto a partir do fluxo de entrada padrão (STDIN).

-o
   SAPI 4: a opção não é usada.
   SAPI 5 e Microsoft Speech Platform: gravar dados de áudio para o fluxo de saída padrão (STDOUT); em caso de ser especificado, a opção [-w] é ignorada.

-s <número>
   SAPI 4: configurar a velocidade de fala na faixa de 0 a 100 (sem padrão).
   SAPI 5 e Microsoft Speech Platform: configurar velocidade de fala na faixa de -10 a 10 (o padrão é 0).

-p <número>
   SAPI 4: ajustar o tom da voz, na faixa de 0 a 100 (sem padrão).
   SAPI 5 e Microsoft Speech Platform: definir o tom de voz na faixa de -10 a 10 (o padrão é 0).

-v <número>
   SAPI 4: a opção não é usada.
   SAPI 5 e Microsoft Speech Platform: definir o volume na faixa de 0 a 100 (o padrão é 100).

-e <número>
   Ajustar o comprimento das pausas entre as frases (em milissegundos). O padrão é 0.

-a <número>
   Ajustar o comprimento das pausas entre os parágrafos (em milissegundos). O padrão é 0.

-d <nome_do_arquivo>
   Use o dicionário para a pronúncia correcta (arquivo com nextensão *.BXD, *.DIC ou *.REX). A linha de comando pode conter várias opções [-d].

-k
   Parar o funcionamento de outras cópias do aplicativo de console em execução no computador.

-ka
   Parar o funcionamento de um aplicativo de console que está activo no momento.

-pr
   Make pause or resume reading aloud by the active copy of the application. The action is the same as for the context menu item "Pause"/"Resume".

-q
   Adicionar o aplicativo para a fila. O aplicativo de console vai esperar até que as outras cópias do programa terminem de funcionar.

-lrc
   SAPI 4: a opção não é usada.
   SAPI 5 e Microsoft Speech Platform: criar um ficheiro do formato LRC, estando especificados os parámetros [-w] ou [-o].

-srt
   SAPI 4: a opção não é usada.
   SAPI 5 e Microsoft Speech Platform: criar um ficheiro do formato SRT, estando especificados os parámetros [-w] ou [-o].

-vs <nome_do_arquivo>
   SAPI 4: a opção não é usada.
   SAPI 5 e Microsoft Speech Platform: sets the name of output text file with visemes, if the option [-w] is specified.
   A viseme is the mouth shape that corresponds to a particular speech sound. SAPI supports the list of 21 visemes.
   This list is based on the original Disney visemes. The application will create the audio file and then read it aloud to get visemes and their timecodes.
   The list of visemes supported by SAPI 5: https://msdn.microsoft.com/en-us/library/ms720881(v=vs.85).aspx

-sub
   O texto representa subtítulos e deve ser convertido em um ficheiro áudio com os intervalos de tempo especificados.

-tray
   Mostrar o ícone do programa na área de notificação do sistema operacional.
   Isso permite que o usuário monitore o progresso da operação, bem como interromper o processo no menu de contexto, clicando em "Stop".

-ln <número>
   Selects a line from the text file by using of a line number. The line numbering starts at "1".
   The interval of numbers can be used for selecting of more than one line (for example, "26-34").
   A linha de comando pode conter várias opções [-ln].

-fr <número>
   SAPI 4: a opção não é usada.
   SAPI 5 e Microsoft Speech Platform: sets the output audio sampling frequency in kHz (8, 11, 12, 16, 22, 24, 32, 44, 48).
   If the option is not specified, the default value of the selected voice will be used.

-bt <número>
   SAPI 4: a opção não é usada.
   SAPI 5 e Microsoft Speech Platform: sets the output audio bit depth (8 ou 16).
   If the option is not specified, the default value of the selected voice will be used.

-ch <número>
   SAPI 4: a opção não é usada.
   SAPI 5 e Microsoft Speech Platform: sets the output audio channel mode (1 ou 2).
   If the option is not specified, the default value of the selected voice will be used.

-? ou -h
   Mostrar a descrição das opções da linha de comando.

--encoding <codificação> ou -enc <codificação>
   Codificação de texto a partir da entrada padrão ("ansi", "utf8" ou "unicode"). O valor padrão é "ansi".

--silence-begin <número> ou -sb <número>
   Especificar a duração da pausa no início do ficheiro áudio (em milissegundos). O padrão é 0.

--silence-end <número> ou -se <número>
   Especificar a duração da pausa no final de um ficheiro áudio (em milissegundos). O padrão é 0.

--lrc-length <número>
   Especificar o comprimento máximo de cordas para ficheiro de formato LRC (em caracteres).

--lrc-fname <nome_do_arquivo>
   Nome  de ficheiro  do formato  LRC. A opção pode ser útil em casos em que a linha de comando estiver definido o parámetro [-o].

--lrc-enc <codificação>
   Codificação de ficheiro do formato LRC ("ansi", "utf8" ou "unicode"). O valor padrão é "ansi".

--lrc-offset <número>
   Especificar a mudança da hora no ficheiro do formato LRC (em milissegundos).

--lrc-artist <texto>
   Etiqueta para ficheiro do formato LRC: intérprete da obra.

--lrc-album <texto>
   Etiqueta para ficheiro do formato LRC: álbum.

--lrc-title <texto>
   Etiqueta para ficheiro do formato LRC: título da obra.

--lrc-author <texto>
   Etiqueta para ficheiro do formato LRC: autor.

--lrc-creator <texto>
   Etiqueta para ficheiro do formato LRC: criador do ficheiro.

--lrc-sent
   Inserts blank lines after sentences in the LRC file.

--lrc-para
   Inserts blank lines after paragraphs in the LRC file.

--srt-length <número>
   Especificar o comprimento máximo de cordas para ficheiro de formato SRT (em caracteres).

--srt-fname <nome_do_arquivo>
   Nome  de ficheiro  do formato SRT. A opção pode ser útil em casos em que a linha de comando estiver definido o parámetro [-o].

--srt-enc <codificação>
   Codificação de ficheiro do formato SRT ("ansi", "utf8" ou "unicode"). O valor padrão é "ansi".

--raw
   SAPI 4: a opção não é usada.
   SAPI 5 e Microsoft Speech Platform: gravar áudio no formato PCM RAW;  os dados não contêm título do formato WAV. Esta opção é utilizada em conjunto com [-o].

--ignore-length ou -il
   SAPI 4: a opção não é usada.
   SAPI 5 e Microsoft Speech Platform: não inscrever o tamanho dos dados de áudio no título do formato WAV. Esta opção é utilizada em conjunto com [-o].

--sub-format <texto>
   Formato  dos subtítulos ("srt", "lrc", "ssa", "ass", "smi" ou "vtt"). Se não for especificado, o formato será determinado pela extensão do nome do ficheiro de subtítulos.

--sub-fit ou -sf
   SAPI 4: a opção não é usada.
   SAPI 5 e Microsoft Speech Platform: aumentar automaticamente a velocidade da fala, a fim de conseguir cumprir os intervalos definidos nos subtítulos.

--sub-max <número> ou -sm <número>
   SAPI 4: a opção não é usada.
   SAPI 5 e Microsoft Speech Platform: especificar a velocidade máxima de fala na faixa de -10 a 10 (para converter subtítulos em ficheiros de áudio).

--delete-file ou -df
   Eliminar um ficheiro de texto depois de ler em voz alta ou salvar o ficheiro de áudio.

--ignore-square-brackets ou -isb
   Ignore text in [square brackets].

--ignore-curly-brackets ou -icb
   Ignore text in {curly brackets}.

--ignore-angle-brackets ou -iab
   Ignore text in <angle brackets>.

--ignore-round-brackets ou -irb
   Ignore text in (round brackets).

--ignore-url ou -iu
   Ignore URLs.

--ignore-comments ou -ic
   Ignore comments in text. Single-line comments start with // and continue until the end of the line. Multiline comments start with /* and end with */.

--voice1-name <nome_da_voz>
   SAPI 4: a opção não é usada.
   SAPI 5 e Microsoft Speech Platform: sets the additional voice name to read foreign words in text (the part of the name will be enough).
   The option is used together with the option [--voice1-langid]. Other voices can be set by options [--voice2-name], [--voice3-name], etc.

--voice1-langid <ID_do_idioma>
   Sets the language ID for foreign words in text. The option is used together with the option [--voice1-name]. The command line may contain more than one option [--voice1-langid]. Also an option may contain a comma-separated list of IDs.
   The list of supported language IDs is based on ISO 639-1 codes: am, ar, az, ba, bg, be, ca, cs, cu, cv, da, de, el, en, es, et, eu, fi, fil, fr, ja, he, hi, hr, hu, hy, it, gn, gu, ka, kk-Cyr, kk-Lat, kn, ko, ky, lo, lt, lv, mk, no, pl, pt, ro, ru, sk, sl, sr-Cyr, sr-Lat, sv, tg, th, tr, tt, uk, zh.

--voice1-rate <número>
   Sets the rate for the additional voice in a range of -10 to 10 (the default is 0).

--voice1-pitch <número>
   Sets the pitch for the additional voice in a range of -10 to 10 (the default is 0).

--voice1-volume <número>
   Sets the volume for the additional voice in a range of 0 to 100 (the default is 100).

--voice1-roman
   Use the default voice to read Roman numerals in text. If text with non-Latin characters contains Roman numerals, the application will not change a voice to read them.

--voice1-digit
   Use the default voice to read numbers in text.

--voice1-length <número>
   Set the minimal length of foreign text parts that will be read by the additional voice (in characters).


*** Exemplos ***

balcon -l

balcon -n "Microsoft Anna" -m

balcon -f "d:\Text\book.txt" -w "d:\Sound\book.wav" -n "Emma"

balcon -n "Callie" -c -d "d:\rex\rules.rex" -d "d:\dic\rules.dic"

balcon -n "Ricardo" -t "O texto vai ser lido devagar." -s -5 -v 70

balcon -k

balcon -f "d:\Text\book.txt" -w "d:\Sound\book.wav" -lrc --lrc-length 80 --lrc-title "The Lord of the Rings"

balcon -f "d:\Text\film.srt" -w "d:\Sound\film.wav" -n "Laura" --sub-fit --sub-max 2

balcon -f "d:\Text\book.txt" -n Kimberly --voice1-name Tatyana --voice1-langid ru,be


Exemplo de uso do aplicativo em conjunto com o programa utilitário LAME.EXE:

balcon -f d:\book.txt -n Celia -o --raw | lame -r -s 22.05 -m m -h - d:\book.mp3


Exemplo de uso do aplicativo em conjunto com o programa utilitário OGGENC2.EXE:

balcon -f d:\book.txt -n Celia -o -il | oggenc2 --ignorelength - -o d:\book.ogg


Exemplo de uso do aplicativo em conjunto com o programa utilitário WMAENCODE.EXE:

balcon -f d:\book.txt -n Celia -o -il | wmaencode - d:\book.wma --ignorelength


*** Arquivo de configuração ***

É possível salvar o arquivo de configuração "balcon.cfg" na mesma pasta que o aplicativo de console.

Um exemplo do conteúdo do arquivo:
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

O programa pode combinar opções do arquivo de configuração e da linha de comando.


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


*** Licença ***

Direito ao uso não comercial do programa: 
- para pessoas singulares: sem restrições; 
- para pessoas jurídicas: sujeito às restrições contidas no "Contrato de licença" do software Balabolka. 

O uso comercial do programa só é permitido com a autorização prévia do detentor dos direitos autorais.

###