0 VALUE RCT#
: RECT  ( x y -- )   0
   OVER 0 DO 2 PICK 0 DO OVER J - 3 PICK I - * + LOOP LOOP TO RCT# 2DROP ;
: BRUT  ( # -- u )   0.
   200 1 DO
      200 I DO I J RECT 
         DUP 3 PICK - ABS
         3 PICK RCT# - ABS >
         IF 2DROP I J * RCT# THEN
         2 PICK RCT# < IF LEAVE THEN
      LOOP
   LOOP DROP NIP ;
2000000 BRUT .
\EOF 2772
Counting rectangles
Problem 85
By counting carefully it can be seen that a rectangular grid measuring 3 by 2 contains eighteen rectangles:
Although there exists no rectangular grid that contains exactly two million rectangles, find the area of the grid with the nearest solution.

Подсчет прямоугольников
Тщательно посчитав, можно увидеть, что прямоугольная сетка размером 3 на 2 содержит восемнадцать прямоугольников:
Хотя не существует прямоугольной сетки, содержащей ровно два миллиона прямоугольников, найдите площадь сетки с ближайшим решением.
