: CHOOSE ( n k -- u )   2DUP - MIN  DUP -ROT -  
   1 2 PICK 1+ 1 ?DO OVER I + * I / LOOP  NIP NIP ;
: CATAL  ( n -- u )   DUP 2* OVER CHOOSE SWAP 1+ / ;
: META  ( n -- result )
   DUP 2/ 1+ 2 0 -ROT DO
      OVER DUP I CHOOSE SWAP I - I CHOOSE * 2/ +
      OVER I 2* CHOOSE I CATAL * -
   LOOP NIP ;
12 META . 
\EOF
Problem 106
Special subset sums: meta-testing
Let S(A) represent the sum of elements in set A of size n. We shall call it a special sum set if for any two non-empty disjoint subsets, B and C, the following properties are true:
1. S(B) <> S(C); that is, sums of subsets cannot be equal.
2. If B contains more elements than C then S(B) > S(C).
For this problem we shall assume that a given set contains n strictly increasing elements and it already satisfies the second rule.
Surprisingly, out of the 25 possible subset pairs that can be obtained from a set for which n = 4, only 1 of these pairs need to be tested for equality (first rule). Similarly, when n = 7, only 70 out of the 966 subset pairs need to be tested.
For n = 12, how many of the 261625 subset pairs that can be obtained need to be tested for equality?
NOTE: This problem is related to Problem 103 and Problem 105.

����������� ����� �����������: ����-������������
����� S(A) ������������ ����� ����� ��������� ��������� A ������� n. �� ����� �������� ��� ����������� ����������� ����������, ���� ��� ����� ���� �������� ���������������� ����������� B � C ����� ��������� ��������:
1. S(B) <> S(C); �� ���� ����� ����������� �� ����� ���� �����.
2. ���� B �������� ������ ���������, ��� C, �� S(B) > S(C).
��� ���� ������ ����� �������, ��� ������ ��������� �������� n ������ ������������ ��������� � ��� ������������� ������� �������.
�����������, �� �� 25 ��������� ��� �����������, ������� ����� �������� �� ���������, ��� �������� n = 4, ������ 1 �� ���� ��� ����� ��������� �� ��������� (������ �������). ����� ��� ��, ����� n = 7, ���������� ��������� ������ 70 �� 966 ��� �����������.
��� n = 12 ������� �� 261 625 ��� �����������, ������� ����� ��������, ����� ��������� �� ���������?