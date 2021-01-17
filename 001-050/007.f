: PRIME?  ( u -- ? )   \ is u a prime number
   DUP 3 DO DUP I MOD IF ELSE DROP 0 LEAVE THEN
   2 +LOOP ; \ odd only

: PRIME-COUNT  ( i -- n )   1- 1 3 
   BEGIN
      -ROT 2DUP >
	WHILE 
      ROT 2+ DUP PRIME? 
	IF SWAP 1+ SWAP THEN
   REPEAT 2DROP ;
10001 PRIME-COUNT .

\EOF 104743
Problem 7
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
we can see that the 6th prime is 13.
What is the 10 001st prime number?

Ïåðå÷èñëèâ ïåðâûå øåñòü ïðîñòûõ ÷èñåë: 2, 3, 5, 7, 11 è 13,
ìû âèäèì, ÷òî øåñòîå ïðîñòîå ÷èñëî ðàâíî 13.
Êàêîå 10 001-å ïðîñòîå ÷èñëî?
