: PRIME? ( u -- flag ) \ is u a prime number
   DUP 3 DO DUP I MOD IF ELSE DROP 0 LEAVE THEN
   2 +LOOP ; \ odd only

: PRIME-SUM ( n -- dsum ) 5 0 3  \ 5:sum 2+3 double, 3:begin from
   BEGIN ( scope dsum i ) 
	2+ 3 PICK 2DUP <     \ in scope?
	WHILE DROP ( scope dsum i )
	DUP PRIME? ( scope dsum i flag ) 
	IF ( scope dsum i ) 
		0 2DUP 2ROT D+ 2SWAP DROP ( scope dsum i )
	THEN
   REPEAT 2DROP ;

2000000 PRIME-SUM D.

\EOF 142913828922
Problem 10
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.

Ñóììà ïðîñòûõ ÷èñåë ìåíüøå 10 ñîñòàâëÿåò 2 + 3 + 5 + 7 = 17.
Íàéäèòå ñóììó âñåõ ïðîñòûõ ÷èñåë ìåíüøå äâóõ ìèëëèîíîâ.

Problem 7
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
we can see that the 6th prime is 13.
What is the 10 001st prime number?

¾åðå÷èñëèâ ïåðâûå øåñòü ïðîñòûõ ÷èñåë: 2, 3, 5, 7, 11 è 13,
ìû âèäèì, ÷òî øåñòîå ïðîñòîå ÷èñëî ðàâíî 13.
 àêîå 10 001-å ïðîñòîå ÷èñëî?
