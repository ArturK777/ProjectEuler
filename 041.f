CREATE TEST 10 ALLOT
: -0?  ( n -- ? )   \ n free of zeroes ?
   BEGIN 10 /MOD 2DUP OR
   WHILE SWAP 0= IF DROP 0 EXIT THEN
   REPEAT 2DROP -1 ;
: UNIQ?  ( n -- ? )   \ check n for unique digits
   TEST 10 ERASE
   BEGIN 10 /MOD 2DUP OR
   WHILE SWAP  TEST + DUP C@ 
   IF 2DROP 0 EXIT ELSE 1 SWAP C! THEN
   REPEAT 2DROP -1 ;
: PRIME?  ( u -- ? )   \ is prime number ?
   DUP 2 ?DO DUP I MOD IF ELSE DROP 0 LEAVE THEN  LOOP ;
: PAN?  ( u -- ? )   \ is n-pandigital ?
   TEST 10 ERASE  0 SWAP   
   BEGIN 10 /MOD 2DUP OR
   WHILE SWAP  TEST + 1 SWAP C!  SWAP 1+ SWAP
   REPEAT DROP  OVER 1+ 1
   DO TEST I + C@ + LOOP =  ;
: PAN  ( start -- u ) 
   BEGIN  DUP -0? OVER UNIQ? 2 PICK PAN? AND AND
      IF DUP PRIME? IF EXIT THEN
      THEN 2-
   AGAIN  ;
987654321 PAN .

\EOF 7652413
Pandigital prime
Problem 41
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
What is the largest n-digit pandigital prime that exists?
