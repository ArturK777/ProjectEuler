0x7FFFFFFF CONSTANT MAXINT
0 VALUE GRID
80 DUP CONSTANT SIZE  DUP * DUP
HERE SWAP ALLOT VALUE S  \ searched
CELLS DUP DUP 
HERE SWAP ALLOT VALUE G
HERE SWAP ALLOT VALUE F  \ h
0 VALUE SL  0 VALUE SL#  \ SortedList
ALLOCATE THROW TO SL

REQUIRE CONCAT ~micro\lib\str.f
: RDMATRIX ( $ -- )   \ read file.txt into adr
   SIZE DUP * CELLS ALLOCATE THROW -ROT
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
   R> CLOSE-FILE THROW TO GRID ;
: XY  ( x y -- # )  SIZE * + ;
: MXY  ( x y -- # )  SIZE * + CELLS ;
: MINVAL  ( adr -- adr u )   MAXINT SIZE DUP * 0 DO GRID I CELLS + @ MIN LOOP ;
: INITA  ( u -- ) 
   SIZE 0 DO SIZE 0 DO
         DUP SIZE 1- 2* 1+ I - J - *  J I MXY F + !
         MAXINT J I MXY G + !
   LOOP LOOP DROP ;
: SL-SORT  ( -- )   SL#   1- 4 CELLS * 0
   BEGIN 2DUP > 
   WHILE >R SL R@ + 2@   SL R@ + 4 CELLS + 2@   2SWAP DU<  
      IF SL R@ + 8 0 DO DUP I CELLS + @ SWAP LOOP 
         0 3 DO DUP I CELLS + SWAP >R ! R> -1 +LOOP 
         4 7 DO DUP I CELLS + SWAP >R ! R> -1 +LOOP DROP
         R> DUP 0>
         IF 16 - THEN
      ELSE  R> 16 +
      THEN 
   REPEAT 2DROP ;
: SL-ADD  ( i j k l -- )   \ SortedList : i j - key ; k l - value
   SL SL# 16 * +
   0 3 DO SWAP OVER I CELLS + ! -1 +LOOP 
   DROP  SL# 1+ TO SL#  SL-SORT ;
: SL-RM  ( # -- )   \ remove #'s element from SortedList
   DUP SL# > ABORT" Wrong index "
   SL# SWAP ?DO 4 0 DO J 1+ 16 * SL + I CELLS + DUP @ SWAP 16 - !
   LOOP LOOP  SL SL# 16 * + 16 ERASE  SL# 1- TO SL# ;
: SL-INDEX  ( x y -- # | -1 )   \ IndexOfValue
   SL# 0 ?DO SL I 16 * + 2 CELLS + DUP @ 3 PICK =
      IF CELL+ @ OVER = IF 2DROP I UNLOOP EXIT THEN ELSE DROP THEN 
   LOOP 2DROP -1 ;
: SL-KEY?  ( i1 i2 -- ? )   \ SortList.ContainsKey ?
   SL# 0 ?DO SL I 16 * + DUP @ 3 PICK =
      IF CELL+ @ OVER = IF 2DROP -1 UNLOOP EXIT THEN ELSE DROP THEN 
   LOOP 2DROP 0 ;
: A*  ( -- sum )   
   GRID @ G !
   G @ F @ + 0 0. SL-ADD
   BEGIN SIZE 1- DUP XY S + C@ 2 <
   WHILE SL 2 CELLS + 2@ SWAP   \ x y ( i j )
      0 SL-RM 
      2DUP XY S + 2 SWAP C!  
      4 0 DO 2DUP
         I CASE
            0 OF SWAP 1- SWAP  ENDOF
            1 OF SWAP 1+ SWAP  ENDOF
            2 OF 1+ ENDOF
            3 OF 1- ENDOF
         ENDCASE 2DUP 2>R
         0 SIZE WITHIN SWAP 0 SIZE WITHIN AND 2R@ XY S + C@ 2 < AND
         IF 2DUP MXY G + @
            2R@ MXY G + @
            2R@ MXY GRID + @ 
            ROT + SWAP OVER >
            IF 2R@ MXY G + !
               2R@ XY S + C@ 1 =
               IF 2R@ SL-INDEX SL-RM THEN
               2R@ MXY G + @ 2R@ MXY F + @ + 0 
               BEGIN 2DUP SL-KEY?
               WHILE 1+
               REPEAT 
               2R@ SL-ADD 1 2R@ XY S + C!
            ELSE DROP 
            THEN
         THEN 2R> 2DROP
      LOOP 2DROP
   REPEAT
   SIZE 1- DUP MXY G + @ ;
 S" p083_matrix.txt" RDMATRIX MINVAL INITA A* .
\EOF 425185
 5 7 6 4 SL-ADD
 12 3 3 4 SL-ADD
 4 2 9 4 SL-ADD
  1 5 3 4 SL-ADD
  SL 100 DUMP CR
  SL-SORT
  SL 100 DUMP
: CHKMTRX  ( adr -- adr )   SIZE 0 DO SIZE 0 DO DUP @ . CELL+ LOOP CR CR LOOP ;


Path sum: four ways
Problem 83
NOTE: This problem is a significantly more challenging version of Problem 81.

In the 5 by 5 matrix below, the minimal path sum from the top left to the bottom right, by moving left, right, up, and down, is indicated in bold red and is equal to 2297.
Find the minimal path sum from the top left to the bottom right by moving left, right, up, and down in matrix.txt (right click and "Save Link/Target As..."), a 31K text file containing an 80 by 80 matrix.