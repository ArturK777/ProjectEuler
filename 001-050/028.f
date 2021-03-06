: SPIR-SUM  ( size -- sum )
DUP * 1+ 1 0 2 3 ROLL 3
DO
   ROT I +
   ROT 1+ DUP 4 =
   IF DROP 0 ROT 2+
   ELSE ROT
   THEN DUP
+LOOP 2DROP ;
1001 SPIR-SUM .

\EOF 669171001
Number spiral diagonals
Problem 28
Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13
It can be verified that the sum of the numbers on the diagonals is 101.
What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
