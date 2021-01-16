: PAL?  ( n -- ? )   \ is n palindrome
	6 0 DO 
		10 /MOD SWAP
		PAD I + C!
	LOOP DROP
	3 0 DO
		PAD I + C@ PAD 5 + I - C@ = IF I 2 = IF 1 THEN ELSE 0 LEAVE THEN
	LOOP ;
: MAIN
	900 999 DO 
		900 999 DO 
			I J * DUP PAL? IF . I J . . CR ELSE DROP THEN 
		-1 +LOOP
	-1 +LOOP ;
MAIN

\EOF 906609
Problem 4
A palindromic number reads the same both ways. 
The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 ? 99.
Find the largest palindrome made from the product of two 3-digit numbers.

Палиндромное число читается одинаково в обоих направлениях. 
Самый большой палиндром, составленный из двух двузначных чисел, равен 9009 = 91 ? 99.
Найдите самый большой палиндром, состоящий из произведения двух трехзначных чисел.

Алгоритм:
Циклы по уменьшению, разбиваю произведение 
на массив из 6 цифр и сравниваю попарно с начала и конца