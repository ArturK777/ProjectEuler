CREATE BIGNUM 320 ALLOT 
: !END ( a -- flag ) 2@ 0. D= INVERT ;
: M2 ( -- ) 0 BIGNUM
	BEGIN DUP !END 2 PICK OR
	WHILE DUP C@ 2* 10 /MOD >R ROT + SWAP TUCK C! R> SWAP 1+
	REPEAT 2DROP ;
: POW2 ( pow -- ) BIGNUM 320 ERASE 1 BIGNUM C! 0 DO M2 LOOP ; 
: SUM2 ( -- sum ) 0 320 0 DO BIGNUM I + C@ + LOOP ;
1000 POW2 SUM2 .

: BB BIGNUM 320 DUMP ;

\EOF 1366
(Power digit sum
Problem 16
2**15 = 32768 and the sum of its digits 
is 3 + 2 + 7 + 6 + 8 = 26.
What is the sum of the digits of the number 2**1000?

2 ** 15 = 32768 è ñóììà åãî öèôð
ðàâíî 3 + 2 + 7 + 6 + 8 = 26.
Êàêîâà ñóììà öèôð ÷èñëà 2**1000?

