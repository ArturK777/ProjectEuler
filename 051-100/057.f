REQUIRE BIGINIT ~@/bigint.f
: BRUT  ( border -- # )   0 SWAP
   4 400 BIGINIT
   3 0 S>BIG   \ N
   2 2 S>BIG   \ D
   0 DO 
      0 1 BMOV
      2 3 BMOV
      3 2 BSUM    \ D*2
      0 3 BSUM    \ N = N + 2D
      2 1 BSUM    \ D = N + D
      0 BIG>STR NIP
      2 BIG>STR NIP
      > IF 1+ THEN
   LOOP ;
1000 BRUT .
\EOF
Formulas: 
N(k+1) = N(k) + 2*D(k)  start 3
D(k+1) = N(k) + D(k)    start 2

Square root convergents
Problem 57
 v 2 = 1 + 1/(2 + 1/(2 + 1/(2 + … ))) = 1.414213…
 By expanding this for the first four iterations, we get:
 1 + 1/2 = 3/2 = 1.5
 1 + 1/(2 + 1/2) = 7/5 = 1.4
 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666…
 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379…
 The next three expansions are 99/70, 239/169, and 577/408, but the eighth expansion, 1393/985, is the first example where the number of digits in the numerator exceeds the number of digits in the denominator.
 In the first one-thousand expansions, how many fractions contain a numerator with more digits than denominator?