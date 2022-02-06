\ PAD : adr_of_primes  +1 CELLS: adr_of_^2  +2: adr_of_^3  +3: adr_of_^4
\ +4 : count_of_primes = count_of_^2  +5 : count_of_^3  +6 : count_of_^4
HEX  CREATE BIN-TBL 08040201 , 80402010 ,  DECIMAL
: 2^   ( u -- 2^u )   BIN-TBL + C@ ;
: GETB  ( adr i -- bit-nonzero )   8 /MOD ROT + C@ SWAP 2^ AND ;
: ESIEVE  ( border -- adr # )
   1+ DUP 8 / 1+ ALLOCATE THROW
   2 BEGIN OVER OVER GETB 0=
      IF DUP 2DUP * 4 PICK SWAP 
         DO I 8 /MOD 4 PICK + DUP C@ ROT 2^ OR SWAP C! DUP +LOOP DROP
      THEN DUP DUP * 3 PICK < 
   WHILE 1+ REPEAT DROP
   HERE SWAP 0 3 ROLL 2 DO OVER I GETB 0= IF 1+ I , THEN LOOP NIP ;
: SQRT  ( n -- sqrt^n )   \ int SQRT { FD-V12N1 }
   1 15 0 DO 2DUP / + 2/ LOOP NIP ;
: INIT234  ( border -- border )   
   PAD 16 + @ 
   IF PAD @ PAD 16 + @
   ELSE
      DUP SQRT ESIEVE DUP PAD 16 + !
      OVER PAD ! CELLS DUP
      ALLOCATE THROW DUP PAD 4 + ! OVER ERASE DUP
      ALLOCATE THROW DUP PAD 8 + ! OVER ERASE DUP
      ALLOCATE THROW DUP PAD 12 + ! OVER ERASE
      -1 PAD 20 + !  -1 PAD 24 + !  \ init 3 & 4 power counters
   THEN 0
   DO DUP I + @ DUP
      * DUP PAD 4 + @ I + !
      PAD 20 + @ 0< 
      IF OVER I + @ * DUP 3 PICK < 
         IF DUP PAD 8 + @ I + !
            -1 PAD 20 + +!
            PAD 24 + @ 0< 
            IF OVER I + @ * DUP 3 PICK < 
               IF PAD 12 + @ I + ! -1 PAD 24 + +!
               ELSE DROP PAD 24 + DUP @ INVERT SWAP !
               THEN
            ELSE DROP
            THEN
         ELSE DROP PAD 20 + DUP @ INVERT SWAP !
         THEN
      ELSE DROP THEN
   CELL +LOOP DROP
   PAD 24 + DUP @ DUP 0< IF INVERT SWAP ! ELSE 2DROP THEN ;
: GET^  ( i ^j -- u )   CELLS PAD + @ SWAP CELLS + @ ;
: PUT^  ( adr # u -- adr #' )   \ sorted list
   0 2OVER ROT
   ?DO 2DUP @ > 
      IF CELL+
      ELSE 2DUP @ =
         IF 2DROP 0 
         ELSE DUP DUP CELL+ 4 PICK I - CELLS CMOVE> 
         THEN LEAVE
      THEN
   LOOP 
   DUP IF ! 1+ ELSE DROP THEN ;   
: SUM^  ( border -- # )   1200000 CELLS ALLOCATE THROW 0
   PAD 24 + @ 0
   DO I 3 GET^ 
      PAD 20 + @ 0
      DO PAD 16 + @ 0
         DO DUP J 2 GET^ I 1 GET^ + +
            DUP 5 PICK < 
            IF SWAP >R PUT^ R> ELSE DROP LEAVE THEN 
         LOOP
      LOOP DROP DUP . CR
   LOOP CR ;
: PRINT^  ( adr # -- )
   0 DO DUP @ 12 .R CELL+ LOOP ; 
50000000 INIT234 SUM^ DUP . \ PRINT^

\EOF 1097343
: PPRINT  ( adr # -- )   DUP ." Found primes: " . CR CR 0 DO DUP @ 8 .R CELL+ LOOP DROP ;
: PUT^  ( adr # u -- adr #' )   
   0 2OVER ROT
   ?DO DUP @ 2 PICK =
      IF 2DROP 0 LEAVE THEN
      CELL+
   LOOP DUP IF ! 1+ ELSE DROP THEN ;   
   
CMOVE>  ( c-addr1 c-addr2 u -- )

  If u is greater than zero, copy u consecutive characters from the data
  space starting at c-addr1 to that starting at c-addr2, proceeding
  character-by-character from higher addresses to lower addresses.

: PUT=  ( u # adr -- #' )
   OVER IF
      OVER CELLS OVER + SWAP
      DO OVER I @
      = 
         IF 0 LEAVE THEN
      CELL +LOOP
      DUP IF
         SWAP OVER CELLS 4 PICK + ! 1+
      ELSE 
      DROP NIP
      THEN
   ELSE ROT SWAP ! 1+
   THEN ;
: PUT  ( u # adr -- #' )
   OVER IF
      OVER CELLS OVER + SWAP
      DO OVER I @
      = 
         IF 0 LEAVE THEN
      CELL +LOOP
      DUP IF
         SWAP OVER CELLS 4 PICK + ! 1+
      ELSE 
      DROP NIP
      THEN
   ELSE ROT SWAP ! 1+
   THEN ;
: DELDUB  ( adr # -- #' )   
   2DUP CELLS OVER + DUP ROT 1 ^
   DO DUP I CELL+ I @ DUP
      IF -ROT 2DUP <> IF
         DO DUP I @
            =
            IF ROT 1- -ROT 0 I !  66 ^ 
            THEN
         CELL +LOOP THEN DROP
      ELSE
         2DROP DROP 
      THEN   
   CELL +LOOP DROP 2DROP NIP ;
: CHKP  ( adr -- )  PAD 16 + @ 0 
   DO 
      I 8 .R
      PAD @ I CELLS + @ 12 .R
      PAD 4 + @ I CELLS + @ 12 .R
      PAD 20 + @ I > IF 
         PAD 8 + @ I CELLS + @ 12 .R
         PAD 24 + @ I > IF 
            PAD 12 + @ I CELLS + @ 12 .R
         THEN
      THEN
      CR
   LOOP ;

\ 7071 ESIEVE  PPRINT
Prime power triples
Problem 87
The smallest number expressible as the sum of a prime square, prime cube, and prime fourth power is 28. In fact, there are exactly four numbers below fifty that can be expressed in such a way:
28 = 2^2 + 2^3 + 2^4
33 = 3^2 + 2^3 + 2^4
49 = 5^2 + 2^3 + 2^4
47 = 2^2 + 3^3 + 2^4
How many numbers below fifty million can be expressed as the sum of a prime square, prime cube, and prime fourth power?

Ïðàéì ìîùíîñòü óòðîèòñÿ
Íàèìåíüøåå ÷èñëî, âûðàæàåìîå ñóììîé êâàäðàòà ïðîñòîãî ÷èñëà, êóáà ïðîñòîãî ÷èñëà è ÷åòâåðòîé ñòåïåíè ïðîñòîãî ÷èñëà, ðàâíî 28. Íà ñàìîì äåëå ñóùåñòâóåò ðîâíî ÷åòûðå ÷èñëà ìåíüøå ïÿòèäåñÿòè, êîòîðûå ìîæíî âûðàçèòü òàêèì îáðàçîì:
28 = 2 ^ 2 + 2 ^ 3 + 2 ^ 4
33 = 3 ^ 2 + 2 ^ 3 + 2 ^ 4
49 = 5 ^ 2 + 2 ^ 3 + 2 ^ 4
47 = 2 ^ 2 + 3 ^ 3 + 2 ^ 4
Ñêîëüêî ÷èñåë ìåíüøå ïÿòèäåñÿòè ìèëëèîíîâ ìîæåò áûòü âûðàæåíî êàê ñóììà ïðîñòîãî êâàäðàòà, ïðîñòîãî êóáà è ïðîñòîãî ÷èñëà â ÷åòâåðòîé ñòåïåíè?
