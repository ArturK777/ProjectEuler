CREATE BIGNUM 1 C, 159 ALLOT BIGNUM 1+ 160 ERASE
CREATE BIGADD 160 ALLOT BIGADD 160 ERASE

: COPY-NUM  ( -- )   160 0 \ copy addendum
   DO BIGNUM I + C@ BIGADD I + C! LOOP ;

: %MR  ( a-num a-add # -- a-num' a-add' #' )   DUP
IF 1- >R
   DUP C@ SWAP 1+ >R
   SWAP DUP C@ SWAP >R +
   10 /MOD SWAP R>
   DUP 1+ >R
   C! R@ +!
   R> R> R>
   RECURSE
THEN ;

: MULT-REC  ( u -- u' )   1- DUP
IF BIGNUM BIGADD 160 %MR 
   2DROP DROP
   RECURSE
THEN ;

: MAIN  ( u -- sum )   1+ 1 
DO COPY-NUM I MULT-REC DROP LOOP
0 160 0 DO BIGNUM I + C@ + LOOP ;

100 MAIN .

\EOF 648
9 3 3 2 6 2 1 5 4 4 3 9 4 4 1 5 2 6 8 1 6 9 9 2 3 8 8 5 6 2 6 7
Factorial digit sum
Problem 20
n! means n * (n - 1) * ... * 3 * 2 * 1
For example, 10! = 10 ? 9 ? ... ? 3 ? 2 ? 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
Find the sum of the digits in the number 100!

Сложения цифр с переносом и рекурсией
