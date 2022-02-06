REQUIRE FLOATS lib/include/float2.f  FINIT
VARIABLE SUM 0 ,  0 VALUE LIM
: S?  ( a b -- ? )   \ s=sqrt(4*b^2-a^2)*a/4  is int?
   SWAP DUP UM* D2* D2*  2 PICK DUP UM*  D- 
   D>F FSQRT  0 D>F F* 4. D>F F/ FDUP FROUND F= ;   
: PER  ( a b -- per )   2DUP . . ." = " 2 * + DUP . CR ;
: CALC  ( a b -- 0 | per )   2DUP S? IF PER EXIT THEN  2DROP 0 ;
: FORMULA  ( n0 n1 n2 -- n1 n2 n3 )   2DUP 3 * SWAP 3 * + 3 ROLL - ;
: A+-  ( u -- u per )   DUP 1+ 2DUP CALC DUP IF EXIT ELSE DROP THEN 2DUP 2- CALC ; 
: BRUT1  ( lim -- sum )   TO LIM  1 1 5
    A+- SUM +!  DROP 
    BEGIN FORMULA A+- DUP LIM < 
    WHILE  SUM +! DROP
    REPEAT DROP 2DROP 2DROP ;
1000000000 BRUT1 SUM @ .
\EOF  518408346
: BRUT  ( limit -- dsum )   0. D>F
   1 BEGIN 1+ DUP 3 * 1+ 
      2 PICK <
   WHILE  DUP DUP 1+ 2DUP
      CALC SWAP CALC
   REPEAT DUP 1+ CALC DROP
    ;
21143986 21143985
Almost equilateral triangles
Problem 94
It is easily proved that no equilateral triangle exists with integral length sides and integral area. However, the almost equilateral triangle 5-5-6 has an area of 12 square units.
We shall define an almost equilateral triangle to be a triangle for which two sides are equal and the third differs by no more than one unit.
Find the sum of the perimeters of all almost equilateral triangles with integral side lengths and area and whose perimeters do not exceed one billion (1,000,000,000).

ѕочти равносторонние треугольники
Ќетрудно доказать, что не существует равностороннего треугольника со сторонами целой длины и площадью. ќднако почти равносторонний треугольник 5-5-6 имеет площадь 12 квадратных единиц.
ћы определим почти равносторонний треугольник как треугольник, у которого две стороны равны, а треть€ отличаетс€ не более чем на одну единицу.
Ќайдите сумму периметров всех почти равносторонних треугольников с целыми длинами сторон и площадью, периметры которых не превышают одного миллиарда (1 000 000 000).