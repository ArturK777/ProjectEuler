REQUIRE CONCAT ~micro\lib\str.f
: RDMATRIX ( $ -- adr )   \ read file.txt into adr
   80 DUP * CELLS ALLOCATE THROW -ROT
   SOURCE-NAME CUT-PATH 2SWAP CONCAT R/O OPEN-FILE THROW
   >R DUP 0
   BEGIN PAD OVER + DUP 1 R@ READ-FILE THROW
   WHILE C@ DUP 44 = SWAP 10 = OR 
      IF DROP  \ conv char buffer to num
         0. PAD 4 >NUMBER 2DROP DROP OVER ! CELL+
         PAD 5 ERASE 0
      ELSE 1+ 
      THEN
   REPEAT 2DROP DROP
   R> CLOSE-FILE THROW ;
: MXY  ( x y -- # )  80 * + CELLS ;
: SUM-LR  ( adr -- sum )   80 CELLS ALLOCATE THROW
   80 0 DO OVER 79 I MXY + @ OVER I CELLS + ! LOOP
   0 78 DO OVER I 0 MXY + @ OVER @ + OVER !
      80 1 DO 
         OVER J I MXY + @
         OVER DUP I CELLS + @
         SWAP I 1- CELLS + @
         MIN + OVER I CELLS + !
      LOOP
      0 78 DO
         OVER J I MXY + @
         OVER I 1+ CELLS + @ +
         OVER I CELLS + @ MIN
         OVER I CELLS + !
      -1 +LOOP
   -1 +LOOP NIP
   999999 80 0 DO OVER I CELLS + @ MIN LOOP NIP ;
S" p082_matrix.txt" RDMATRIX SUM-LR .

\EOF 260324
Path sum: three ways
Problem 82
NOTE: This problem is a more challenging version of Problem 81.
The minimal path sum in the 5 by 5 matrix below, by starting in any cell in the left column and finishing in any cell in the right column, and only moving up, down, and right, is indicated in red and bold; the sum is equal to 994.
Find the minimal path sum from the left column to the right column in matrix.txt (right click and "Save Link/Target As..."), a 31K text file containing an 80 by 80 matrix.