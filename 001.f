0 CREATE SUM3 , \ init sum of 3 multiples
0 CREATE SUM5 , \ init sum of 5 multiples
: S3 ( u -- flag ) DUP 3 MOD 0= IF SUM3 +! 1 ELSE DROP 0 THEN ; \ sum of 3 multiples
: S5 ( u -- ) DUP 5 MOD 0= IF SUM5 +! ELSE DROP THEN ; \ sum of 5 multiples
: MAIN 1000 1 \ loop of natural numbers
	DO I S3 
		IF \ check is 3 mult?, skip S5
		ELSE I S5 \ no, check for 5 mult
		THEN 
	LOOP ; 
MAIN
SUM3 @ SUM5 @ + .

\EOF 
Multiples of 3 and 5
If we list all the natural numbers below 10 
that are multiples of 3 or 5, we get 3, 5, 6 and 9. 
The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.

Кратное 3 и 5
Если мы перечислим все натуральные числа ниже 10
которые кратны 3 или 5, мы получаем 3, 5, 6 и 9.
Сумма этих кратных 23.
Найдите сумму всех кратных 3 или 5 ниже 1000.

233168

