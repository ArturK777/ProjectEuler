: EVEN ( d -- d ) D2/ ;
: ODD ( d -- d ) 3 1 M*/ 1 M+ ;
: WINNER ( i0 n0 i n -- iMax nMax ) DUP 3 PICK > IF 2SWAP THEN 2DROP ;
: COUNT- ( start -- number ) 0.
        BEGIN 1+ -ROT
                2DUP 2DUP D2/ D2* D= INVERT \ if dword odd ?
                IF ODD ELSE EVEN THEN
                2DUP 1. D- D0= >R ROT R>
        UNTIL >R 2DROP R> 1+ ;
: BRUT 1+ 0. 12 3 ROLL SWAP DO I DUP COUNT- WINNER LOOP ;
1000000  BRUT DROP .

\EOF 837799
Problem 14
The following iterative sequence is defined for the set of positive integers:
n > n/2 (n is even)
n > 3n + 1 (n is odd)
Using the rule above and starting with 13, we generate the following sequence:
13 > 40 > 20 > 10 > 5 > 16 > 8 > 4 > 2 > 1
It can be seen that this sequence (starting at 13 and finishing at 1)
contains 10 terms. Although it has not been proved yet (Collatz Problem),
it is thought that all starting numbers finish at 1.
Which starting number, under one million, produces the longest chain?
NOTE: Once the chain starts the terms are allowed to go above one million.


Ñëåäóþùàÿ èòåðàöèîííàÿ ïîñëåäîâàòåëüíîñòü îïðåäåëåíà
äëÿ íàáîðà íàòóðàëüíûõ ÷èñåë:
n> n / 2 (n ÷åòíî)
n> 3n + 1 (n íå÷åòíîå)
Èñïîëüçóÿ ïðèâåäåííîå âûøå ïðàâèëî è íà÷èíàÿ ñ 13,
ìû ãåíåðèðóåì ñëåäóþùóþ ïîñëåäîâàòåëüíîñòü:
13> 40> 20> 10> 5> 16> 8> 4> 2> 1
Âèäíî, ÷òî ýòà ïîñëåäîâàòåëüíîñòü (íà÷èíàÿ ñ 13 è çàêàí÷èâàÿ 1)
ñîäåðæèò 10 òåðìèíîâ.
Õîòÿ ýòî åùå íå äîêàçàíî (ïðîáëåìà Êîëëàòöà),
ñ÷èòàåòñÿ, ÷òî âñå ñòàðòîâûå íîìåðà çàêàí÷èâàþòñÿ íà 1.
Êàêîå íà÷àëüíîå ÷èñëî, ìåíüøåå ìèëëèîíà, äàåò ñàìóþ äëèííóþ
öåïî÷êó?
ÏÐÈÌÅ×ÀÍÈÅ: Êàê òîëüêî öåïî÷êà íà÷èíàåòñÿ,
òåðìèíû ìîãóò ïðåâûøàòü îäèí ìèëëèîí.
