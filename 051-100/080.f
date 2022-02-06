REQUIRE BIGINIT ~@/bigint.f  
3 103 BIGINIT
: SUMSQRT  ( u -- sum )
   5 * 1 S>BIG 
   5 2 S>BIG
   BEGIN
     2 BLEN10 102 <
   WHILE
      1 2 BCOMP -1 >
      IF
         1 2 B-
         10 3 S>BIG  2 3 B+
      ELSE
         100 1 BMUL
         2 BIG/10  100 2 BMUL 5 3 S>BIG 2 3 B+
      THEN
   REPEAT 
   2 BIG/10 2 BIG/10 2 BDIGSUM ;
: SQRT  ( n -- 2^n )   \ int SQRT { FD-V12N1 }
   1 10 0 DO 2DUP / + 2/ LOOP NIP ;
: SUM100  ( -- u )   0
   101 1 DO
      I SQRT DUP * I = 0= 
      IF I SUMSQRT + THEN
   LOOP ;
SUM100 .
\ 11 SUMSQRT .
\EOF 40886
Square root digital expansion
Problem 80
It is well known that if the square root of a natural number is not an integer, then it is irrational. The decimal expansion of such square roots is infinite without any repeating pattern at all.
The square root of two is 1.41421356237309504880..., and the digital sum of the first one hundred decimal digits is 475.
For the first one hundred natural numbers, find the total of the digital sums of the first one hundred decimal digits for all the irrational square roots.

Хорошо известно, что если квадратный корень натурального числа не является целым числом, то он иррационален. Десятичное разложение таких квадратных корней бесконечно без какого-либо повторяющегося шаблона.
Квадратный корень из двух равен 1,41421356237309504880 ..., а цифровая сумма первых ста десятичных цифр равна 475.
Для первых ста натуральных чисел найдите сумму цифровых сумм первых ста десятичных цифр для всех иррациональных квадратных корней.