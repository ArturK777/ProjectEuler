: FIB ( u1 u2 -- u2 u1+u2 )  DUP ROT + ;   \ generate Fibonacci
: SUM ( u1 u2 u3 -- u1+u3 u2 u3 )  ROT OVER + -ROT ;

: MAIN BEGIN
   DUP 2 MOD IF ELSE SUM THEN 		\ if even then sum
   FIB DUP 4000000 > 		           \ is < 4e6 ?
UNTIL ; 

0 1 2 MAIN 2DROP .

