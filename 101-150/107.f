ms@ VALUE STOPWATCH
REQUIRE CONCAT ~micro/lib/str.f
40 DUP CONSTANT MSIZE  DUP * ALLOCATE THROW CONSTANT DJSET 
: DJSINIT  ( -- )   DJSET MSIZE 0 DO I 1+ OVER C! MSIZE + LOOP DROP ; 
: OPEN  ( $ -- fid )   SOURCE-NAME CUT-PATH 2SWAP CONCAT R/O OPEN-FILE THROW ;
: RD_MTRX  ( fid -- adr )  MSIZE  \ read matrix to adr
   DUP DUP * CELLS ALLOCATE THROW DUP >R  ROT >R
   BEGIN PAD 200 2DUP ERASE R@ READ-LINE THROW SWAP >R
   WHILE -1 2 PICK 1- 0 
      DO DUP BEGIN 1+ DUP PAD + C@ 44 = UNTIL 
         DUP >R OVER - SWAP PAD + 1+ SWAP
         0. 2SWAP >NUMBER  2DROP DROP
         OVER ! CELL+  R>
      LOOP R>  OVER - 1- SWAP PAD + 1+ SWAP
      0. 2SWAP >NUMBER  2DROP DROP OVER ! CELL+
   REPEAT 2DROP R> DROP R> CLOSE-FILE THROW  R> ;
: EDGES  ( adr -- total_weight # adr' )  \ create sorted set of # tuples <weight,vertex,vertex> in adr'
   HERE >R 0.
   MSIZE 0 DO  I 0 ?DO
         2 PICK J MSIZE * I + CELLS + @ ?DUP 0>
         IF DUP , + J 1+ , I 1+ , SWAP 1+ SWAP THEN
   LOOP LOOP ROT DROP SWAP R> SWAP 0 
   BEGIN >R OVER R@ 3 * CELLS + @ 2 PICK R@ 3 * 3 + CELLS + @ 2DUP >
      IF 3 PICK R@ 3 * CELLS + ! 2 PICK R@ 3 * 3 + CELLS + !
         OVER R@ 3 * CELLS + CELL+ DUP @ SWAP CELL+ DUP @ SWAP
         2 CELLS + DUP @ SWAP CELL+ DUP @ SWAP
         3 CELLS - DUP >R ! R> CELL- DUP >R ! R>
         4 CELLS + DUP >R ! R> CELL- !
         R> DUP IF 1- THEN  
      ELSE 2DROP R> 1+
      THEN 2DUP 1+ =
   UNTIL DROP SWAP ;
: PARENT  ( i -- j )   \ set j contains i
   DJSET MSIZE 0 DO MSIZE 0 DO DUP C@ 2 PICK = IF 2DROP J 1+ UNLOOP UNLOOP EXIT THEN 1+ LOOP LOOP ;
: DJCHK  ( -- )   DJSET MSIZE 0 DO MSIZE 0 DO DUP C@ . 1+ LOOP CR LOOP DROP CR ;
: ADD  ( i j -- )   >R   \ add set i to j & erase it
   1- MSIZE * DJSET + DUP >R 
   BEGIN DUP @ ?DUP WHILE SWAP 0 OVER C! 1+ REPEAT
   R> - R>  1- MSIZE * DJSET + 
   BEGIN DUP @ WHILE 1+ REPEAT
   SWAP 0 DO 2DUP  C! 1+ NIP LOOP DROP ;
: KRUSKAL  ( adr -- answer )
   EDGES  ROT >R  \ 2DUP SWAP 0 DO DUP @ . CELL+ DUP @ . CELL+ DUP @ . CELL+ CR LOOP DROP  \ check
   -1 BEGIN 1+ 2DUP 3 * 1+ CELLS + DUP @  SWAP CELL+ @
      PARENT SWAP PARENT 2DUP =  
         IF 2DROP 
         ELSE ADD 
            2DUP 3 * CELLS + @  R> SWAP - >R   \ subtract weight from total
         THEN  \ DJCHK
      2 PICK OVER 1+ =
   UNTIL DROP 2DROP R> ;

S" p107_network.txt"  OPEN RD_MTRX DJSINIT KRUSKAL . CR
ms@ STOPWATCH - . .( ms)

\EOF 259679
Problem 107
Minimal network
The following undirected network consists of seven vertices and twelve edges with a total weight of 243.
The same network can be represented by the matrix below.
    	A	B	C	D	E	F	G
A	-	16	12	21	-	-	-
B	16	-	-	17	20	-	-
C	12	-	-	28	-	31	-
D	21	17	28	-	18	19	23
E	-	20	-	18	-	-	11
F	-	-	31	19	-	-	27
G	-	-	-	23	11	27	-
However, it is possible to optimise the network by removing some edges and still ensure that all points on the network remain connected. The network which achieves the maximum saving is shown below. It has a weight of 93, representing a saving of 243 ? 93 = 150 from the original network.
Using network.txt (right click and 'Save Link/Target As...'), a 6K text file containing a network with forty vertices, and given in matrix form, find the maximum saving which can be achieved by removing redundant edges whilst ensuring that the network remains connected.

Минимальная сеть
Следующая неориентированная сеть состоит из семи вершин и двенадцати ребер с общим весом 243.
Та же сеть может быть представлена матрицей ниже.

Однако можно оптимизировать сеть, удалив некоторые ребра, и при этом гарантировать, что все точки в сети останутся связанными. Ниже показана сеть, в которой достигается максимальная экономия. Он имеет вес 93, что представляет собой экономию 243 ? 93 = 150 по сравнению с исходной сетью.

Используя network.txt (щелчок правой кнопкой мыши и «Сохранить ссылку/цель как...»), текстовый файл размером 6 КБ, содержащий сеть с сорока вершинами и представленный в матричной форме, найдите максимальную экономию, которая может быть достигнута путем удаления избыточных ребер, в то время как гарантируя, что сеть остается подключенной.