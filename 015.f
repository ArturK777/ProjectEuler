: FORMULA ( size -- d-paths ) DUP 0
        DO DUP
                2* 2SWAP ROT I - 1 M*/
                I 1+ 1 SWAP M*/ ROT
        LOOP DROP ;
1. 20 FORMULA D.

\EOF 137846528820 решение подсмотрел https://www.mathblog.dk/project-euler-15/
(Starting in the top left corner of a 2?2 grid,
and only being able to move to the right and down,
there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20?20 grid?

Ќачина€ с верхнего левого угла сетки 2Ц2,
и только возможность двигатьс€ вправо и вниз,
в правом нижнем углу ровно 6 маршрутов.
—колько существует таких маршрутов через сетку 20 на 20?
