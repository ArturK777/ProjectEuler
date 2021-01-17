CREATE TEST 10 ALLOT
CREATE PATT 10 ALLOT
CREATE PROD 10 CELLS ALLOT
: -0?  ( n -- ? )   \ n free of zeroes ?
   BEGIN 10 /MOD 2DUP OR
   WHILE SWAP 0= IF DROP 0 EXIT THEN
   REPEAT 2DROP -1 ;
: UNIQ?  ( n -- ? )   \ check n for unique digits
   TEST 10 ERASE
   BEGIN 10 /MOD 2DUP OR
   WHILE SWAP  TEST + DUP C@ 
   IF 2DROP 0 EXIT ELSE 1 SWAP C! THEN
   REPEAT 2DROP -1 ;
: PEEK  ( n -- ? )   \ check n for pandigital
   BEGIN 10 /MOD 2DUP OR
   WHILE SWAP  PATT + C@
      IF DROP 0 EXIT THEN
   REPEAT  2DROP -1 ;
: CHECK  ( n -- ? )   \ full 3 checks
   DUP -0? SWAP DUP UNIQ? SWAP PEEK AND AND ;
: POKE  ( n -- )   \ write pattern
   BEGIN 10 /MOD 2DUP OR
   WHILE SWAP PATT + 1 SWAP C!
   REPEAT 2DROP ; 
: CHPATT  ( -- ? )   \ check for all 9 digits presents
   0 10 1 DO  I PATT + C@ +  LOOP  9 =  ;   
: BRUT  ( -- # )   0 99 1 
   DO PATT 10 ERASE
      I CHECK
      IF I POKE
         9999 I / 1+ I 1+ 2DUP > 
         IF
         DO
            I CHECK
            IF 
               I POKE 
               I J *
               DUP CHECK 
               IF DUP POKE CHPATT
                  IF  >R DUP CELLS PROD + SWAP 1+ SWAP R> SWAP !
                     J . ." x " I . ." = " I J * . CR   \ got what we need
                  ELSE DROP
                  THEN
               ELSE DROP 
               THEN 
            THEN
            PATT 10 ERASE J POKE
         LOOP
         ELSE UNLOOP 2DROP EXIT 
         THEN
      THEN 
   LOOP ;
: SUM-DUB  ( # -- sum )   \ sum without dubs
   DUP 0 DO
      PROD I CELLS + @
      DUP IF
         OVER I 1+
         ?DO DUP PROD I CELLS + @ 
         = IF 0 PROD I CELLS + ! THEN LOOP
      THEN DROP
   LOOP
   0 SWAP 0 DO
      PROD I CELLS + @ +
   LOOP ;

BRUT SUM-DUB .( Sum : ) .

\EOF 45228
Pandigital products
Problem 32
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
The product 7254 is unusual, as the identity, 39 * 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

Ìû áóäåì ãîâîðèòü, ÷òî n-çíà÷íîå ÷èñëî ÿâëÿåòñÿ ïàíöèôðîâûì, åñëè îíî èñïîëüçóåò âñå öèôðû îò 1 äî n ðîâíî îäèí ðàç; íàïðèìåð, ïÿòèçíà÷íîå ÷èñëî 15234 ïðåäñòàâëÿåò ñîáîé ïàíöèôðîâîå ÷èñëî îò 1 äî 5.
Ïðîèçâåäåíèå 7254 íåîáû÷íî, òàê êàê òîæäåñòâî 39 * 186 = 7254, ñîäåðæàùåå ìíîæèìîå, ìíîæèòåëü è ïðîèçâåäåíèå, ÿâëÿåòñÿ ïàíöèôðîâûì ÷èñëîì îò 1 äî 9.
Íàéäèòå ñóììó âñåõ ïðîèçâåäåíèé, ìíîæèìîå / ìíîæèòåëü / ïðîèçâåäåíèå êîòîðûõ ìîæíî çàïèñàòü â âèäå ïàíöèôðîâ îò 1 äî 9.
ÏÎÄÑÊÀÇÊÀ: íåêîòîðûå ïðîäóêòû ìîæíî ïîëó÷èòü íåñêîëüêèìè ñïîñîáàìè, ïîýòîìó îáÿçàòåëüíî âêëþ÷àéòå èõ òîëüêî îäèí ðàç â ñâîþ ñóììó.
