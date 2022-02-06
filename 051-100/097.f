: 2^  ( i -- ud )   1. ROT 0
   DO D2* 2DUP 0 3 D< 0=
      IF <# #S #> SWAP 1+ SWAP 1-
         0. 2SWAP >NUMBER 2DROP 
      THEN
   LOOP ;
7830457 2^ 28433 1 M*/ 1. D+ <# #S #> 10 - + 10 TYPE
\EOF 8739992577
Large non-Mersenne prime
Problem 97
The first known prime found to exceed one million digits was discovered in 1999, and is a Mersenne prime of the form 2^6972593-1; it contains exactly 2,098,960 digits. Subsequently other Mersenne primes, of the form 2^p-1, have been found which contain more digits.
However, in 2004 there was found a massive non-Mersenne prime which contains 2,357,207 digits: 28433 * 2^7830457+1.
Find the last ten digits of this prime number.

Большое простое число не Мерсенна
Первое известное простое число, превышающее один миллион цифр, было обнаружено в 1999 году и представляет собой простое число Мерсенна в форме 2 ^ 6972593-1; он содержит ровно 2 098 960 цифр. Впоследствии были найдены другие простые числа Мерсенна в форме 2 ^ p-1, которые содержат больше цифр.
Однако в 2004 году было обнаружено массивное простое число, отличное от числа Мерсенна, которое содержит 2 357 207 цифр: 28433 * 2 ^ 7830457 + 1.
Найдите последние десять цифр этого простого числа.
