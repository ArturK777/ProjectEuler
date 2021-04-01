10 CONSTANT N
: INITPERM  ( n -- )   0 DO I 1+ PAD I + C! LOOP ;
: P@  ( i -- u )   PAD + C@ ;
: SWAPP  ( i j -- )   2DUP P@ SWAP P@ ROT PAD + C! SWAP PAD + C! ;
: NEXTPERM  ( -- ? )   \ next permutation, FALSE if no more
   N 1- 
   BEGIN DUP P@ OVER 1- P@ <
   WHILE 1- DUP 1 < IF DROP FALSE EXIT THEN
   REPEAT N
   BEGIN DUP 1- P@ 2 PICK 1- P@ <
   WHILE 1-
   REPEAT OVER 1- SWAP 1- SWAPP
   1+ N
   BEGIN 2DUP <
   WHILE OVER 1- OVER 1- SWAPP 1- SWAP 1+ SWAP
   REPEAT 2DROP TRUE ;
: CHECK  ( -- ? )
   1 P@ 10 =  2 P@ 10 =  4 P@ 10 =  6 P@ 10 =  8 P@ 10 =  OR OR OR OR IF 0 EXIT THEN
   0 P@ DUP 3 P@ >  OVER 5 P@ > OR  OVER 7 P@ > OR  SWAP 9 P@ > OR  IF 0 EXIT THEN
   0 P@ 1 P@ 2 P@ + + DUP  3 P@ 2 P@ 4 P@ + +  <>  IF DROP 0 EXIT THEN
   DUP  5 P@ 4 P@ 6 P@ + +  <>  IF DROP 0 EXIT THEN
   DUP  7 P@ 6 P@ 8 P@ + +  <>  IF DROP 0 EXIT THEN
   9 P@ 8 P@ 1 P@ + +  <>  IF 0 EXIT THEN -1 ;
: BRUT  ( -- )  
   BEGIN NEXTPERM
   WHILE CHECK  
      IF 1 8 9  8 6 7  6 4 5  4 2 3  2 1 0 
         PAD 16 + DUP 15 + SWAP
         DO P@ I C! LOOP
         PAD 16 + DUP 15 + SWAP
         DO I 16 + C@ I C@ < 
            IF PAD 16 + DUP 15 + SWAP 
               DO I C@ I 16 + C! LOOP LEAVE
            THEN   
         LOOP
      THEN
   REPEAT ;
: SHOW  ( -- )   
   PAD 32 + DUP 15 + SWAP DO I C@ DUP 9 >
   IF 10 /MOD 48 + EMIT THEN 48 + EMIT LOOP ;
N INITPERM BRUT SHOW

\EOF 6531031914842725
Magic 5-gon ring
Consider the following "magic" 3-gon ring, filled with the numbers 1 to 6, and each line adding to nine.
Working clockwise, and starting from the group of three with the numerically lowest external node (4,3,2 in this example), each solution can be described uniquely. For example, the above solution can be described by the set: 4,3,2; 6,2,1; 5,1,3.
It is possible to complete the ring with four different totals: 9, 10, 11, and 12. There are eight solutions in total.
Total	Solution Set
9	4,2,3; 5,3,1; 6,1,2
9	4,3,2; 6,2,1; 5,1,3
10	2,3,5; 4,5,1; 6,1,3
10	2,5,3; 6,3,1; 4,1,5
11	1,4,6; 3,6,2; 5,2,4
11	1,6,4; 5,4,2; 3,2,6
12	1,5,6; 2,6,4; 3,4,5
12	1,6,5; 3,5,4; 2,4,6

By concatenating each group it is possible to form 9-digit strings; the maximum string for a 3-gon ring is 432621513.

Using the numbers 1 to 10, and depending on arrangements, it is possible to form 16- and 17-digit strings. What is the maximum 16-digit string for a "magic" 5-gon ring?

���������� ��������� "���������" ������������ ������, ����������� ������� �� 1 �� 6, � ������ ����� ����������� � ������.

������� �� ������� ������� � ������� � ������ �� ���� � ���������� �������� ������� ����� (4,3,2 � ���� �������), ������ ������� ����� ������� ���������� �������. ��������, ��������������� ������� ����� ������� �������: 4,3,2; 6,2,1; 5,1,3.
����� ��������� ������ �������� ������� �������: 9, 10, 11 � 12. ����� ���������� ������ �������.
������ ����� �������
9 4,2,3; 5,3,1; 6,1,2
9 4,3,2; 6,2,1; 5,1,3
10 2,3,5; 4,5,1; 6,1,3
10 2,5,3; 6,3,1; 4,1,5
11 1,4,6; 3,6,2; 5,2,4
11 1,6,4; 5,4,2; 3,2,6
12 1,5,6; 2,6,4; 3,4,5
12 1,6,5; 3,5,4; 2,4,6

��������� ������ ������, ����� ������������ ������ �� 9 ����; ������������ ������ ��� ������ � 3 ������ - 432621513.

��������� ����� �� 1 �� 10 � � ����������� �� ������������, ����� ������������ ������ �� 16 � 17 ����. ������ ������������ 16-������� ������ ��� ����������� 5-��������� ������?