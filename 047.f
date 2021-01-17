200 CONSTANT #PR 
: PRIME?  ( u -- flag )   \ is u a prime number
   DUP 2 = IF EXIT ELSE DUP 2 < IF DROP 0 EXIT THEN THEN
   DUP 2 ?DO DUP I MOD IF ELSE DROP 0 LEAVE THEN  LOOP ;
: PRIME2?  ( u -- flag )   \ is u a prime number - short ver
   DUP 3 ?DO DUP I MOD IF ELSE DROP 0 LEAVE THEN 2 +LOOP ;
: PRIME#  ( # -- adr last-prime )   1 \ fill list of # primes
   OVER CELLS ALLOCATE THROW  DUP 2 SWAP ! 1
   BEGIN  2+  DUP PRIME2?
      IF DUP 2 PICK 4 PICK CELLS + !  ROT 1+ -ROT  THEN
      2SWAP 2DUP = >R 2SWAP R>
   UNTIL  2SWAP 2DROP  ;
#PR PRIME# SWAP CONSTANT PRIMES 
: #CONS?  ( u # -- ? )   \ is u has # cons nums ?
   -1 SWAP 0
   DO OVER I + PRIME? 
      IF DROP 0 LEAVE THEN
   LOOP NIP ;
: PR-DIVS?  ( u # -- ? )   \ has u # prime divisors ?
   0 0
   BEGIN DUP CELLS  PRIMES + @ >R 3 PICK R>  MOD 0=
      IF SWAP 1+ DUP 3 PICK = 
         IF  2DROP 2DROP -1 EXIT  THEN
         SWAP
      THEN 1+ DUP #PR =
   UNTIL  2DROP 2DROP 0  ;
: BRUT  ( border # begin -- n1 )
   BEGIN  1+ DUP 2 PICK  #CONS?
      IF  2DUP + OVER 0 -ROT
         DO  I 3 PICK  PR-DIVS?
            IF 1+ DUP 3 PICK  =
               IF DROP NIP NIP UNLOOP EXIT  THEN
            THEN
         LOOP  DROP
      THEN
      DUP 2 PICK =
   UNTIL  ;
2 * 4 645 BRUT .
: PRIMELIST  ( -- )   #PR 0 ?DO PRIMES I CELLS + @ . LOOP ;

\EOF 134043
Distinct primes factors
Problem 47
The first two consecutive numbers to have two distinct prime factors are:
14 = 2 * 7
15 = 3 * 5
The first three consecutive numbers to have three distinct prime factors are:
644 = 2^2 * 7 * 23
645 = 3 * 5 * 43
646 = 2 * 17 * 19.
Find the first four consecutive integers to have four distinct prime factors each. What is the first of these numbers?

Разные простые множители
Первые два последовательных числа, у которых есть два различных простых множителя:
14 = 2 * 7
15 = 3 * 5
Первые три последовательных числа, у которых есть три различных простых множителя:
644 = 2 ^ 2 * 7 * 23
645 = 3 * 5 * 43
646 = 2 * 17 * 19.
Найдите первые четыре последовательных целых числа, у каждого из которых будет по четыре различных простых множителя. Какое первое из этих чисел?
