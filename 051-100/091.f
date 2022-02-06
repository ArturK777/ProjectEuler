: GCD  ( n m -- u )   \ Greatest Common Divisor
   2DUP > IF SWAP THEN
   OVER MOD DUP
   IF RECURSE ELSE DROP THEN ;
: #TRI  ( size -- # )   DUP 2DUP 3 * * SWAP
   1+ 1 DO
      OVER 1+ 1 DO
         J I GCD
         2 PICK J - OVER * I /
         SWAP I * J / MIN 2* +
      LOOP
   LOOP NIP ;
50 #TRI .
\EOF 14234
Right triangles with integer coordinates
Problem 91
The points P (x1, y1) and Q (x2, y2) are plotted at integer co-ordinates and are joined to the origin, O(0,0), to form ?OPQ.
There are exactly fourteen triangles containing a right angle that can be formed when each co-ordinate lies between 0 and 2 inclusive; that is,
0 <= x1, y1, x2, y2 <= 2.
Given that 0 <= x1, y1, x2, y2 <= 50, how many right triangles can be formed?

Прямоугольные треугольники с целыми координатами
Точки P (x1, y1) и Q (x2, y2) нанесены на график в целочисленных координатах и соединены с началом координат O (0,0), чтобы сформировать OPQ.
Есть ровно четырнадцать треугольников, содержащих прямой угол, который может быть образован, если каждая координата находится между 0 и 2 включительно; это,
0 <= x1, y1, x2, y2 <= 2.
Учитывая, что 0 <= x1, y1, x2, y2 <= 50, сколько прямоугольных треугольников можно сформировать?
