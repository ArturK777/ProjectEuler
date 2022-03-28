ms@ VALUE STOPWATCH
2VARIABLE TEMP
: MAIN  ( power -- du )   DUP 
   10 0 DO I 1+ 0 PAD I 2* CELLS + 2! LOOP
   9. ROT 1 DO 0.
      10 0 DO PAD I 2* CELLS + 2@ D+ LOOP  2DUP TEMP 2!
      D2* D+  PAD 18 CELLS + 2@ -10 M+ D-
      0 9 DO 
         PAD I 2* CELLS + 2@
         TEMP 2@ 2DUP PAD I 2* CELLS + 2!
         2SWAP D- TEMP 2!
      -1 +LOOP
   LOOP ROT 1- 20 * NEGATE M+ ;
100 MAIN D.
ms@ STOPWATCH - CR . .( ms) CR

\EOF 51161058134250 0 ms
Problem 113
Non-bouncy numbers

Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number; for example, 134468.
Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.
We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.
As n increases, the proportion of bouncy numbers below n increases such that there are only 12951 numbers below one-million that are not bouncy and only 277032 non-bouncy numbers below 10^10.
How many numbers below a googol (10^100) are not bouncy?

���������� �����
������� ����� �������, ���� �� ���� ����� �� ��������� ����� ����� �� ���, ��� ���������� ������������ ������; ��������, 134468.
����� ��� ��, ���� �� ���� ����� �� ��������� ����� ������ �� ���, ��� ���������� ��������� ������; ��������, 66420.
�� ����� �������� ������������� ����� �����, ������� �� ������������� � �� �����������, ��������� ������; ��������, 155349.
�� ���� ���������� n ���� �������� ����� ���� n �������������, ��� ��� ������ 12 951 ����� ������ ������ �������� �� �������� ���������, � ������ 277 032 �� �������� ����� ������ 10^10.
������� ����� ���� ������ (10^100) �� �������� ���������?