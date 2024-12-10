Balabolka (application console), version 1.86
Copyright (c) 2013-2024 Ilya Morozov
All Rights Reserved

WWW : https://www.cross-plus-a.com/fr/bconsole.htm
E-mail : crossa@list.ru

Licence : Freeware
Système d'exploitation : Microsoft Windows XP/Vista/7/8/10/11
Microsoft Speech API : v4.0/5.0 and above
Microsoft Speech Platform : v11.0



*** Ligne de commande ***

balcon [options ...]


*** Paramètres de ligne de commande ***

-l
   Affiche la liste des voix disponibles.

-g
   Affiche la liste des périphériques de sortie audio disponibles.

-f <nom_de_fichier>
   Spécifie le nom du fichier texte d'entrée. La ligne de commande peut contenir quelques options [-f].

-fl <nom_de_fichier>
   Ouvrir le fichier avec la liste des fichiers texte (un nom de fichier par ligne). La ligne de commande peut contenir quelques options [-fl].

-w <nom_de_fichier>
   Spécifie le nom du fichier de sortie au format WAV. Si l'option est spécifiée, un fichier audio sera créé. Dans le cas contraire, le texte sera lu à haute voix.

-n <nom_de_voix>
   Spécifie le nom de la voix (la partie du nom est suffisant). 
   Si le paramètre n'est pas spécifié, la voix définie par le paramètre [-id] ou la voix par défaut de Windows sera utilisée.

