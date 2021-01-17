CREATE /NUM 10 ALLOT
: PRIME?  ( u -- flag )   \ is u a prime number
   DUP 3 DO DUP I MOD IF ELSE DROP 0 LEAVE THEN
   LOOP ; 
: /ROT  ( u -- ? ) 10 SWAP
   BEGIN  10 /MOD SWAP 2DUP OR
   WHILE  48 + ROT 1- DUP >R -ROT R> /NUM + C!
   REPEAT 2DROP
   DUP 10 SWAP - DUP >R
   /NUM C!
   /NUM + /NUM 1+ R> CMOVE
   1 /NUM C@ 1 DO
      /NUM 1+ C@ >R /NUM 2+ /NUM 1+ /NUM C@ CMOVE
      /NUM C@ /NUM + R> SWAP C!
      0. /NUM COUNT >NUMBER DROP 2DROP
      PRIME? 0= IF DROP 0 UNLOOP EXIT THEN
   LOOP ;
: BRUT  ( border -- # ) 4 SWAP 1+ 11 
   DO  I PRIME? IF I /ROT IF I . CR 1+ THEN  THEN
   2 +LOOP CR ; 
1000000  BRUT .
\EOF 55
Circular primes
Problem 35
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
How many circular primes are there below one million?
