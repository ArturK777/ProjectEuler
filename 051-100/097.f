: 2^  ( i -- ud )   1. ROT 0
   DO D2* 2DUP 0 3 D< 0=
      IF <# #S #> SWAP 1+ SWAP 1-
         0. 2SWAP >NUMBER 2DROP 
      THEN
   LOOP ;
7830457 2^ 28433 1 M*/ 1. D+ <# #S #> 10 - + 10 TYPE
\EOF 8739992577
Large non-Mersenne prime
Problem 97
The first known prime found to exceed one million digits was discovered in 1999, and is a Mersenne prime of the form 2^6972593-1; it contains exactly 2,098,960 digits. Subsequently other Mersenne primes, of the form 2^p-1, have been found which contain more digits.
However, in 2004 there was found a massive non-Mersenne prime which contains 2,357,207 digits: 28433 * 2^7830457+1.
Find the last ten digits of this prime number.

������� ������� ����� �� ��������
������ ��������� ������� �����, ����������� ���� ������� ����, ���� ���������� � 1999 ���� � ������������ ����� ������� ����� �������� � ����� 2 ^ 6972593-1; �� �������� ����� 2 098 960 ����. ������������ ���� ������� ������ ������� ����� �������� � ����� 2 ^ p-1, ������� �������� ������ ����.
������ � 2004 ���� ���� ���������� ��������� ������� �����, �������� �� ����� ��������, ������� �������� 2 357 207 ����: 28433 * 2 ^ 7830457 + 1.
������� ��������� ������ ���� ����� �������� �����.
