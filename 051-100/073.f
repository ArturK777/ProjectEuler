12000 CONSTANT limit
: Farey  ( -- u )   1 3 0 4000 11999
   BEGIN 2DUP 2 =  SWAP 1 = AND 0=
   WHILE ROT 1+
      3 PICK limit + 2 PICK / DUP
      4 PICK * 6 ROLL - SWAP
      3 PICK * 5 ROLL - 
   REPEAT 2DROP NIP NIP ;
Farey .
\EOF 7295372

a(1) b(3) res(0) c(4000) d(11999)
a b c d res
a b c d res k k
c d res e f


Counting fractions in a range
Problem 73
Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, it is called a reduced proper fraction.
If we list the set of reduced proper fractions for d ? 8 in ascending order of size, we get:
1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
It can be seen that there are 3 fractions between 1/3 and 1/2.
How many fractions lie between 1/3 and 1/2 in the sorted set of reduced proper fractions for d ? 12,000?
