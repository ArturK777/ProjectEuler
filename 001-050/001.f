: ADD3  ( u i -- u | u+i flag )   DUP 3 MOD IF ELSE + 0 THEN ; \ add 3 multiple
: ADD5  ( u i -- u | u+i )   DUP 5 MOD IF DROP ELSE + THEN ; \ add 5 multiple
: SUM 1 
	DO I ADD3 \ loop of natural numbers
		IF I ADD5 \ check if not 3 mult then S5
		THEN 
	LOOP ; 
0 1000 SUM .

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

