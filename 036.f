CREATE :STR 20 ALLOT
: PAL?  ( base u -- ? )   0 SWAP
   BEGIN  2 PICK /MOD SWAP 2DUP OR
   WHILE  ROT 1+ DUP >R :STR + C! R> SWAP
   REPEAT 2DROP
   :STR C! DROP -1
   :STR C@ 2 / 0 ?DO 
      I :STR + 1+ C@  :STR C@ I - :STR + C@
      <> IF DROP 0 LEAVE THEN
   LOOP ;
: BRUT  ( border -- sum )   0 SWAP 1  DO
      10 I PAL? IF 
         2 I PAL? IF I + 
            I DUP . 2 BASE C! . 10 BASE C! CR 
         THEN
      THEN
   LOOP CR ;
1000000 BRUT .

\EOF 872187
Double-base palindromes
Problem 36
The decimal number, 585 = 1001001001  (binary), is palindromic in both bases.
Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
(Please note that the palindromic number, in either base, may not include leading zeros.)

