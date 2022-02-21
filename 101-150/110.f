ms@ VALUE STOPWATCH
: ~PRM  CREATE  2 C, 3 C, 5 C, 7 C, 11 C, 13 C, 17 C, 19 C, 23 C, 29 C, 31 C, 37 C, DOES> + C@ ;  ~PRM PRIME 
: ~EXP  CREATE  3 C, 3 C, 2 C, 2 C, 1 C, 1 C, 1 C, 1 C, 1 C, 1 C, 1 C, 1 C, DOES> + C@ ; ~EXP EXPON
: X^Y  ( y x -- x^y )   DUP ROT 1 ?DO OVER * LOOP NIP ;
: PRIMES  ( -- du )   1.  12 0 DO I EXPON I PRIME X^Y 1 M*/ LOOP ;

PRIMES D.  CR 
ms@ STOPWATCH - . .( ms)
\EOF 9350130049860600
https://github.com/tazunemono/Project-Euler-Python/blob/master/Problem110.py

Problem 110
Diophantine reciprocals II
In the following equation x, y, and n are positive integers.
1/x + 1/y = 1/n
It can be verified that when n=1260 there are 113 distinct solutions and this is the least value of n for which the total number of distinct solutions exceeds one hundred.
What is the least value of n for which the number of distinct solutions exceeds four million?
NOTE: This problem is a much more difficult version of Problem 108 and as it is well beyond the limitations of a brute force approach it requires a clever implementation.

����������� �������� ����� II
� ��������� ��������� x, y � n � ������������� ����� �����.
1/� + 1/� = 1/n
����� ���������, ��� ��� n=1260 ���������� 113 ��������� �������, � ��� ���������� �������� n, ��� ������� ����� ���������� ��������� ������� ��������� �����.
��� ����� ���������� �������� n ����� ��������� ������� ��������� ������ ��������?
����������. ��� ������ ������������ ����� ������� ����� ������� ������ ������ 108, �, ��������� ��� ������� �� ����� ����������� ������ ������ ����, ��� ������� ����� ����������.
