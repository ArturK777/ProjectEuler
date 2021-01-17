CREATE DIVSUMS 10000 CELLS ALLOT
: DIVSUM  ( 0 i i/2 -- sum i 0 )   DUP \ find sum of all divisors recursevely
   IF  2DUP MOD 0=   \ divisor?
      IF  DUP >R ROT + SWAP R>  THEN
      1- RECURSE
   THEN ;
: GETDIVS  ( border -- )   5   \ fill array of divs sums
   DO 
      0 I I 2/ DIVSUM DROP 2DUP -   \ not equal
      IF  CELLS DIVSUMS + !  ELSE 2DROP  THEN 
   LOOP ;
: BRUT  ( n -- sum )   1+ DUP GETDIVS  0 SWAP 5 
   DO
      DIVSUMS I CELLS + @ DUP DUP 1- SWAP 10001 < AND \ not 1 and < 100001
      IF  CELLS DIVSUMS + @ I =  IF I + THEN
      ELSE DROP
      THEN
   LOOP ;
10000 BRUT .

\EOF 31626
Amicable numbers
Problem 21
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and each of a and b are called amicable numbers.
For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
Evaluate the sum of all the amicable numbers under 10000.

Дружелюбные номера
Пусть d (n) определяется как сумма собственных делителей n (чисел меньше n, которые делятся на n без остатка).
Если d (a) = b и d (b) = a, где a != b, тогда a и b - дружная пара, и каждое из a и b называется дружескими числами.
Например, правильные делители 220: 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 и 110; поэтому d (220) = 284. Собственные делители числа 284 - 1, 2, 4, 71 и 142; так что d (284) = 220.
Оцените сумму всех полюбившихся чисел меньше 10000.