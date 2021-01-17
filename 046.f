CREATE SQR2 60 CELLS ALLOT 
: SQR*2  61 1 DO I DUP * 2* DUP . SQR2 I CELLS + ! LOOP ;
: PRIME?  ( u -- flag )   \ is u a prime number
   DUP 2 = IF EXIT ELSE DUP 2 < IF DROP 0 EXIT THEN THEN
   DUP 2 ?DO DUP I MOD IF ELSE DROP 0 LEAVE THEN  LOOP ;
: CHK  ( u -- ? )   0
   BEGIN 1+ DUP CELLS SQR2 + @ 2 PICK >  UNTIL 
   1- 1 SWAP DO 
      DUP
      I CELLS SQR2 + @  DUP .
      - PRIME? IF DROP 0 UNLOOP EXIT THEN
   -1 +LOOP 
   DROP 1 ;
: BRUT  ( u -- u' )
   BEGIN
      2+ DUP  PRIME?
      IF  ELSE DUP DUP . CHK CR IF EXIT THEN  THEN
   AGAIN ;   
SQR*2 7 BRUT CR .

\EOF 5777
Goldbach's other conjecture
Problem 46
It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
9 = 7 + 2*1^2
15 = 7 + 2*2^2
21 = 3 + 2*3^2
25 = 7 + 2*3^2
27 = 19 + 2*2^2
33 = 31 + 2*1^2
It turns out that the conjecture was false.
What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

Другая гипотеза Гольдбаха
Кристиан Гольдбах предложил, чтобы каждое нечетное составное число можно было записать как сумму простого числа и дважды квадрата.
9 = 7 + 2 * 1 ^ 2
15 = 7 + 2 * 2 ^ 2
21 = 3 + 2 * 3 ^ 2
25 = 7 + 2 * 3 ^ 2
27 = 19 + 2 * 2 ^ 2
33 = 31 + 2 * 1 ^ 2
Оказывается, это предположение было ложным.
Какая наименьшая нечетная композиция не может быть записана как сумма простого числа и удвоенного квадрата?
