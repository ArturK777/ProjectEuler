: FORMULA ( size -- d-paths ) DUP 0
        DO DUP
                2* 2SWAP ROT I - 1 M*/
                I 1+ 1 SWAP M*/ ROT
        LOOP DROP ;
1. 20 FORMULA D.

\EOF 137846528820 ������� ���������� https://www.mathblog.dk/project-euler-15/
(Starting in the top left corner of a 2?2 grid,
and only being able to move to the right and down,
there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20?20 grid?

������� � �������� ������ ���� ����� 2�2,
� ������ ����������� ��������� ������ � ����,
� ������ ������ ���� ����� 6 ���������.
������� ���������� ����� ��������� ����� ����� 20 �� 20?
