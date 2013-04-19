# Sujet « La résistance » CodinGame de Javier 2013

Vous travaillez au musée de la Résistance nationale et vous venez d'exhumer des centaines de documents contenant des transmissions codées en Morse.

Le Morse est un codage composé de points et de traits représentant des lettres de l'alphabet. Voici la transciption d'un alphabet en Morse :

* A : `.-`
* B : `-...`
* C : `-.-.`
* D : `-..`
* E : `.`
* F : `..-.`
* G : `--.`
* H : `....`
* I : `..	`
* J : `.---`
* K : `-.-`
* L : `.-..`
* M : `--	`
* N : `-.`
* O : `---`
* P : `.--.`
* Q : `--.-	`
* R : `.-.`
* S : `...`
* T : `-`
* U : `..-`
* V : `...-`
* W : `.--`
* X : `-..-`
* Y : `-.--`
* Z : `--..`

Dans les documents, aucun espace n'a été retranscrit pour séparer les lettres et les mots qui se cachent derrière une séquence en Morse. Une séquence décodée peut donc avoir différentes interprétations.

Par exemple, la séquence `-....--.-.` peut aussi bien correspondre à BAC, BANN, DUC, DU TETE, ...

Un être humain est capable de reconnaître le découpage adéquat grâce à sa connaissance de la langue mais pour une machine c'est plus délicat. Pour que votre programme puisse faire l'équivalent vous avez à votre disposition un dictionnaire contenant un ensemble de mots corrects.

Cependant, même avec un dictionnaire, il est possible qu'une séquence puisse correspondre à plusieurs messages valides (BAC, DUC, DU et TETE pourraient être présents dans le dictionnaire de l'exemple précédent).

Votre programme devra déterminer le nombre de messages différents qu'il est possible d'obtenir à partir d'une séquence en Morse et d'un dictionnaire donné.

**ENTRÉE :**

    Ligne 1 : Une séquence Morse de longueur maximale L
    Ligne 2 : Un entier N correspondant au nombre de mots du dictionnaire
    Les N Lignes suivantes : Un mot du dictionnaire par ligne. Chaque mot a une longueur maximale M et n'apparait qu'une seule fois dans le dictionnaire.

**SORTIE :**

    Un entier R correspondant au nombre de messages qu'il est possible de générer à partir de la séquence en Morse et du dictionnaire.

**CONTRAINTES :**

    0 < L < 100000
    0 < N < 100000
    0 < M < 20
    0 <= R < 263

**EXEMPLE :**

    Entrée
    ......-...-..---.-----.-..-..-..
    5
    HELL
    HELLO
    OWORLD
    WORLD
    TEST

    Sortie
    2

Voici ce qu'il est attendu du programme :

* Mémoire RAM disponible : 256Mo
* Durée maximum d’exécution : 6 secondes
* Le programme doit lire les entrées depuis l’entrée standard
* Le programme doit écrire la réponse dans la sortie standard
* Le programme doit fonctionner dans l’environnement de test fourni
