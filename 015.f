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
===========================================
roelschlaeger  USA   Forth
Sun, 13 Sep 2020, 23:47
Forth (gForth)
==============

do_problem_15 
============= 
xxxxxxxxxxxx 

real    0m0.009s
user    0m0.004s
sys     0m0.002s

forth



#! /usr/bin/gforth

\ Version 1

\ Lattice paths
\
\ Problem 15
\ 
\ Starting in the top left corner of a 2?2 grid, and only being
\ able to move to the right and down, there are exactly 6 routes
\ to the bottom right corner.
\ 
\ How many such routes are there through a 20?20 grid?


[ifdef] empty
    empty
    marker empty
[then]

\ There are N choices to be selected from 2N possibilities.
\
\        2N
\   C = (   )
\         N
\
\ For the 20x20 grid, the problem boils down to the computation
\ of comb(40, 20) without overflowing. This devolves to the
\ computation of
\
\       40!
\   -----------
\   (20! * 20!)
\
\ Expanding each of the factorialss and arranging the dividend
\ we have
\
\   40 x 39 x 38 x 37 x ... 22 x 21
\   -------------------------------
\   20 x 19 x 18 x 17 x ...  2 x 1
\
\ Continuing, the first 10 terms of the divisor are *2 multiples
\ of terms in the dividend
\
\   2 x 39 x 2 x 37 x ... 2 x 21
\   ----------------------------
\   10 x 9 x 8 x 7 x ...  2 x 1 
\
\ Further, all of the divisor terms can cancel factors of the
\ numerator, resulting in
\
\   13 x 37 x 35 x 11 x 31 x 29 x 2 x 9 x 2 x 23
\
\ which does not overflow the range of the 64-bit 2's complement
\ arithmetic.
\

: do_problem_15                 ( --- n )
    13 37 * 35 * 11 * 31 * 29 * 2 * 9 * 2 * 23 * 
    ;

cr .( do_problem_15 )
cr .( ============= )
cr do_problem_15 .
cr
             

