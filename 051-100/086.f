FINIT
: SQRT  ( n -- 2^n )   \ int SQRT { FD-V12N1 }
   1 15 0 DO 2DUP / + 2/ LOOP NIP ;
: CUBOID  ( border -- u )   0 2
   BEGIN 1+ DUP 2* 1+ 3
      DO DUP DUP * I I * + DUP SQRT 0 D>F 0 D>F FSQRT F- F0= 
         IF DUP I < 0= IF I 2/ ELSE DUP I 1+ 2/ - 1+ THEN ROT + SWAP THEN
      LOOP >R 2DUP < R> SWAP
   UNTIL NIP NIP ;
1000000 CUBOID . 
\EOF 1818
Cuboid route
Problem 86
A spider, S, sits in one corner of a cuboid room, measuring 6 by 5 by 3, and a fly, F, sits in the opposite corner. By travelling on the surfaces of the room the shortest Уstraight lineФ distance from S to F is 10 and the path is shown on the diagram.
However, there are up to three УshortestФ path candidates for any given cuboid and the shortest route is not always integer.
By considering all cuboid rooms with integer dimensions, up to a maximum size of M by M by M, there are exactly 2060 cuboids for which the shortest distance is integer when M=100, and this is the least value of M for which the number of solutions first exceeds two thousand; the number of solutions is 1975 when M=99.
Find the least value of M such that the number of solutions first exceeds one million.

 убовидный маршрут
ѕаук S сидит в одном углу пр€моугольной комнаты размером 6 на 5 на 3, а муха F сидит в противоположном углу. ѕри перемещении по поверхности комнаты кратчайшее Ђпр€моеї рассто€ние от S до F равно 10, и путь показан на диаграмме.
ќднако существует до трех кандидатов на Ђкратчайшийї путь дл€ любого данного кубоида, и кратчайший путь не всегда целочислен.
≈сли рассматривать все кубоидные комнаты с целочисленными размерами, вплоть до максимального размера M на M на M, имеетс€ ровно 2060 кубоидов, дл€ которых кратчайшее рассто€ние €вл€етс€ целым числом, когда M = 100, и это наименьшее значение M, дл€ которого число первых решений превышает две тыс€чи; количество решений - 1975 при M = 99.
Ќайдите наименьшее значение M, при котором количество решений сначала превышает один миллион.