: FIB ( u1 u2 -- u2 u1+u2 )  DUP ROT + ;     \ generate Fibonacci
: SUM  ( u1 u2 u3 -- u1+u3 u2 u3 )   ROT OVER + -ROT ;
: MAIN  (  -- sum )   0 1 2 
   BEGIN
      DUP 2 MOD IF ELSE SUM THEN 		   \ if even then sum
      FIB DUP 4000000 > 		            \ is < 4e6 ?
   UNTIL 2DROP ; 
MAIN .

\EOF
Even Fibonacci numbers
Problem 2
Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

