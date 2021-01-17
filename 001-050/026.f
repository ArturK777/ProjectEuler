CREATE REMS 1000 ALLOT
: BRUT  ( # -- u )  0 0 ROT 1
   DO REMS 1000 ERASE 1 REMS C!  0 1
      BEGIN I MOD DUP
         REMS + C@ 0 =
      WHILE DUP
         REMS + 1 SWAP C!
         SWAP 1+ SWAP
         10 *
      REPEAT DROP DUP
      3 PICK  >
      IF -ROT 2DROP I ELSE DROP THEN
   LOOP NIP ;
1000 BRUT .

\EOF 983

Reciprocal cycles
Problem 26
A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
    1/2	= 	0.5
    1/3	= 	0.(3)
    1/4	= 	0.25
    1/5	= 	0.2
    1/6	= 	0.1(6)
    1/7	= 	0.(142857)
    1/8	= 	0.125
    1/9	= 	0.(1)
    1/10	= 	0.1 
Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
