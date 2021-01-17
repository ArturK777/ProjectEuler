: FUNC  ( a b c -- func )   \ func = (a*c-b*c)/(a*c-a*b) except div-by-zero
   DUP 3 PICK * DUP >R SWAP 2 PICK * - ROT ROT * R> SWAP - DUP IF / ELSE 2DROP 0 THEN ;
: BRUT  ( -- n )   1 1
   11 1 DO I
      11 1 DO
         11 1 DO 
            DUP J I FUNC  10 = 
            IF DUP >R ROT * SWAP R> 
               SWAP I * SWAP
            THEN
         LOOP
      LOOP  DROP
   LOOP  SWAP / ;
BRUT .
\EOF 100
Digit cancelling fractions
Problem 33
The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

ƒроби отмены цифр
ƒробь 49/98 - любопытна€ дробь, поскольку неопытный математик, пыта€сь ее упростить, может ошибочно полагать, что 49/98 = 4/8, что правильно, получаетс€ путем удалени€ дев€ток.
ћы будем рассматривать дроби типа 30/50 = 3/5 как тривиальные примеры.
—уществует ровно четыре нетривиальных примера этого типа дроби, меньше единицы по значению и содержащих две цифры в числителе и знаменателе.
≈сли произведение этих четырех дробей дано в его наименьших общих выражени€х, найдите значение знаменател€.

Upon speculation, there are 4 cases for this problem:
1) ab/bc = a/c
2) ab/ac = b/c
3)ab/ca = b/c
4)ab/cb = a/c (b != 0)
After some algebra, you find that #2 and #4 don't work.

Since there are three digits a, b, c, I used 3 nested for-loops (O(n^3), but there were only 9 digits to test so it was okay).