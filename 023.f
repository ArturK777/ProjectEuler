0 VALUE #ABND  \ abundant quantity
0 VALUE :ABND  \ abundant list addr
: DUMP-ABND  ( hi -- )   0 DO :ABND I CELLS + @ . CR LOOP ;
: ABND?  ( u -- ? )   0 OVER 2/ 1+ 1  DO OVER I MOD 0=  IF I + THEN  LOOP  < ;
: COUNT-ABND  ( lo hi -- # )   2DUP SWAP ." From " . ." to " .
   1+ SWAP 0 -ROT  DO  I ABND?  IF 1+ THEN  LOOP 
   DUP ." Abundants found : " . CR ;
: LIST-ABND  ( lo hi -- )   2DUP COUNT-ABND 
   CELLS ALLOCATE ABORT" Can't allocate buffer" DUP TO :ABND -ROT 0 -ROT
   SWAP  DO I ABND?  IF DUP CELLS 2 PICK + I SWAP ! 1+  THEN  LOOP NIP TO #ABND ;
: ABND@  ( i -- u )   CELLS :ABND + @ ; \ fetch abundant from list
: SUM2ABND?  ( u -- ? )  \ is sum of 2 abundants ?
   #ABND 0  DO #ABND 0  DO DUP I ABND@ J ABND@ + =
         IF DROP -1 UNLOOP UNLOOP EXIT  THEN 
   LOOP LOOP DROP 0 ;
: BRUT  ( lo hi -- sum )   SWAP 0 -ROT 
   DO I SUM2ABND? 
      IF  ELSE I +  THEN 
   LOOP ;
: MAIN    12 28123 LIST-ABND  1 28123  BRUT ;
MAIN .

\EOF 4179871
Non-abundant sums
Problem 23
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

Ќеизбыточные суммы
—овершенное число - это число, дл€ которого сумма собственных делителей в точности равна числу. Ќапример, сумма собственных делителей 28 будет 1 + 2 + 4 + 7 + 14 = 28, что означает, что 28 - идеальное число.
„исло n называетс€ неполным, если сумма его собственных делителей меньше n, и избыточным, если эта сумма превышает n.
ѕоскольку 12 - это наименьшее изобильное число, 1 + 2 + 3 + 4 + 6 = 16, наименьшее число, которое может быть записано как сумма двух изобильных чисел, равно 24. ћатематическим анализом можно показать, что все целые числа больше чем 28123 можно записать как сумму двух обильных чисел. ќднако этот верхний предел не может быть уменьшен с помощью анализа, даже если известно, что наибольшее число, которое не может быть выражено как сумма двух избыточных чисел, меньше этого предела.
Ќайдите сумму всех положительных целых чисел, которые нельз€ записать как сумму двух обильных чисел.