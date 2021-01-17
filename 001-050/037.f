CREATE :STR 8 ALLOT
: PRIME?  ( u -- flag )   \ is u a prime number
   DUP 2 = IF EXIT ELSE DUP 2 < IF DROP 0 EXIT THEN THEN
   DUP 2 ?DO DUP I MOD IF ELSE DROP 0 LEAVE THEN  LOOP ;
: TURNOVER  ( -- )   \ turn over couted-string
   :STR C@ 0 DO :STR 1+ I + C@ LOOP
   :STR C@ 0 DO :STR 1+ I + C! LOOP  ;
: STR  ( u -- )   0 SWAP
   BEGIN  10 /MOD SWAP 2DUP OR
   WHILE  48 + ROT 1+ DUP >R :STR + C! R> SWAP
   REPEAT 2DROP 
   :STR C! TURNOVER ;
: REMOVE  ( -- ? )
   0 :STR C@  
   1 DO 0. :STR 1+ :STR C@ I - >NUMBER 2DROP D>S PRIME? 0= IF UNLOOP EXIT THEN LOOP
   :STR C@  
   1 DO 0. :STR 1+ I + :STR C@ I - >NUMBER 2DROP D>S PRIME? 0= IF UNLOOP EXIT THEN LOOP
   DROP 1  ;
: BRUT  ( # -- sum )   0 0 21
   BEGIN 2+ DUP PRIME? IF
         DUP STR REMOVE
         IF DUP >R + SWAP 1+ SWAP R> DUP . CR THEN 
      THEN
      3 PICK 3 PICK = 
   UNTIL DROP >R 2DROP R> CR  ;
11 BRUT .

\EOF 748317
Truncatable primes
Problem 37
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
