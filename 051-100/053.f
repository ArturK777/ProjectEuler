1000000 CONSTANT LIMIT
101 CONSTANT N
CREATE PASTRI N DUP * CELLS ALLOT
: PASINIT  ( -- )   N 0 DO 1 I N * CELLS PASTRI + C! LOOP ;
: PCOUNT  ( -- )   0
   N 1 DO
      I 1+ 1 DO 
         PASTRI J 1- N * I + CELLS + @
         PASTRI J 1- N * I 1- + CELLS + @
         + DUP LIMIT > IF DROP 1+ LIMIT THEN
         PASTRI J N * I + CELLS + !
      LOOP
   LOOP ;
PASINIT PCOUNT .

\EOF 4075
see 053.png
Combinatoric selections
Problem 53
There are exactly ten ways of selecting three from five, 12345:
123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
In combinatorics, we use the notation,
In general,
, where , , and
It is not until
, that a value exceeds one-million:
How many, not necessarily distinct, values of
for 1<=n<=100 , are greater than one-million?
