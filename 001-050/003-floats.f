REQUIRE FLOATS lib/include/float.f
FINIT \ initialize FPU
600851475143. 2CONSTANT N
: F>S  ( f -- u )   F>D D>S ;
: PRIME2?  ( u -- flag )   \ is 5 <= u (odd) a prime number - short ver
   DUP 3 DO DUP I MOD IF ELSE DROP 0 LEAVE THEN 2 +LOOP ;
: BRUT  ( start -- u )   DUP 2 MOD 0= IF 1+ THEN
   BEGIN
      2- DUP PRIME2? 
      IF N 2 PICK UM/MOD DROP 0= ELSE 0 THEN
   UNTIL ;
N D>F FSQRT F>S BRUT .

\EOF 
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?

Ïðîñòûå ìíîæèòåëè 13195: 5, 7, 13 è 29.
Êàêîé ñàìûé áîëüøîé ïðîñòîé äåëèòåëü ÷èñëà 600 851 475 143?
