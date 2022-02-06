VARIABLE Result
: SQRT  ( n -- 2'n )   \ int SQRT { FD-V12N1 }
   1 10 0 DO 2DUP / + 2/ LOOP NIP ;
: GCD  ( n m -- u )   \ Greatest Common Divisor 
   2DUP > IF SWAP THEN
   OVER MOD DUP
   IF RECURSE ELSE DROP THEN ;
: TRI  ( limit -- )
   1+ DUP ALLOCATE THROW 
   OVER 2/ SQRT
   2 DO I 1     
      ?DO
         I J + 2 MOD I J GCD 1 =  AND
         IF J J *  I I *  2DUP + 
            -ROT - 2 I J * * + +
            DUP >R
            BEGIN DUP 3 PICK < 
            WHILE 2DUP + DUP 1+! C@
               DUP 1 =
               IF DROP Result 1+!
               ELSE 2 = IF -1 Result +! THEN
               THEN R@ +
            REPEAT R> 2DROP
         THEN
      LOOP
   LOOP 2DROP ;
1500000 TRI Result @ .
\EOF 161667

\ BRUT fail - too long
0 VALUE SQR
: TRI  ( limit  -- adr )   \ plot all existing integer sided right angle triangles
   DUP 5 / DUP CELLS ALLOCATE THROW  2DUP SWAP ERASE
   0 3 PICK 2/ 3 DO  I 1000 MOD 0= IF I . CR THEN 
      3 PICK 2/ I ?DO
         J J M* I I M* D+ 2DUP D>F FSQRT F>D D>S DUP 7 PICK SWAP I J + + <
         IF DROP 2DROP LEAVE
         ELSE DUP TO SQR DUP M* 
            D= 
            IF
               2DUP J I SQR + + -ROT CELLS + !
               1+ 
               \ DUP .
               DUP 3 PICK > ABORT" Need more mem "
               \ J . I . SQR . 
               
            THEN
         THEN
      LOOP
   LOOP
;

Singular integer right triangles
Problem 75
It turns out that 12 cm is the smallest length of wire that can be bent to form an integer sided right angle triangle in exactly one way, but there are many more examples.
12 cm: (3,4,5)
24 cm: (6,8,10)
30 cm: (5,12,13)
36 cm: (9,12,15)
40 cm: (8,15,17)
48 cm: (12,16,20)
In contrast, some lengths of wire, like 20 cm, cannot be bent to form an integer sided right angle triangle, and other lengths allow more than one solution to be found; for example, using 120 cm it is possible to form exactly three different integer sided right angle triangles.
120 cm: (30,40,50), (20,48,52), (24,45,51)
Given that L is the length of the wire, for how many values of L <= 1,500,000 can exactly one integer sided right angle triangle be formed?

������ ����� ������������� ������������
�����������, 12 �� - ��� ���������� ����� �������, ������� ����� �������, ����� ����� � ���� ������� ���������� ������������� ������������� �����������, �� ���� ��� ����� ��������.
12 ��: (3,4,5)
24 ��: (6,8,10)
30 ��: (5,12,13)
36 ��: (9,12,15)
40 ��: (8,15,17)
48 ��: (12,16,20)
��������, ��������� ������� ���������, �������� 20 ��, ������ �������, ����� ���������� ������������� ����������� � ������ ���������, � ������ ����� ��������� ����� ����� ������ �������; ��������, ��������� 120 ��, ����� ���������� ����� ��� ��������� ������������� ������������� ������������.
120 ��: (30,40,50), (20,48,52), (24,45,51)
��������, ��� L - ��� ����� �������, ��� �������� �������� L <= 1,500,000 ����� �� ���������� ����� ���� ������������� ����������� � ������ ���������?