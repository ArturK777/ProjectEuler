: PRIME?  ( u -- flag )   \ is u a prime number - full ver
   DUP 2 = IF EXIT ELSE DUP 2 < IF DROP 0 EXIT THEN THEN
   DUP 2 ?DO DUP I MOD IF ELSE DROP 0 LEAVE THEN  LOOP ;
: PRIME2?  ( u -- flag )   \ is 5 <= u (odd) a prime number - short ver
   DUP 3 DO DUP I MOD IF ELSE DROP 0 LEAVE THEN 2 +LOOP ;
: PR#  ( u1 u2 -- # )   \ count primes from to : 5 < u1 < u2
   OVER 2 MOD 0= IF SWAP 1- SWAP THEN  \ if u1 even then 1-
   0 -ROT SWAP ?DO I PRIME2? IF 1+ THEN 2 +LOOP ;
: PRIME#  ( # -- adr last-prime )   2 \ fill list of # primes
   OVER CELLS ALLOCATE THROW CELL+ 
   DUP 2 SWAP ! DUP 1 CELLS + 3 SWAP ! 3
   BEGIN  2+  DUP PRIME2?
      IF DUP 2 PICK 4 PICK CELLS + !
         ROT 1+ -ROT
      THEN
      2SWAP 2DUP = >R 2SWAP R>
   UNTIL
   2SWAP 2DROP SWAP CELL- SWAP ;
: SHOW  ( # begin-from -- )   0 -ROT DUP >R + R> 
   DO I 1+ CELLS 5 PICK + @ DUP . + 
      I 1+ 10 MOD 0= IF CR THEN 
   LOOP ." = " . CR ;
: BRUT  ( border -- prime primes-in-sum )   
   DUP 2/ 5 SWAP PR# 3 +
   DUP PRIME# DROP
   0 0 0  \ max-prime max-#-of-primes-in-sum begin-from
   BEGIN DUP 0
      BEGIN
         SWAP 1+ SWAP
         OVER CELLS 6 PICK + @  +
         DUP 8 PICK < INVERT
      UNTIL
      OVER CELLS 6 PICK + @ -  SWAP 1- SWAP
      BEGIN DUP PRIME? 0=
      WHILE OVER CELLS 6 PICK + @ -  SWAP 1- SWAP
      REPEAT  >R OVER - R>  \ subs begin-from
      ROT >R >R 2DUP  <
      IF >R  2DROP 2R> R> 2DUP SHOW
      ELSE DROP R> DROP R> 
      THEN 
      1+  DUP 5 PICK <
   WHILE 
   REPEAT DROP 2>R 2DROP DROP 2R> ;
1000000 BRUT . .
\EOF 997651
Algo:
1. Count primes from 2 + 3 + 5 + .. + N/2 (counted number of primes) until sum < N, if sum is prime store this prime & primes count to P; if not subtract primes in reverse order until find prime
2. Count primes from 3 + 5 + .. + N/2 until sum < N, if sum is prime find MAX between this and stored
3. etc until N/2
4. Type stored MAX

Consecutive prime sum
Problem 50
The prime 41, can be written as the sum of six consecutive primes:
41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.
The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
Which prime, below one-million, can be written as the sum of the most consecutive primes?

Ïîñëåäîâàòåëüíàÿ ïðîñòàÿ ñóììà
Ïðîñòîå ÷èñëî 41 ìîæíî çàïèñàòü êàê ñóììó øåñòè ïîñëåäîâàòåëüíûõ ïðîñòûõ ÷èñåë:
41 = 2 + 3 + 5 + 7 + 11 + 13
Ýòî ñàìàÿ äëèííàÿ ñóììà ïîñëåäîâàòåëüíûõ ïðîñòûõ ÷èñåë, êîòîðàÿ ñêëàäûâàåòñÿ ñ ïðîñòûì ÷èñëîì ìåíüøå ñòà.
Ñàìàÿ äëèííàÿ ñóììà ïîñëåäîâàòåëüíûõ ïðîñòûõ ÷èñåë ìåíüøå îäíîé òûñÿ÷è, êîòîðàÿ ñêëàäûâàåòñÿ ñ ïðîñòûì ÷èñëîì, ñîäåðæèò 21 ÷ëåí è ðàâíà 953.
Êàêîå ïðîñòîå ÷èñëî ìåíüøå îäíîãî ìèëëèîíà ìîæåò áûòü çàïèñàíî êàê ñóììà íàèáîëåå ïîñëåäîâàòåëüíûõ ïðîñòûõ ÷èñåë?
