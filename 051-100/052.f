: N>CH  ( u #  -- len )   10 * SWAP 0 <# #S #> DUP >R ROT PAD  + SWAP CMOVE R> ;
: MULT  ( u len -- ? )   
   6 1 DO OVER I 1+ * I N>CH
      OVER = 0= IF 2DROP 0 UNLOOP EXIT THEN
   LOOP  2DROP -1 ;
: SAME0  ( len -- )   PAD 60 + 10 ERASE PAD + PAD DO 1 I C@ 48 - PAD 60 + + +! LOOP ;
: SAME?  ( len -- ? )   
   6 1 DO DUP SAME0
      PAD I 10 * + OVER OVER + SWAP
      DO -1 I C@ 48 - PAD 60 + + +! LOOP 
      0 PAD 60 + DUP 10 + SWAP DO I C@ + LOOP 
      IF DROP 0 UNLOOP EXIT THEN
   LOOP DROP  -1 ;
: BRUT ( from -- u )
   BEGIN
      PAD 70 ERASE
      DUP 0 N>CH
      2DUP MULT 
      IF SAME?
         IF EXIT THEN
      ELSE DROP
      THEN 1+
   AGAIN ;
1000 BRUT .

\EOF 142857
Permuted multiples
Problem 52
It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.
Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
