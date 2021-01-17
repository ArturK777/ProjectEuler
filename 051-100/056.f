: U>PAD  ( u shift -- len )   0 ROT
   BEGIN  10 /MOD 2DUP OR
   WHILE  SWAP 2OVER PAD + + C! SWAP 1+ SWAP
   REPEAT 2DROP NIP ;   
: A^B  ( a b -- len )   SWAP DUP 0 U>PAD ROT
   1 DO SWAP OVER
      0 SWAP 0
      DO OVER
         PAD I + C@ * 10 /MOD
         SWAP ROT +
         10 /MOD ROT +
         SWAP PAD I + C!
      LOOP
      2 PICK U>PAD ROT + 
   LOOP NIP ;
: SUM  ( len -- sum )   0 SWAP 0 DO PAD I + C@ + LOOP ;
: BRUT  ( border -- max-sum )   0 OVER
   11 DO OVER
      11 DO J I 
      A^B SUM MAX
      LOOP
   LOOP NIP ;
100 BRUT .
\EOF 972
Powerful digit sum
Problem 56
A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.
Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?
