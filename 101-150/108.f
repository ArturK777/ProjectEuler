ms@ VALUE STOPWATCH
CREATE PRIMES 2 C, 3 C, 5 C, 7 C, 11 C, 13 C, 17 C, 
: NDS  ( u -- n' )   1 SWAP
   7 0 DO  PRIMES I + C@ DUP * 3 PICK > IF DROP 2* UNLOOP EXIT THEN
      1 BEGIN OVER PRIMES I + C@ /MOD SWAP 0=
      WHILE ROT DROP SWAP 2+ REPEAT 
      DROP  ROT * SWAP
      DUP 1 = IF DROP UNLOOP EXIT THEN
   LOOP DROP ;
: BRUT  ( -- answer )
   0 BEGIN 1+ DUP NDS
      1+ 2 / 1000 >
   UNTIL  ;
BRUT .
ms@ STOPWATCH - . .( ms)

\EOF 180180
Problem 108
Diophantine reciprocals I
In the following equation x, y, and n are positive integers.
For n = 4 there are exactly three distinct solutions:
What is the least value of n for which the number of distinct solutions exceeds one-thousand?
NOTE: This problem is an easier version of Problem 110; it is strongly advised that you solve this one first.

ƒиофантовы обратные I
¬ следующем уравнении x, y и n Ч положительные целые числа.
ѕри n = 4 существует ровно три различных решени€:
ѕри каком наименьшем значении n число различных решений превышает тыс€чу?