-id <nombre_intégral>
   Spécifier le code de langue pour la voix (Language ID). Language ID est le code de langue attribué par Microsoft
   (par exemple "1033" ou "0x0409" pour Anglais - États-Unis", "1036" ou "0x040C" pour "Français - France").
   Le logiciel choisit dans la liste de voix la première voix avec l'ID spécifié.
   Si le paramètre n'est pas spécifié, la voix définie par le paramètre [-n] ou la voix par défaut de Windows sera utilisée.
   La liste de pays avec leurs Locale ID : https://msdn.microsoft.com/en-us/library/cc233982.aspx

-m
   Affiche les paramètres de la voix.

-b <nombre_intégral>
   Spécifie le périphérique audio par son index. L'index de l'appareil audio utilisé par défaut est 0.

-r <texte>
   Spécifie le périphérique audio par son nom.

-c
   Utilise le texte du presse-papiers.

-t <ligne_de_texte>
   Utilise le texte de la ligne de commande. La ligne de commande peut contenir quelques options [-t].

-i
   Utilise le texte de flux d'entrée standard (STDIN).

-o
   SAPI 4 : l’option n’est pas utilisée.
   SAPI 5 et Microsoft Speech Platform : enregistre les données audio dans le flux de sortie standard (STDOUT) ; si l'option est spécifiée, l'option [-w] est ignorée.

-s <nombre_intégral>
   SAPI 4 : spécifie le débit de la parole compris entre 0 et 100 (pas de valeur par défaut).
   SAPI 5 et Microsoft Speech Platform : spécifie le débit de la parole compris entre -10 et 10 (la valeur par défaut est 0).

-p <nombre_intégral>
   SAPI 4 : spécifie le timbre de la voix compris entre 0 et 100 (pas de valeur par défaut).
   SAPI 5 et Microsoft Speech Platform : spécifie le timbre de la voix compris entre -10 et 10 (la valeur par défaut est 0).

-v <nombre_intégral>
   SAPI 4 : l’option n’est pas utilisée.
   SAPI 5 et Microsoft Speech Platform : spécifie le volume compris entre 0 et 100 (la valeur par défaut est 100).

-e <nombre_intégral>
   Spécifie la longueur des pauses entre les phrases (en millisecondes). La valeur par défaut est 0.

-a <nombre_intégral>
   Spécifie la longueur des pauses entre les paragraphes (en millisecondes). La valeur par défaut est 0.

-d <nom_de_fichier>
   Utilise un dictionnaire pour la correction de la prononciation (fichier *.BXD, *.DIC ou *.REX). La ligne de commande peut contenir quelques options [-d].

-k
   Désactive les autres copies de l'application console dans la mémoire de l'ordinateur.

-ka
   Désactiver la copie de l'application console en cours d'exécution.

-pr
   Mettre sur pause ou reprendre la lecture à voix haute par la copie de l’application en cours pour la console. L’action est la même que pour sélectionner un élément de menu "Pause"/"Reprendre".

-q
   Met l'application dans une file d'attente. L'application console va attendre que les autres copies du programme terminent leur opération.

-lrc
   SAPI 4 : l’option n’est pas utilisée.
   SAPI 5 et Microsoft Speech Platform : crée un fichier LRC, si l'option [-w] ou [-o] est spécifiée.

-srt
   SAPI 4 : l’option n’est pas utilisée.
   SAPI 5 et Microsoft Speech Platform : crée un fichier SRT, si l'option [-w] ou [-o] est spécifiée.

-vs <nom_de_fichier>
   SAPI 4 : l’option n’est pas utilisée.
   SAPI 5 et Microsoft Speech Platform : créer un fichier texte avec des visèmes, si le paramètre [-w] est donné.
   Un visème est la forme de la bouche qui correspond à un son de parole particulier. SAPI supporte la liste de 21 visèmes.
   Cette liste est basée sur les visèmes originaux de Disney. L’application console créera un fichier audio, puis le lira à haute voix pour obtenir des visèmes et leurs codes temporels.
   La liste des visèmes supportés par SAPI 5 : https://msdn.microsoft.com/en-us/library/ms720881(v=vs.85).aspx

-sub
   Le texte constitue des sous-titres et doit être converti en fichier audio, compte tenu des pauses spécifiées. Le paramètre peut être utile lorsque les options [-i] ou [-c] sont spécifiées en ligne de commande.

-tray
   Afficher l'icône du logiciel dans la zone de notification du système d'exploitation.
   Cela permet à l'utilisateur de suivre l'exécution d'une opération et de l'arrêter à l'aide de l'élément « Arrêt » dans le menu contextuel.

-ln <nombre_intégral>
   Sélectionner une ligne du fichier texte à l'aide de son numéro. La numérotation des lignes commence par "1".
   Pour sélectionner plusieurs lignes, spécifiez les numéros de la ligne de départ et de celle d'achèvement dans le texte (par exemple, "26–34").
   La ligne de commande peut contenir quelques options [-ln].

-fr <nombre_intégral>
   SAPI 4 : l’option n’est pas utilisée.
   SAPI 5 et Microsoft Speech Platform : sélectionner la fréquence d’échantillonnage audio de sortie en kHz (8, 11, 12, 16, 22, 24, 32, 44, 48).
   Si le paramètre n’est pas spécifié, la valeur par défaut de la voix sélectionnée sera utilisée.

-bt <nombre_intégral>
   SAPI 4 : l’option n’est pas utilisée.
   SAPI 5 et Microsoft Speech Platform : définir la profondeur de bits audio de sortie (8 ou 16).
   Si le paramètre n’est pas spécifié, la valeur par défaut de la voix sélectionnée sera utilisée.

-ch <nombre_intégral>
   SAPI 4 : l’option n’est pas utilisée.
   SAPI 5 et Microsoft Speech Platform : définir le mode du canal audio de sortie (1 ou 2).
   Si le paramètre n’est pas spécifié, la valeur par défaut de la voix sélectionnée sera utilisée.

-dp
   Afficher les informations sur l’avancement dans la fenêtre de console.

-cfg <file_name>
   Sets the name of the configuration file with the command line options (a text file where each line contains one option). If the option is not specified, the file "balcon.cfg" in the same folder as the utility will be used.

-h
   Affiche la liste des options de ligne de commande.

--encoding <encodage> ou -enc <encodage>
   L'encodage du texte de flux d'entrée standard ("ansi", "utf8" ou "unicode"). La valeur par défaut est "ansi".

--silence-begin <nombre_intégral> ou -sb <nombre_intégral>
   Spécifier la longueur de la pause en début du fichier audio (en millisecondes). La valeur par défaut est 0.

--silence-end <nombre_intégral> ou -se <nombre_intégral>
   Spécifier la longueur de la pause en fin du fichier audio (en millisecondes). La valeur par défaut est 0.

--lrc-length <nombre_intégral>
   Spécifie la longueur maximale des lignes de texte pour le fichier LRC (en caractères).

--lrc-fname <nom_de_fichier>
   Spécifie le nom du fichier LRC. L'option peut être utile lorsque l'option [-o] est spécifiée en ligne de commande.

--lrc-enc <encodage>
   Spécifie l'encodage pour le fichier LRC ("ansi", "utf8" ou "unicode"). La valeur par défaut est "ansi".

--lrc-offset <nombre_intégral>
   Spécifie le décalage temporel pour le fichier LRC (en millisecondes).

--lrc-artist <texte>
   Spécifie une balise ID pour le fichier LRC : artiste.

--lrc-album <texte>
   Spécifie une balise ID pour le fichier LRC : album.

--lrc-title <texte>
   Spécifie une balise ID pour le fichier LRC : titre.

--lrc-author <texte>
   Spécifie une balise ID pour le fichier LRC : auteur.

--lrc-creator <texte>
   Spécifie une balise ID pour le fichier LRC : créateur du fichier LRC.

--lrc-sent
   Insérer des lignes vides après les phrases dans le fichier LRC.

--lrc-para
   Insérer des lignes vides après les alinéas dans le fichier LRC.

--srt-length <nombre_intégral>
   Spécifie la longueur maximale des lignes de texte pour le fichier SRT (en caractères).

--srt-fname <nom_de_fichier>
   Spécifie le nom du fichier SRT. L'option peut être utile lorsque l'option [-o] est spécifiée en ligne de commande.

--srt-enc <encodage>
   Spécifie l'encodage pour le fichier SRT ("ansi", "utf8" ou "unicode"). La valeur par défaut est "ansi".

--raw
   SAPI 4 : l’option n’est pas utilisée.
   SAPI 5 et Microsoft Speech Platform : sortie des données audio comme fichiers PCM brut ; les données audio sont sans l'en-tête WAV.
   L'option est utilisée avec l'option [-o].

--ignore-length ou -il
   SAPI 4 : l’option n’est pas utilisée.
   SAPI 5 et Microsoft Speech Platform : omet la longueur des données audio dans l'en-tête WAV.
   L'option est utilisée avec l'option [-o].

--sub-format <texte>
   Le format des sous-titres ("srt", "lrc", "ssa", "ass", "smi" ou "vtt"). Si le paramètre n'est pas spécifié, le format est déterminé d'après l'extension du fichier des sous-titres.

--sub-fit ou -sf
   SAPI 4 : l’option n’est pas utilisée.
   SAPI 5 et Microsoft Speech Platform : augmenter automatiquement le débit de la parole pour s'adapter aux intervalles spécifiés dans les sous-titres. The application increments the speech rate value step by step, checking whether the text fits within the given time interval or not.

--sub-fit-lib ou -sfl
   SAPI 4 : l’option n’est pas utilisée.
   SAPI 5 et Microsoft Speech Platform : augmenter automatiquement le débit de la parole pour s'adapter aux intervalles spécifiés dans les sous-titres. The SoundTouch library will be used for changing tempo.

--sub-max <nombre_intégral> ou -sm <nombre_intégral>
   SAPI 4 : l’option n’est pas utilisée.
   SAPI 5 et Microsoft Speech Platform : spécifier le débit maximal de la parole dans une gamme de -10 à 10 (pour convertir des sous-titres en fichier audio). If SoundTouch library is used, the range must be from 110% to 200%.

--delete-file ou -df
   Supprimer le fichier texte après la lecture à haute voix ou enregistrer le fichier audio.

--ignore-square-brackets ou -isb
   Ignorer le texte entre [les crochets].

--ignore-curly-brackets ou -icb
   Ignorer le texte entre {les accolades}.

--ignore-angle-brackets ou -iab
   Ignorer le texte entre <les crochets angulaires>.

--ignore-round-brackets ou -irb
   Ignorer le texte entre (les parenthèses).

--ignore-url ou -iu
   Ignorer les adresses URL.

--ignore-comments ou -ic
   Ignorer les commentaires dans le texte. Les commentaires sur une seule ligne commencent par // et se poursuivent jusqu’à la fin de la ligne. Les commentaires multilignes commencent par /* et se terminent par */.

--voice1-name <nom_de_voix>
   SAPI 4 : l’option n’est pas utilisée.
   SAPI 5 et Microsoft Speech Platform : sélectionner une voix supplémentaire prévue pour lire des mots étrangers dans le corps du texte (il suffit d’indiquer une partie du nom de la voix). Le paramètre est utilisé conjointement avec le paramètre [--voice1-langid].
   Vous pouvez sélectionner plusieurs voix pour différentes langues à l’aide des paramètres [--voice2-name], [--voice3-name], etc.

--voice1-langid <identifiant_langue>
   Sélectionner un identifiant de langue pour la recherche des mots étrangers dans le texte. Le programme trouvera les lettres de la langue spécifiée dans le texte et ajoutera des balises de changement de voix pour lire ces caractères. Le paramètre est utilisé conjointement avec le paramètre [--voice1-name]. L’invite de commande peut contenir plusieurs paramètres [--voice1-langid]. On peut lister plusieurs identifiants, séparés par des virgules, au sein d’un même paramètre (par exemple : "fi,sv").
   La liste des identifiants de langue supportées par le programme (les codes des langues selon la norme ISO 639-1 sont utilisés) : am, ar, az, ba, bg, be, ca, cs, cu, cv, da, de, el, en, es, et, eu, fi, fil, fr, ja, he, hi, hr, hu, hy, it, gn, gu, ka, kk-Cyr, kk-Lat, kn, ko, ky, lo, lt, lv, mk, no, pl, pt, ro, ru, sk, sl, sr-Cyr, sr-Lat, sv, tg, th, tk, tr, tt, uk, zh.

--voice1-rate <nombre_intégral>
   Définir le débit de parole pour la voix supplémentaire dans une plage de -10 à 10 (la valeur par défaut est 0).

--voice1-pitch <nombre_intégral>
   Régler la hauteur de la voix supplémentaire dans une plage de -10 à 10 (la valeur par défaut est 0).

--voice1-volume <nombre_intégral>
   Régler le volume de la voix supplémentaire dans une plage de 0 à 100 (la valeur par défaut est 100).

--voice1-roman
   Utiliser la voix par défaut pour lire les chiffres romains. Si une voix supplémentaire est définie pour la lecture des lettres latines, le programme ne changera pas de voix pour lire des chiffres romains.

--voice1-digit
   Utiliser la voix par défaut pour lire des nombres composés de chiffres arabes. Si le paramètre n’est pas défini, les nombres seront lus par la voix supplémentaire s’ils côtoient des mots étrangers.

--voice1-length <nombre_intégral>
   Définir la longueur minimale du texte étranger pour la lecture duquel le programme utilisera une voix supplémentaire (en caractères).


*** Exemples ***

Créer un fichier texte avec une liste des voix installées sur l’ordinateur :

balcon -l


Afficher les caractéristiques de la voix Microsoft Anna :

balcon -n "Microsoft Anna" -m


Convertir le fichier texte BOOK.TXT en fichier audio BOOK.WAV :

balcon -f "d:\Text\book.txt" -w "d:\Sound\book.wav" -n "Emma"


Récupérer le texte du presse-papiers, appliquer les règles des dictionnaires de correction de prononciation et lire à haute voix :

balcon -n "Callie" -c -d "d:\rex\rules.rex" -d "d:\dic\rules.dic"


Lire le texte à partir de l’invite de commande à la vitesse et au volume spécifiés :

balcon -n "Mathieu" -t "Le texte sera lu lentement." -s -5 -v 70


Arrêter les autres instances de l’application console :

balcon -k


Convertir le texte de STDIN en fichier audio BOOK.WAV et créer un fichier BOOK.LRC :

balcon -w "d:\Sound\book.wav" -i -lrc --lrc-length 80 --lrc-title "The Lord of the Rings"


Convertir les sous-titres en fichier audio FILM.WAV :

balcon -f "d:\Text\film.srt" -w "d:\Sound\film.wav" -n Laura --sub-fit --sub-max 2

balcon -f "d:\Text\film.srt" -w "d:\Sound\film.wav" -n Laura --sub-fit-lib


Lire à haute voix des phrases en français et en russe par des voix différentes :

balcon -f "d:\Text\book.txt" -n Aurelie --voice1-name Tatyana --voice1-langid ru


Un exemple de l'utilisation de l'application avec l'utilitaire LAME.EXE :

balcon -f d:\book.txt -n Julie -o --raw | lame -r -s 22.05 -m m -h - d:\book.mp3


Un exemple de l'utilisation de l'application avec l'utilitaire OGGENC2.EXE :

balcon -f d:\book.txt -n Julie -o -il | oggenc2 --ignorelength - -o d:\book.ogg


Un exemple de l'utilisation de l'application avec l'utilitaire WMAENCODE.EXE :

balcon -f d:\book.txt -n Julie -o -il | wmaencode - d:\book.wma --ignorelength


*** Fichier de configuration ***

Les options de ligne de commande peuvent être enregistrées en tant que fichier de configuration « balcon.cfg » dans le même dossier que l'application console.

Exemple de fichier de configuration :
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

Le programme peut combiner les options du fichier de configuration et celles de la ligne de commande.


*** Clips audio ***

Le logiciel permet d'insérer des liens vers des fichiers audio externes au format WAV (clips audio) dans le texte. La balise de clip audio ressemblera à ceci :

{{Audio=C:\Sounds\ring.wav}}

Si un lien vers un clip audio survient lors de la lecture d’un texte à haute voix, le logiciel se met en pause, lit le clip audio et ensuite reprend la parole.
Lors de la conversion de la parole en fichier audio, le clip audio externe sera intégré dans le fichier audio créé par le logiciel.


*** "Voice" Tag ***

S’il faut modifier une voix ou ses attributs, une balise spéciale peut être utilisée pour SAPI 5 et Microsoft Speech Platform (les voix SAPI 4 ignoreront cette balise).

Format de la balise :

{{Voice=Nom;Vitesse;Hauteur;Volume}}

- Nom – nom de la voix (un mot ou même une partie d’un mot suffit) ;
- Vitesse – vitesse de lecture (la valeur doit être entre -10 et 10) ;
- Hauteur – hauteur du son (la valeur doit être entre -10 et 10) ;
- Volume – volume du son (la valeur doit être entre 0 et 100).

La balise s’applique à tout le texte suivant. Les valeurs des attributs sont séparées au sein d’une même balise par des points-virgules. Par exemple :

Le programme lira ce texte par la voix par défaut. {{Voice=Audrey;0;0;100}} La voix Audrey lira le reste du texte.

Le contenu de la balise ne dépend pas du registre des lettres. Les valeurs de certains attributs peuvent être omis :

{{voice=mathieu;;;50}}

{{Voice=Thomas;-1}}

{{Voice=Suzanne}}

Pour retourner à la voix par défaut choisie dans le programme, utilisez la balise ci-dessous :

{{Voice=}}

Attention ! Il est impossible de basculer entre les voix SAPI 5 et les voix de Microsoft Speech Platform à l’aide des balises.


*** "Pause" Tag ***

Lorsque le programme convertit un texte en fichier audio, on peut utiliser une balise pour insérer une pause. La durée de la pause doit être spécifiée en millisecondes.

Le silence durera deux secondes. {{Pause=2000}} Ensuite, la lecture reprendra.


*** Licence ***

Droits d'utilisation non commerciale de l’application :
- personnes physiques – sans restriction,
- personnes morales – avec les restrictions stipulées dans l'Accord de Licence du logiciel Balabolka.

L’utilisation commerciale du logiciel demande l'autorisation du détenteur du copyright.

###
