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
