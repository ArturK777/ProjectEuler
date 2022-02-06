: ENUM  ( border -- adr ) 
   DUP 1+ CELLS ALLOCATE THROW
   SWAP 1+ 0 DO I OVER I CELLS + ! LOOP ;
: COUNTF  ( border adr -- du )   0. 2SWAP OVER 1+ 2
   DO  DUP I CELLS + @ I = 
      IF OVER 1+ I
         DO DUP I CELLS + DUP @ J / J 1- * SWAP ! 
         J +LOOP
      THEN 
      2SWAP  2 PICK I CELLS + @ 0 D+ 2SWAP
   LOOP 2DROP ;
1000000 DUP ENUM COUNTF  D.
\EOF 303963552391
Fail (too long):
: HCF  ( u1 u2 -- hcf )   \ HCF(u1,u2)  u1>u2
   BEGIN SWAP OVER MOD DUP  WHILE  REPEAT DROP ;
: BRUT  ( border -- du )  1+ DUP 2- 0 2 PICK
   2 DO 2 PICK I 1+ 
      ?DO J I HCF 1- 0= 
      IF \ J . I . CR
         1. D+ THEN LOOP
   LOOP ROT DROP ;
1000000 BRUT D.

Counting fractions
Problem 72
Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, it is called a reduced proper fraction.
If we list the set of reduced proper fractions for d <= 8 in ascending order of size, we get:
1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
It can be seen that there are 21 elements in this set.
How many elements would be contained in the set of reduced proper fractions for d <= 1,000,000?
