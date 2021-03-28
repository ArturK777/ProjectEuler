1215 CONSTANT BORDER  0 VALUE PRIMES  
0 VALUE #PAIRS  0 VALUE PAIRS[]  
285 VALUE #2PAIRS  0 VALUE 2PAIRS[]

: PRIME2?-  ( u -- ? )
   DUP S>D D>F FSQRT F>D D>S 2+
   3 ?DO DUP I MOD 0= IF DROP 0 UNLOOP EXIT THEN 2 +LOOP DROP -1 ;
: PRIME2?  ( u -- ? ) 
   DUP S>D D>F FSQRT F>D D>S 2+ SWAP  0
   BEGIN DUP CELLS PRIMES + @ DUP 3 PICK SWAP MOD 
   WHILE 3 PICK > IF 2DROP DROP -1 EXIT THEN 1+
   REPEAT 2DROP 2DROP 0 ;
: PRIME#  ( # -- adr last-prime )   2 \ fill list of # primes without 2 & 5
   OVER CELLS ALLOCATE THROW
   DUP 3 SWAP ! DUP 1 CELLS + 7 SWAP ! 7
   BEGIN  2+  DUP PRIME2?-
      IF DUP 2 PICK 4 PICK CELLS + !
         ROT 1+ -ROT
      THEN
      2SWAP 2DUP = >R 2SWAP R>
   UNTIL 2SWAP 2DROP ;
: 10^  ( i -- 10^i )   1 SWAP 0 ?DO 10 * LOOP ;
: LEN  ( u -- len )   0 BEGIN 1+ SWAP 10 / SWAP OVER 0= UNTIL NIP ;
: CONCAT2  ( u1 u2 -- u3 )   DUP LEN 10^ ROT * + ;
: @PRIME  ( i -- u )   CELLS PRIMES + @ ;
: @NTH  ( j i -- u )   2* + CELLS PAIRS[] + @ ;
: PADPRIME?  ( i j -- ? )   
   CELLS PAD + @ @PRIME SWAP
   CELLS PAD + @ @PRIME  2DUP CONCAT2 PRIME2? 
   IF SWAP CONCAT2 PRIME2? IF -1 EXIT THEN ELSE 2DROP THEN 0 ;
: FINDNEXT  ( i -- i' | 0 )   DUP 1 SWAP @NTH SWAP
   BEGIN 1+ DUP 0 SWAP @NTH 2 PICK > UNTIL NIP 
   DUP #PAIRS < 0= IF DROP 0 THEN ;
: 4CHK  ( -- ? )   0 2 PADPRIME? IF 0 3 PADPRIME? IF 1 2 PADPRIME? IF 1 3       PADPRIME? IF -1 EXIT THEN THEN THEN THEN 0 ;
: PAIRS  ( 0 | # -- # | adr )   
   DUP IF 2* CELLS ALLOCATE THROW 1 SWAP ELSE 0 THEN 
   BORDER 0 DO I CELLS PRIMES + @
      BORDER I 1+ ?DO DUP
         I CELLS PRIMES + @
         2DUP CONCAT2 PRIME2?
         ROT ROT SWAP
         CONCAT2 PRIME2? AND
         IF 2 PICK 
            IF 2 PICK 1-
               2 * CELLS 2 PICK +
               J OVER !
               I SWAP CELL+ !
               ROT 1+ ROT ROT
            ELSE
               SWAP 1+ SWAP 
            THEN
         THEN
      LOOP DROP
   LOOP NIP ;
: 2PAIRS  ( 0 | # -- # | adr )
   DUP IF 4 * CELLS ALLOCATE THROW DUP TO 2PAIRS[] -1 SWAP ELSE 0 THEN
   PAD 16 ERASE
   #PAIRS 0 DO
      0 I @NTH PAD !
      1 I @NTH PAD CELL+ !
      I FINDNEXT DUP
      IF #PAIRS SWAP
         ?DO
            0 I @NTH  PAD 2 CELLS + !
            1 I @NTH  PAD 3 CELLS + !
            4CHK IF OVER
               IF PAD OVER 16 CMOVE 4 CELLS +
               ELSE 1+
               THEN
            THEN
         LOOP
      ELSE DROP
      THEN
   LOOP NIP ;
: 5PRIME?  ( true -- ? )
   3 BEGIN 
      DUP 4 PADPRIME? 0= IF 2DROP 0 EXIT THEN 1- DUP 0<
   UNTIL DROP ;
: 5TH  ( -- )   
   0 #2PAIRS 1-
   DO 2PAIRS[] I 4 * CELLS + PAD 16 CMOVE
      BORDER 0 DO -1 I 4 0 
         DO PAD I CELLS + @ OVER = IF 2DROP 0. LEAVE THEN LOOP DROP
         IF I PAD 16 + !
            -1 5PRIME?
            IF 0 5 0 DO PAD I CELLS + @ @PRIME DUP . + LOOP 
               CR UNLOOP UNLOOP EXIT THEN  \ that's it
         THEN
      LOOP
   -1 +LOOP ;
: BRUT  ( -- )
   BORDER PRIME# ." Last prime: " . CR TO PRIMES
   0 PAIRS DUP TO #PAIRS DUP ." Pairs: " . CR PAIRS TO PAIRS[] 
   \ 0 2PAIRS DUP TO       
   #2PAIRS DUP ." 2Pairs: " . CR CR 2PAIRS DROP 5TH ;
BRUT .
: TEST[]  ( -- )   #PAIRS 0 
   DO I 3 .R 0 I @NTH DUP 4 .R 1 I @NTH DUP 4 .R 
      SWAP @PRIME 10 .R @PRIME 10 .R CR 
   LOOP ;
\EOF 13, 5197, 5701, 6733, 8389
BORDER=1215 #2PAIRS=285
BORDER=215 #2PAIRS=3

1. Made list of 1215 primes < 10000
2. Made 2-column table of indexes of primes that paired.
3. Check every pair to combine with remaining, write there index to another table.
4. Check every 2 pairs start from top with 5th prime 
Prime pair sets
Problem 60
The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and concatenating them in any order the result will always be prime. For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, represents the lowest sum for a set of four primes with this property.
Find the lowest sum for a set of five primes for which any two primes concatenate to produce another prime.
 3 7 109 229 !!!!!!!!!!!! 3 7 109 541 !!!!!!!!!!!! 3 7 109 673 !!!!!!!!!!!! 3 7 109 823


