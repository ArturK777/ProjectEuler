CREATE POW5 0 , 1 , 32 , 243 , 1024 , 3125 , 7776 , 16807 , 32768 , 59049 ,
: SUM5?  ( n -- ? )   DUP 0 SWAP \ is n a sum of fifth powers of their digits?
   BEGIN 10 /MOD SWAP 2DUP OR 
   WHILE CELLS POW5 + @ ROT + SWAP
   REPEAT 2DROP = ;
: BRUT  ( border -- sum )   0 SWAP 2
   DO I  SUM5? IF I . CR I + THEN  LOOP ;
POW5 9 CELLS + @ 6 *    \ upper limit
BRUT .( Sum is : ) .

\EOF 443839
Digit fifth powers
Problem 30
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
    1634 = 1^4 + 6^4 + 3^4 + 4^4
    8208 = 8^4 + 2^4 + 0^4 + 8^4
    9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 1^4 is not a sum it is not included.
The sum of these numbers is 1634 + 8208 + 9474 = 19316.
Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
