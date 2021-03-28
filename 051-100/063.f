: HIGHER  ( n -- u )   10. D>F DUP 1 - 0 D>F 0 D>F F/ F** 10. D>F FSWAP F- F>D D>S ;
: BRUT  ( -- u )   0 1
   BEGIN  DUP HIGHER DUP 0>
   WHILE  ROT + SWAP 1+
   REPEAT 2DROP ;
BRUT .
\EOF 49
Powerful digit counts
Problem 63
The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit number, 134217728=8^9, is a ninth power.
How many n-digit positive integers exist which are also an nth power?
