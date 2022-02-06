2VARIABLE B  15. B 2!  2VARIABLE N  21. N 2!
: D10^  ( i -- d10^i )   1. ROT 0 DO 10 1 M*/ LOOP 
 ;
: MAIN  ( dlim -- dresult )
   BEGIN
      B 2@ 4 1 M*/  N 2@ 3 1 M*/ D+ 3. D-
      B 2@ 3 1 M*/  N 2@ D2* D+ 2. D-  B 2!
      2DUP N 2!  2OVER D< 0=
   UNTIL ;
12 D10^  MAIN  B 2@ D.
\EOF 756872327473
Arranged probability
Problem 100
If a box contains twenty-one coloured discs, composed of fifteen blue discs and six red discs, and two discs were taken at random, it can be seen that the probability of taking two blue discs, P(BB) = (15/21)*(14/20) = 1/2.
The next such arrangement, for which there is exactly 50% chance of taking two blue discs at random, is a box containing eighty-five blue discs and thirty-five red discs.
By finding the first arrangement to contain over 10^12 = 1,000,000,000,000 discs in total, determine the number of blue discs that the box would contain.

ќрганизованна€ веро€тность
≈сли в коробке находитс€ двадцать один цветной диск, состо€щий из п€тнадцати синих дисков и шести красных дисков, и два диска были вз€ты наугад, можно увидеть, что веро€тность вз€ть два синих диска, P (BB) = (15/21 ) * (14/20) = 1/2.
—ледующа€ така€ компоновка, дл€ которой есть ровно 50% шанс вз€ть два синих диска наугад, - это коробка, содержаща€ восемьдес€т п€ть синих дисков и тридцать п€ть красных дисков.
Ќайд€ первое расположение, содержащее более 10 ^ 12 = 1 000 000 000 000 дисков, определите количество синих дисков, которое будет содержать коробка.