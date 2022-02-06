REQUIRE CONCAT ~micro/lib/str.f
9 DUP CONSTANT MAXLEN  2* CONSTANT MAPLEN
0 VALUE FileID  0 VALUE Words#  0 VALUE Words  0 VALUE RESULT
31623 DUP VALUE #Sqr  CELLS ALLOCATE THROW VALUE SQUARES
MAXLEN CELLS ALLOCATE THROW VALUE Sqr[]  \ square lenth bounds 
MAPLEN ALLOCATE THROW VALUE MAP
: SQRLST  ( -- )   \ gen sqrs list & mark len bounds
   100 2 SQUARES
   #Sqr 0 DO 
      I I * DUP >R OVER ! CELL+ R> 3 PICK < 0=
      IF OVER CELLS Sqr[] + I SWAP !  SWAP 1+ SWAP  ROT 10 * -ROT THEN
   LOOP DROP CELLS Sqr[] + #Sqr SWAP ! DROP ;
: SQR-BOUNDS  ( len -- end beg )   CELLS Sqr[] + DUP @ SWAP CELL - @ ;
: SWAP+  ( -- )   SWAP 1+ SWAP ;
: OPEN  ( $ -- )   SOURCE-NAME CUT-PATH 2SWAP CONCAT R/O OPEN-FILE THROW TO FileID ;
: PAD-SORT  ( # -- )   1- 0
   BEGIN >R PAD R@ + C@ PAD R@ + 1+ C@ 2DUP > 
      IF PAD R@ + C! PAD R@ + 1+ C! R> DUP 
         IF 1- THEN  
      ELSE 2DROP R> 1+ 
      THEN 2DUP = 
   UNTIL 2DROP ;
: NEXTWORD  ( -- u )   \ get next word from file to PAD, return len
   FileID FILE-POSITION 2DROP
   BEGIN PAD 1 FileID READ-FILE 2DROP  PAD C@ 34 = UNTIL 
   FileID FILE-POSITION 2DROP
   OVER - 1- DUP >R
   OVER S>D FileID REPOSITION-FILE THROW
   PAD SWAP FileID READ-FILE THROW
   + 2+ S>D FileID REPOSITION-FILE THROW
   R> ;
: SCANLIST  ( -- )   \ get # of words from file
   0. FileID REPOSITION-FILE THROW  FileID FILE-SIZE 2DROP
   0 BEGIN PAD 1 FileID READ-FILE 2DROP  
      FileID FILE-POSITION THROW D>S 2 PICK <  \ !EOF
   WHILE  NEXTWORD   DROP 1+  REPEAT TO Words# DROP ;
: READLIST  ( -- )   \ read list to Words & WordSort counted strings array
   0. FileID REPOSITION-FILE THROW  FileID FILE-SIZE 2DROP Words
   BEGIN PAD 1 FileID READ-FILE 2DROP  
      FileID FILE-POSITION THROW D>S 2 PICK <  \ !EOF
   WHILE  NEXTWORD  DUP >R OVER C! 1+ DUP PAD SWAP R@ CMOVE 15 +
      R@ PAD-SORT R@ OVER C! 1+ DUP PAD SWAP R> CMOVE 15 +
   REPEAT 2DROP ;
: GET-WORD  ( i 0|1 -- len )   \ get word from Words|WordSort to PAD, ret len
   SWAP 2* + 16 * Words + DUP C@ DUP ROT 1+ PAD ROT CMOVE ;
: ANA-FIND  ( i i' -- j | 0 )   \ find equal words in WordSort, i - origin, i' - start from
   OVER 1 GET-WORD  DUP >R PAD PAD 16 + ROT CMOVE
   BEGIN  DUP 1 GET-WORD R@ = 
      IF PAD R@ PAD 16 + R@
         COMPARE 0= IF NIP R> DROP EXIT THEN
      THEN  1+ DUP Words# >
   UNTIL  2DROP R> DROP 0 ;
: MAPKEY?  ( key len -- 0|value )   \ is map contains key ?
   0 DO I 2* MAP + C@ OVER = IF DROP I 2* 1+ MAP + C@ UNLOOP EXIT THEN LOOP DROP 0 ;
: MAPVAL?  ( value len -- ? )   \ is map contains value ?
   0 DO I 2* 1+ MAP + C@ OVER = IF DROP TRUE UNLOOP EXIT THEN LOOP DROP FALSE ;
: SQR?  ( u len -- 0|square )   SQR-BOUNDS DO SQUARES I CELLS + @ OVER = IF UNLOOP EXIT THEN LOOP DROP FALSE ;
: MATCH?  ( len square -- 0|square' )   \ find matched squares
      OVER 0 DO
         10 /MOD SWAP  2 PICK I - 1- PAD + C@  DUP 4 PICK
         MAPKEY?     \ repeated letter is found which doesn't match the square pattern
         ?DUP IF 2 PICK <> IF 2DROP 2DROP FALSE UNLOOP EXIT THEN
         ELSE 
            OVER 4 PICK MAPVAL?        \ value is already used
            IF 2DROP 2DROP FALSE UNLOOP EXIT THEN
         THEN
         MAP I 2* + C!       \ MAP.Add
         MAP I 2* 1+ + C!
      LOOP DROP 
      \ Check if the map can be used for word 2
      PAD 16 + C@ OVER MAPKEY? 0= IF 2DROP FALSE UNLOOP EXIT THEN
      0 OVER 0 DO 
         10 * PAD 16 + I + C@ 2 PICK MAPKEY? + 
      LOOP SWAP SQR? ;     
: SOLVE  ( len -- result )   
   0 SWAP
   DUP SQR-BOUNDS DO 
      MAP MAPLEN 255 FILL  \ erase map
      SQUARES I CELLS + @
      OVER SWAP MATCH?
      ?DUP IF  SQUARES I CELLS + @ MAX  ROT MAX SWAP THEN
   LOOP DROP ;
: ANAGRAMS  ( -- ) 0
   BEGIN DUP
      BEGIN 1+  2DUP ANA-FIND ?DUP 
         IF NIP
            2DUP SWAP . .
            OVER 0 GET-WORD PAD SWAP 2DUP TYPE SPACE 
            PAD 16 + SWAP CMOVE
            DUP 0 GET-WORD DUP PAD SWAP TYPE SPACE
            SOLVE DUP . CR 
            RESULT MAX TO RESULT
         THEN  DUP Words# >
       UNTIL DROP  1+ DUP Words# >
   UNTIL DROP ;
: MAIN ( -- )   
   SQRLST
   SCANLIST
   Words#  32 * ALLOCATE THROW TO Words   \ counted strings array of (sorted)words
   READLIST FileID CLOSE-FILE THROW 
   ANAGRAMS ;
S" p098_words.txt"  OPEN MAIN RESULT .

\EOF 18769
Anagramic squares
Problem 98
By replacing each of the letters in the word CARE with 1, 2, 9, and 6 respectively, we form a square number: 1296 = 36^2. What is remarkable is that, by using the same digital substitutions, the anagram, RACE, also forms a square number: 9216 = 96^2. We shall call CARE (and RACE) a square anagram word pair and specify further that leading zeroes are not permitted, neither may a different letter have the same digital value as another letter.
Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, find all the square anagram word pairs (a palindromic word is NOT considered to be an anagram of itself).
What is the largest square number formed by any member of such a pair?
NOTE: All anagrams formed must be contained in the given text file.

Анаграммы квадраты
Заменяя каждую букву в слове CARE на 1, 2, 9 и 6 соответственно, мы формируем квадратное число: 1296 = 36 ^ 2. Примечательно то, что при использовании тех же цифровых замен анаграмма RACE также образует квадратное число: 9216 = 96 ^ 2. Мы будем называть CARE (и RACE) квадратной парой слов анаграммы и дополнительно указывать, что ведущие нули недопустимы, равно как и другая буква не может иметь то же цифровое значение, что и другая буква.
Используя файл words.txt (щелкните правой кнопкой мыши и «Сохранить ссылку / цель как ...»), текстовый файл размером 16 КБ, содержащий почти две тысячи распространенных английских слов, найдите все пары квадратных слов анаграммы (слово-палиндром НЕ считается анаграмма самого себя).
Какое наибольшее квадратное число образует любой член такой пары?
ПРИМЕЧАНИЕ. Все сформированные анаграммы должны содержаться в данном текстовом файле.

: GET-WORD ( adr fid -- u )
   DUP FILE-POSITION THROW D>S  -ROT
   BEGIN 2DUP 1 SWAP 
   READ-FILE THROW DROP  OVER C@ 34 =  UNTIL 
   DUP FILE-POSITION
   THROW D>S 3 PICK - 1- >R
   ROT S>D ROT DUP >R REPOSITION-FILE THROW  2R>
   READ-FILE THROW  ;
   
   IF 16 * WordSort + DUP C@ DUP ROT 1+ PAD ROT CMOVE 
   ELSE 16 * Words + DUP C@ DUP ROT 1+ PAD ROT CMOVE 
   THEN
   
: SqrLst  ( #squares -- )   0 DO SQUARES I CELLS + @ . CR LOOP ;
   