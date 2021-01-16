CREATE DIVS 11 C, 13 C, 14 C, 15 C, 16 C, 17 C, 18 C, 19 C,
: MAIN 
	BEGIN DUP 8 0 
	DO DIVS I + C@ MOD 
		IF 1 LEAVE 
		ELSE DUP I 7 = 
			IF UNLOOP EXIT  \ exit in DO LOOP
			THEN 
		THEN 
	LOOP
	WHILE 20 +
	REPEAT ;

20 MAIN .

\EOF 232792560
Problem 5
2520 is the smallest number that can be divided by each of the numbers 
from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible 
by all of the numbers from 1 to 20?

2520 - это наименьшее число, которое можно разделить 
на каждое из чисел от 1 до 10 без остатка.
Какое наименьшее положительное число делится без остатка 
на все числа от 1 до 20?

Alg: 20 19 18 17 16 15 14 13 11 


