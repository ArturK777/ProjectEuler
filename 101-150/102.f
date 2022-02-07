REQUIRE CONCAT ~micro/lib/str.f
0 VALUE X1 0 VALUE X2 0 VALUE X3 0 VALUE Y1 0 VALUE Y2 0 VALUE Y3
0 VALUE Z1 0 VALUE Z2 0 VALUE Z3
: OPEN  ( $ -- fid )   SOURCE-NAME CUT-PATH 2SWAP CONCAT R/O OPEN-FILE THROW ;
: PARSE_XY  ( c-adr len -- # )   \ parse string in PAD(len) for signed nums to c-adr, ret quantity of them 
   0 1   \ # & sign 
   ROT PAD SWAP
   BEGIN OVER C@ 45 =   \ check sign
      IF ROT 2- ROT 1+ ROT 1- THEN
      0. 2SWAP >NUMBER  2SWAP DROP  OVER
   WHILE
      3 ROLL *    \ sign
      3 PICK CELLS 5 PICK + !
      1- ROT 1+ ROT 1+ ROT 1 -ROT
   REPEAT NIP NIP * -ROT DUP >R CELLS + ! R> 1+ ;
: READ  ( fid -- fid # )   >R  0    \ result
   BEGIN PAD 80 R@ READ-LINE THROW
   WHILE  \ PAD OVER TYPE CR
      PAD 80 + DUP ROT PARSE_XY DROP
      DUP @ TO X1  
      CELL+ DUP @ TO Y1
      CELL+ DUP @ TO X2
      CELL+ DUP @ TO Y2
      CELL+ DUP @ TO X3
      CELL+ @ TO Y3
\      X1 . Y1 . X2 . Y2 . X3 . Y3 . CR CR 
      X1 Y2 * X2 Y1 * - TO Z1
      X2 Y3 * X3 Y2 * - TO Z2
      X3 Y1 * X1 Y3 * - TO Z3
      \ Z1 Z2 Z3 * * 0= IF 1+ THEN
      Z1 0> Z2 0> Z3 0> AND AND IF 1+ THEN
      Z1 0< Z2 0< Z3 0< AND AND IF 1+ THEN
   REPEAT DROP R> ;
S" p102_triangles.txt"  OPEN READ CLOSE-FILE THROW .

\EOF  228
Problem 102
Triangle containment
Three distinct points are plotted at random on a Cartesian plane, for which -1000 <= x, y <= 1000, such that a triangle is formed.
Consider the following two triangles:
A(-340,495), B(-153,-910), C(835,-947)
X(-175,41), Y(-421,-714), Z(574,-645)
It can be verified that triangle ABC contains the origin, whereas triangle XYZ does not.
Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file containing the co-ordinates of one thousand "random" triangles, find the number of triangles for which the interior contains the origin.
NOTE: The first two examples in the file represent the triangles in the example given above.

Треугольник сдерживания
На декартовой плоскости случайным образом нанесены три различные точки, для которых -1000 <= x, y <= 1000, так что образуется треугольник.
Рассмотрим следующие два треугольника:
А(-340,495), В(-153,-910), С(835,-947)
X(-175,41), Y(-421,-714), Z(574,-645)
Можно проверить, что треугольник ABC содержит начало координат, а треугольник XYZ — нет.
Используя треугольники.txt (щелчок правой кнопкой мыши и «Сохранить ссылку/цель как...»), текстовый файл размером 27 КБ, содержащий координаты одной тысячи «случайных» треугольников, найдите количество треугольников, для которых внутренняя часть содержит начало координат.
ПРИМЕЧАНИЕ. Первые два примера в файле представляют собой треугольники в приведенном выше примере.