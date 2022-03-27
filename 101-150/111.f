ms@ VALUE STOPWATCH
10 CONSTANT SIZE  PAD 200 ERASE
2VARIABLE HLIM  2VARIABLE DSUM
: ~2** CREATE 0x08040201 , 0x80402010 ,  DOES> + C@ ;  ~2** 2** 
: GETB  ( adr i -- bit-zero )   8 /MOD ROT + C@ SWAP 2** AND 0= ;
: DGETB  ( adr d-i -- bit-zero )   8 UM/MOD ROT + C@ SWAP 2** AND 0= ;   
: DESIEVE  ( d-end -- adr )   \ make bitmap of primes in adr to d-end
   2DUP HLIM 2!  D>F FSQRT F>D D>S >R   \ border
   HLIM 2@ 1 8 M*/ D>S 1+ ALLOCATE THROW
   3 BEGIN 2DUP GETB
      IF DUP 0 
         BEGIN 2DUP HLIM 2@ D> 0=
         WHILE
            2DUP 8 UM/MOD
            5 PICK + DUP
            C@ ROT 2** OR SWAP  C!
            2 PICK M+ 
         REPEAT 2DROP
      THEN  DUP R@ < 
   WHILE 2+ 
   REPEAT R> 2DROP ;
: LIMITS  ( # -- begin d-end )   DUP 1-
   1 SWAP 0 ?DO 10 * LOOP 1+ SWAP
   1. ROT 0 DO 10 1 M*/ LOOP -1 M+ ;
: MAX#  ( -- i # )   \ count # of digit i
   -1 1 10 0 DO PAD I + C@ OVER > IF 2DROP I PAD I + C@ THEN LOOP ;
: MAIN  ( du -- )   2DUP PAD 10 ERASE SIZE 0 
   DO 10 UM/MOD SWAP PAD + 1+! 0 LOOP 2DROP  \ count each digit to PAD 
   MAX# OVER 0< IF 2DROP 2DROP
   ELSE SWAP 4 CELLS * PAD 10 + + DUP >R @ OVER 2DUP < 
      IF 2DROP -ROT
         R@ 2 CELLS + 2!
         R@ !  1 R> CELL+ !
      ELSE = 
         IF -ROT R@ 2 CELLS + 2@ D+
            R@ 2 CELLS + 2!
            R> CELL+ 1+!
         ELSE 2DROP R> DROP
         THEN DROP 
      THEN
   THEN ;
: DRAW  ( -- )   CR ." d	M(10, d) N(10, d)  S(10, d) " CR
   PAD 10 + 10 0 DO 
      I . DUP I 4 CELLS * + @ 7 .R DUP I 4 CELLS * + CELL+ @ 7 .R
      DUP I 4 CELLS * + 2 CELLS + 2@ 2DUP 15 D.R CR 
      DSUM 2@ D+ DSUM 2! LOOP DROP ;
: BRUT ( begin adr -- )   SWAP 0
   BEGIN 2DUP 4 PICK -ROT 
      DGETB IF 2DUP MAIN THEN  2 M+ 2DUP HLIM 2@ D>
   UNTIL  2DROP DROP ;

SIZE LIMITS DESIEVE 
BRUT DRAW DSUM 2@ D. CR
ms@ STOPWATCH - 1000 / . .( s) CR


\EOF 612407567715
Problem 111
Primes with runs
Considering 4-digit primes containing repeated digits it is clear that they cannot all be the same: 1111 is divisible by 11, 2222 is divisible by 22, and so on. But there are nine 4-digit primes containing three ones:
1117, 1151, 1171, 1181, 1511, 1811, 2111, 4111, 8111
We shall say that M(n, d) represents the maximum number of repeated digits for an n-digit prime where d is the repeated digit, N(n, d) represents the number of such primes, and S(n, d) represents the sum of these primes.
So M(4, 1) = 3 is the maximum number of repeated digits for a 4-digit prime where one is the repeated digit, there are N(4, 1) = 9 such primes, and the sum of these primes is S(4, 1) = 22275. It turns out that for d = 0, it is only possible to have M(4, 0) = 2 repeated digits, but there are N(4, 0) = 13 such cases.
In the same way we obtain the following results for 4-digit primes.
Digit, d 	M(4, d) 	N(4, d) 	S(4, d)
0 	2 	13 	67061
1 	3 	9 	22275
2 	3 	1 	2221
3 	3 	12 	46214
4 	3 	2 	8888
5 	3 	1 	5557
6 	3 	1 	6661
7 	3 	9 	57863
8 	3 	1 	8887
9 	3 	7 	48073
For d = 0 to 9, the sum of all S(4, d) is 273700.
Find the sum of all S(10, d).

ѕростые числа с прогонами
–ассматрива€ 4-значные простые числа, содержащие повтор€ющиес€ цифры, становитс€ €сно, что все они не могут быть одинаковыми: 1111 делитс€ на 11, 2222 делитс€ на 22 и так далее. Ќо есть дев€ть 4-значных простых чисел, содержащих три 1:
1117, 1151, 1171, 1181, 1511, 1811, 2111, 4111, 8111
—кажем, что M(n, d) представл€ет собой максимальное число повтор€ющихс€ цифр дл€ n-значного простого числа, где d Ч повтор€юща€с€ цифра, N(n, d) Ч число таких простых чисел, а S(n, d) Ч сумму этих простых чисел.
“аким образом, M(4, 1) = 3 Ч максимальное число повтор€ющихс€ цифр дл€ 4-значного простого числа, где 1 Ч повтор€юща€с€ цифра, есть N(4, 1) = 9 таких простых чисел, и сумма этих простых чисел равна S(4, 1) = 22275. ѕолучаетс€, что дл€ d = 0 можно иметь только M(4, 0) = 2 повтор€ющиес€ цифры, но есть N(4, 0) = 13 таких случаев.

“аким же образом получаем следующие результаты дл€ 4-значных простых чисел.
÷ифра, d M(4, d) N(4, d) S(4, d)
0 	2 	13 	67061
1 	3 	9 	22275
2 	3 	1 	2221
3 	3 	12 	46214
4 	3 	2 	8888
5 	3 	1 	5557
6 	3 	1 	6661
7 	3 	9 	57863
8 	3 	1 	8887
9 	3 	7 	48073
ƒл€ d = от 0 до 9 сумма всех S(4, d) равна 273700.
Ќайдите сумму всех S(10, d).