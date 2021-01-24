: PRIME?  ( u -- u | 0 )   \ is u a prime number - full ver
   DUP 2 = IF EXIT ELSE DUP 2 < IF DROP 0 EXIT THEN THEN
   DUP S>D D>F FSQRT F>D D>S 1+
   2 ?DO DUP I MOD IF ELSE DROP 0 LEAVE THEN  LOOP ;
: PRIME2?  ( u -- u | 0 )
   DUP S>D D>F FSQRT F>D D>S 1+
   3 DO DUP I MOD IF ELSE DROP 0 LEAVE THEN 2 +LOOP ;
: SPIR  ( ratio -- side )   10 *
   3 4 9    
   BEGIN
      3 0 DO
         OVER + 
         DUP PRIME2? 
         IF ROT 1+ ROT ROT THEN
      LOOP OVER +
      2 PICK 1000 3 PICK  2* 1+ */ 
      4 PICK < IF DROP 1+ NIP NIP EXIT THEN
      SWAP 2+ SWAP
   AGAIN ;
FINIT 
10 SPIR .

\EOF 26241 (13 3593)
Spiral primes
Problem 58
Starting with 1 and spiralling anticlockwise in the following way, a square spiral with side length 7 is formed.
37 36 35 34 33 32 31
38 17 16 15 14 13 30
39 18  5  4  3 12 29
40 19  6  1  2 11 28
41 20  7  8  9 10 27
42 21 22 23 24 25 26
43 44 45 46 47 48 49
It is interesting to note that the odd squares lie along the bottom right diagonal, but what is more interesting is that 8 out of the 13 numbers lying along both diagonals are prime; that is, a ratio of 8/13 ? 62%.
If one complete new layer is wrapped around the spiral above, a square spiral with side length 9 will be formed. If this process is continued, what is the side length of the square spiral for which the ratio of primes along both diagonals first falls below 10%?
