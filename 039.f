: BRUT  ( border -- p-max # )  0 SWAP 0 SWAP 1+ 6 
   DO 0  I 3 / 2 
      ?DO
         J J 2 I * - * 2 J I - * MOD 0=
         IF 1+ THEN
      LOOP
      2DUP < 
      IF NIP NIP I SWAP ELSE DROP THEN
   2 +LOOP  ;
1000 BRUT . CR .

\EOF 840
Integer right triangles
Problem 39
If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.
{20,48,52}, {24,45,51}, {30,40,50}
For which value of p <= 1000, is the number of solutions maximised?

������������� ������������� ������������
�������� 39
���� p - �������� �������������� ������������ �� ��������� ����� �����, {a, b, c}, ���������� ����� ��� ������� ��� p = 120.
{20,48,52}, {24,45,51}, {30,40,50}
��� ������ �������� p <= 1000, ����������� �� ���������� �������?

This can be implemented in C# as
	
long result = 0, resultSolutions = 0;
for (long p = 2; p <= 1000; p += 2) {
    int numberOfSolutions = 0;
    for (long a = 2; a < (p/3); a++) { if(p*(p-2*a) % (2*(p-a)) == 0){ numberOfSolutions++; } } if(numberOfSolutions > resultSolutions){
        resultSolutions = numberOfSolutions;
        result = p;
    }
}