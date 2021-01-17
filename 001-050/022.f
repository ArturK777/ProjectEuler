REQUIRE CONCAT ~micro\lib\str.f
0 VALUE #NAMES \ quantity  of name
0 VALUE /NAME  \ max len of name
: READ-BUF  ( -- a )   \ read list "p022_names.txt" to buffer
   SOURCE-NAME	CUT-PATH S" p022_names.txt" CONCAT
   R/O OPEN-FILE THROW
   DUP FILE-SIZE 2DROP
   DUP 8 + ALLOCATE ABORT" Can't allocate string buffer"
   DUP >R SWAP ROT DUP >R
   READ-LINE THROW 0= ABORT" Can't read list" 
   R> CLOSE-FILE THROW R> SWAP [CHAR] , SWAP 2 PICK + C! ;
: %DIM  ( a 0 0 -- a #' len' )   \ rec-scan list for # & max-len
   ROT DUP C@ 34 =
   IF ROT 1+ >R SWAP >R 0
      BEGIN 1+ SWAP 1+ DUP C@ 34 = >R SWAP R>
      UNTIL 1- R> MAX >R 2+ 2R>
      RECURSE
   ELSE DROP
   THEN ;
: GET-NAME  ( a-buf -- len a-buf' )   0 SWAP 
   BEGIN
      SWAP 1+ SWAP 1+ DUP C@ 34 =
   UNTIL DROP ;
: NAMESWAP  ( a -- a' )   /NAME 0 
   DO DUP /NAME - 2DUP I + C@ SWAP
      I + C@ 2 PICK I + C! ROT I + C!
      /NAME +
   LOOP ;
: %SORT  ( a-list # -- a-list # )
   DUP /NAME - /NAME 2 PICK /NAME
   COMPARE 0> 2 PICK AND
   IF  NAMESWAP  /NAME -  SWAP 1- SWAP
      RECURSE 
   ELSE 2DROP 
   THEN ;
: PARSE-BUF  ( a-buf # a-list -- a-list )   SWAP 0
   DO
      SWAP DUP  GET-NAME  SWAP 1+ 2 PICK I /NAME * +
      OVER >R ROT 1- DUP >R
      CMOVE 
      2R>  2 + + SWAP  DUP I I 
      IF /NAME * + I SWAP %SORT  ELSE 2DROP  THEN
   LOOP SWAP DROP ;
: CHAR-SUM ( a -- sum ) 0 /NAME 0
   DO
      OVER I + C@ DUP
      IF 64 - + ELSE  DROP THEN
   LOOP NIP ;
: COUNT-SUM  ( a-list -- a-list u )   0 #NAMES 0
   DO
      OVER I /NAME * +
      CHAR-SUM I 1+ * + 
   LOOP ;
: #DIM-SIZE  ( a-buf -- a-buf # a-list )
   DUP 0 0 %DIM
   2DUP SWAP DUP TO #NAMES CR ." Names found: " U. ." , Max lenght: "  U. CR
   DUP TO /NAME SWAP DUP >R * DUP >R
   ALLOCATE ABORT" Can't make array for names "
   DUP R> ERASE  R> SWAP ;  
: MAIN  ( -- a-list u )   READ-BUF #DIM-SIZE PARSE-BUF COUNT-SUM ;

MAIN .( Answer is : ) .

\EOF 871198282
Names scores
Problem 22
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 * 53 = 49714.
What is the total of all the name scores in the file?

Èñïîëüçóÿ names.txt, íà÷íèòå ñ ñîðòèðîâêè åãî â àëôàâèòíîì ïîðÿäêå. Çàòåì âû÷èñëèâ áóêâåííîå çíà÷åíèå äëÿ êàæäîãî èìåíè, óìíîæüòå ýòî çíà÷åíèå íà åãî ïîçèöèþ â àëôàâèòíîì ïîðÿäêå â ñïèñêå, ÷òîáû ïîëó÷èòü îöåíêó èìåíè.
Íàïðèìåð, êîãäà ñïèñîê îòñîðòèðîâàí â àëôàâèòíîì ïîðÿäêå, COLIN, êîòîðûé ñòîèò 3 + 15 + 12 + 9 + 14 = 53, ÿâëÿåòñÿ 938-ì èìåíåì â ñïèñêå. Èòàê, COLIN ïîëó÷èò 938 * 53 = 49714.
Êàêîâà ñóììà âñåõ îöåíîê èìåíè â ôàéëå?
