S" ..\..\LEARN\FORTH\@\LEHS\numbertheory.f" INCLUDED
1000000 CONSTANT LIM  0 VALUE A-SET
\ =====  Bits array : a-set[0] - length in bytes , a-set+cell - begin from
: BINIT  ( u -- a-set )   \ init bits array for u(DECIMAL) , release by FREE
   8 /MOD SWAP IF 1+ THEN CELL+ DUP ALLOCATE THROW SWAP CELL- OVER ! ;
: GETMASK  ( a-set u -- adr' mask )   8 /MOD ROT + CELL+ 1 ROT LSHIFT ;
: BCHECK  ( a-set u -- ? )   GETMASK >R C@ R@ AND R> = ;
: BSET  ( a-set u -- )   GETMASK SWAP DUP >R C@ OR R> C! ;
\ =======
: SIGMA-  ( u -- sum )   DUP SIGMA SWAP - ;
: CHAIN  ( u-start -- # | 0 )   
   LIM BINIT  DUP TO A-SET  
   OVER BSET 1 OVER  
   BEGIN  DUP 0= IF NIP NIP EXIT THEN
      SIGMA-  DUP LIM > IF 2DROP DROP 0 EXIT THEN
      A-SET OVER  BCHECK 0= 
   WHILE  SWAP 1+ SWAP  A-SET OVER BSET
   REPEAT  ROT = 0= IF DROP 0 THEN ;
: BRUT  ( -- u )   0.  LIM 1 
   DO I CHAIN  A-SET FREE THROW  2DUP <
      IF NIP NIP I SWAP 2DUP . . CR ELSE DROP THEN
   LOOP ;
BRUT CR . .
\EOF 14316
Amicable chains
Problem 95
The proper divisors of a number are all the divisors excluding the number itself. For example, the proper divisors of 28 are 1, 2, 4, 7, and 14. As the sum of these divisors is equal to 28, we call it a perfect number.
Interestingly the sum of the proper divisors of 220 is 284 and the sum of the proper divisors of 284 is 220, forming a chain of two numbers. For this reason, 220 and 284 are called an amicable pair.
Perhaps less well known are longer chains. For example, starting with 12496, we form a chain of five numbers:
12496 > 14288 > 15472 > 14536 > 14264 (> 12496 > ...)
Since this chain returns to its starting point, it is called an amicable chain.
Find the smallest member of the longest amicable chain with no element exceeding one million.

ƒружественные цепи
—обственные делители числа - это все делители, за исключением самого числа. Ќапример, правильные делители числа 28 - это 1, 2, 4, 7 и 14. ѕоскольку сумма этих делителей равна 28, мы называем это совершенным числом.
»нтересно, что сумма собственных делителей 220 равна 284, а сумма собственных делителей 284 равна 220, образу€ цепочку из двух чисел. ѕо этой причине 220 и 284 называютс€ дружной парой.
¬озможно, менее известны более длинные цепи. Ќапример, начина€ с 12496 формируем цепочку из п€ти чисел:
12496> 14288> 15472> 14536> 14264 (> 12496> ...)
ѕоскольку эта цепочка возвращаетс€ в исходную точку, она называетс€ дружеской цепочкой.
Ќайдите наименьшего члена самой длинной дружеской цепочки, в которой ни один элемент не превышает одного миллиона.