: PRIME?  ( u -- ? )   ABS  \ is u a prime number
DUP 2 < IF  DROP 0 EXIT ELSE DUP 4 < IF EXIT THEN THEN
DUP 2 DO DUP I MOD IF ELSE DROP 0 UNLOOP EXIT THEN LOOP ;
: FORM  ( b a -- # )   0 >R  \ n^2 + an + b, where |a| < 1000 and |b| <= 1000
   BEGIN  2DUP
      R@ * + R@ DUP * +
      PRIME? 
   WHILE  R> 1+ >R
   REPEAT 2DROP R> ;
: BRUT  ( -- u )  0 0
   1000 -1000 DO
      1001 -1000 DO
         I J FORM 2DUP < IF SWAP DROP SWAP DROP I J * SWAP ELSE DROP THEN
      LOOP
   LOOP DROP ;
BRUT .

: CHECK 1000 0 DO I PRIME? IF I . CR THEN LOOP ;

\EOF
Quadratic primes
Problem 27
Euler discovered the remarkable quadratic formula:

n^2 + n + 41
It turns out that the formula will produce 40 primes for the consecutive integer values 0 \le n \le 39. However, when n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41^2 + 41 + 41 is clearly divisible by 41.
The incredible formula n^2 - 79n + 1601 was discovered, which produces 80 primes for the consecutive values 0 \le n \le 79$. The product of the coefficients, -79 and 1601, is -126479.
Considering quadratics of the form:
n^2 + an + b, where |a| < 1000$ and |b| \le 1000$ where |n| is the modulus/absolute value of n e.g. |11| = 11 and |-4| = 4
Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0


����� ������ ������������� ������������ �������:
� ^ 2 + � + 41
�����������, ������� ���� 40 ������� ����� ��� ���������������� ������������� �������� 0 \ le n \ le 39. ������, ����� n = 40, 40 ^ 2 + 40 + 41 = 40 (40 + 1) + 41 ������� �� 41 , �, ������� ��, ����� n = 41, 41 ^ 2 + 41 + 41 ���� ������� �� 41.
���� ������� ����������� ������� n ^ 2 - 79n + 1601, ������� ���� 80 ������� ����� ��� ���������������� �������� 0 \ le n \ le 79 $. ������������ ������������� -79 � 1601 ����� -126479.
������������ ������������ �����:
n ^ 2 + an + b, ��� | a | <1000 $ � | b | \ le 1000 $, ��� | n | ������ / ���������� �������� n, �������� | 11 | = 11 � | -4 | = 4
������� ������������ ������������� a � b ��� ������������� ���������, ������� ���� ������������ ���������� ������� ����� ��� ���������������� �������� n, ������� � n = 0.