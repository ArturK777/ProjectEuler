: PRIME2?  ( u -- ? )   \ is 3 <= u (odd) a prime number - short ver
   DUP S>D D>F FSQRT F>D D>S 2+
   3 ?DO DUP I MOD 0= IF DROP 0 UNLOOP EXIT THEN 2 +LOOP DROP -1 ;
: PRIME#  ( # -- adr last-prime )   2 \ fill list of # primes
   OVER CELLS ALLOCATE THROW
   DUP 2 SWAP ! DUP 1 CELLS + 3 SWAP ! 3
   BEGIN  2+  DUP PRIME2?
      IF DUP 2 PICK 4 PICK CELLS + !
         ROT 1+ -ROT
      THEN
      2SWAP 2DUP = >R 2SWAP R>
   UNTIL
   2SWAP 2DROP ;
: PRIMUL  ( adr border -- n )  1 -1
   BEGIN -ROT 2DUP >
   WHILE ROT 1+ DUP CELLS 4 PICK + @ ROT * SWAP
   REPEAT NIP SWAP CELLS ROT + @ / ;
10 PRIME# DROP 1000000 PRIMUL .

\EOF 510510
Problem 69
Totient maximum
Euler's Totient function, ?(n) [sometimes called the phi function], is used to determine the number of numbers less than n which are relatively prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all less than nine and relatively prime to nine, ?(9)=6.
n 	Relatively Prime 	?(n) 	n/?(n)
2 	1 	1 	2
3 	1,2 	2 	1.5
4 	1,3 	2 	2
5 	1,2,3,4 	4 	1.25
6 	1,5 	2 	3
7 	1,2,3,4,5,6 	6 	1.1666...
8 	1,3,5,7 	4 	2
9 	1,2,4,5,7,8 	6 	1.5
10 	1,3,7,9 	4 	2.5
It can be seen that n=6 produces a maximum n/?(n) for n ? 10.
Find the value of n ? 1,000,000 for which n/?(n) is a maximum.

