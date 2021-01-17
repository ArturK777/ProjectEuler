: POW ( n -- n*n ) DUP * ; \ n**
: BRUT 
BEGIN \ c
	DUP 1- 1 ?DO I 2+ 1 \ b
		?DO \ a
			DUP J I  + + 1000 = \ check sum 
			IF DUP POW J POW I POW + = \ check mult
				IF J  I * * UNLOOP UNLOOP EXIT THEN 
			THEN
		LOOP
	LOOP 1- 
	DUP 1 = 
UNTIL ; 

997 BRUT . 

\EOF 31875000 (200 < 375 < 400)
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

Ïèôàãîðîâà òðîéêà - ýòî íàáîð èç òðåõ íàòóðàëüíûõ ÷èñåë a <b <c, äëÿ êîòîðûõ,
à2 + Ü2 = ñ2
Íàïðèìåð, 32 + 42 = 9 + 16 = 25 = 52.
Ñóùåñòâóåò ðîâíî îäíà ïèôàãîðîâà òðîéêà, äëÿ êîòîðîé a + b + c = 1000.
Íàéäèòå ïðîäóêò abc.
==========================================================================
ttah  Ukraine   
Thu, 10 May 2007, 11:26
Bruteforce (1..a..333;a..b..(1000-a)/2;c=1000-a-b) with bacforth in SPF
 


REQUIRE PRO ~profit/lib/bac4th.f
REQUIRE { lib/ext/locals.f

: INTS=> ( a b --> n \ <-- ) PRO ?DO I CONT DROP LOOP ;
: SQR ( x -- x*x ) DUP * ;
: r 
   1000 3 / 2 INTS=> 
    1000 OVER - 2 / OVER 
    INTS=> 
     2DUP + 1000 SWAP - { c }
     2DUP SQR SWAP SQR + c SQR = IF 2DUP * c * . THEN ;

r
-----------------------------------------------------------------------------
wsoft  Netherlands
Tue, 19 Dec 2006, 21:11
\ Forth solution. Didn't try to be too smart with this one.
\ Just 3 global vars and simple brute force it....
\ Found 0 500 500 as first answer so changed range of a from 0-1000 to 1-1000, so this version only result in single result.

0 value a
0 value b
0 value c

: check
        a a * b b * + c c * - 0= ;

: l
        1000 1 do I to a
                1000 a do I to b
                        1000 a - b - to c
                        check if
                                a . b . c . cr
                        then
                loop
        loop ;
