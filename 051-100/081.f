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
: SUM-MIN  ( adr -- sum )
   0 78 DO
      I 79 MXY OVER + DUP @ I 1+ 79 MXY 3 PICK + @ + SWAP !
      79 I MXY OVER + DUP @ 79 I 1+ MXY 3 PICK + @ + SWAP !
   -1 +LOOP
   0 78 DO
      0 78 DO
         I J MXY OVER + DUP @ 
         I J 1+ MXY 3 PICK + @ 
         I 1+ J MXY 4 PICK + @ 
         MIN + SWAP !  
      -1 +LOOP
   -1 +LOOP @ ;
S" p081_matrix.txt" RDMATRIX SUM-MIN .

: CHKMTRX  ( adr -- )   80 0 DO 80 0 DO DUP @ . CELL+ LOOP CR CR LOOP ;
\EOF 427337
Path sum: two ways
Problem 81
In the 5 by 5 matrix below, the minimal path sum from the top left to the bottom right, by only moving to the right and down, is indicated in bold red and is equal to 2427.
Find the minimal path sum from the top left to the bottom right by only moving right and down in matrix.txt (right click and "Save Link/Target As..."), a 31K text file containing an 80 by 80 matrix.