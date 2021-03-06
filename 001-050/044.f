10000 CONSTANT N
CREATE PENT N CELLS ALLOT 
: PENT#   ( -- )   \ fill array by formula
  N 1 DO I I 3 * 1 - * 2 /  PENT I CELLS + ! LOOP ;
: PENT@  ( i -- u )  CELLS PENT + @ ;
: FIND#  ( n -- n | 0 )   N 1 DO DUP I PENT@ = IF UNLOOP EXIT THEN LOOP DROP 0 ;
: BRUT   ( -- dif )   999999999
   N 1 DO I PENT@  I
      BEGIN 1+ 2DUP PENT@  + OVER
         BEGIN 1+ DUP PENT@
            2 PICK < INVERT
         UNTIL
         PENT@ =
         IF DUP PENT@  I PENT@ -  FIND# DUP 
            IF 3 ROLL MIN -ROT  ELSE DROP THEN 
         THEN
         DUP N < INVERT
      UNTIL
      2DROP
   LOOP  ;
PENT# BRUT .
\EOF 5482660
Pentagon numbers
Problem 44
Pentagonal numbers are generated by the formula, Pn=n(3n-1)/2. The first ten pentagonal numbers are:
1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference, 70 ? 22 = 48, is not pentagonal.
Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference are pentagonal and D = |Pk - Pj| is minimised; what is the value of D?
