REQUIRE FLOATS lib/include/float.f  FINIT
: PRIME2?  ( u -- ? )   \ is 3 <= u (odd) a prime number - short ver
   DUP S>D D>F FSQRT F>D D>S 2+
   3 ?DO DUP I MOD 0= IF DROP 0 UNLOOP EXIT THEN 2 +LOOP DROP -1 ;
: PrimesFromTo  ( u-from u-to -- adr # )   \ fill list of # primes begin u-from ends u-to 
   SWAP  HERE -ROT
   DUP 2 MOD 0= IF 1+ THEN 2- 0 SWAP
   BEGIN  2+  DUP PRIME2?
      IF DUP , SWAP 1+ SWAP THEN
      DUP 3 PICK >
   UNTIL  ROT 2DROP ;
: PERM?  ( u1 u2 -- ? )   \ is u1 permutation of u2 ?
   PAD 10 ERASE
   BEGIN  0 10 UM/MOD 2DUP OR
   WHILE  SWAP PAD + 1 SWAP +!
   REPEAT 2DROP
   BEGIN  0 10 UM/MOD 2DUP OR
   WHILE  SWAP PAD + -1 SWAP +!
   REPEAT 2DROP
   -1 10 0 DO PAD I + C@ IF DROP 0 LEAVE THEN LOOP ;   
: BRUT  ( -- )   2E
   2000 5000 PrimesFromTo 0 SWAP
   DUP 0 DO DUP
      I 1+ ?DO
         2 PICK DUP I CELLS + @
         SWAP J CELLS + @
         2DUP * DUP 10000000 < IF 
            ROT 1- ROT 1- * 2DUP PERM? IF 
               OVER 0 D>F 0 D>F F/ FOVER FOVER FSWAP  F< IF 
                  FSWAP FDROP  -ROT NIP
               ELSE DROP FDROP 
               THEN
            ELSE 2DROP 
            THEN
         ELSE DROP 2DROP
         THEN
      LOOP 
   LOOP ROT 2DROP ;
BRUT .

\EOF 8319823
Totient permutation
Problem 70
Euler's Totient function, ?(n) [sometimes called the phi function], is used to determine the number of positive numbers less than or equal to n which are relatively prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all less than nine and relatively prime to nine, ?(9)=6.
The number 1 is considered to be relatively prime to every positive number, so ?(1)=1.
Interestingly, ?(87109)=79180, and it can be seen that 87109 is a permutation of 79180.
Find the value of n, 1 < n < 107, for which ?(n) is a permutation of n and the ratio n/?(n) produces a minimum.
