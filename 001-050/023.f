0 VALUE #ABND  \ abundant quantity
0 VALUE :ABND  \ abundant list addr
: DUMP-ABND  ( hi -- )   0 DO :ABND I CELLS + @ . CR LOOP ;
: ABND?  ( u -- ? )   0 OVER 2/ 1+ 1  DO OVER I MOD 0=  IF I + THEN  LOOP  < ;
: COUNT-ABND  ( lo hi -- # )   2DUP SWAP ." From " . ." to " .
   1+ SWAP 0 -ROT  DO  I ABND?  IF 1+ THEN  LOOP 
   DUP ." Abundants found : " . CR ;
: LIST-ABND  ( lo hi -- )   2DUP COUNT-ABND 
   CELLS ALLOCATE ABORT" Can't allocate buffer" DUP TO :ABND -ROT 0 -ROT
   SWAP  DO I ABND?  IF DUP CELLS 2 PICK + I SWAP ! 1+  THEN  LOOP NIP TO #ABND ;
: ABND@  ( i -- u )   CELLS :ABND + @ ; \ fetch abundant from list
: SUM2ABND?  ( u -- ? )  \ is sum of 2 abundants ?
   #ABND 0  DO #ABND 0  DO DUP I ABND@ J ABND@ + =
         IF DROP -1 UNLOOP UNLOOP EXIT  THEN 
   LOOP LOOP DROP 0 ;
: BRUT  ( lo hi -- sum )   SWAP 0 -ROT 
   DO I SUM2ABND? 
      IF  ELSE I +  THEN 
   LOOP ;
: MAIN    12 28123 LIST-ABND  1 28123  BRUT ;
MAIN .

\EOF 4179871
Non-abundant sums
Problem 23
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

Íåèçáûòî÷íûå ñóììû
Ñîâåðøåííîå ÷èñëî - ýòî ÷èñëî, äëÿ êîòîðîãî ñóììà ñîáñòâåííûõ äåëèòåëåé â òî÷íîñòè ðàâíà ÷èñëó. Íàïðèìåð, ñóììà ñîáñòâåííûõ äåëèòåëåé 28 áóäåò 1 + 2 + 4 + 7 + 14 = 28, ÷òî îçíà÷àåò, ÷òî 28 - èäåàëüíîå ÷èñëî.
×èñëî n íàçûâàåòñÿ íåïîëíûì, åñëè ñóììà åãî ñîáñòâåííûõ äåëèòåëåé ìåíüøå n, è èçáûòî÷íûì, åñëè ýòà ñóììà ïðåâûøàåò n.
Ïîñêîëüêó 12 - ýòî íàèìåíüøåå èçîáèëüíîå ÷èñëî, 1 + 2 + 3 + 4 + 6 = 16, íàèìåíüøåå ÷èñëî, êîòîðîå ìîæåò áûòü çàïèñàíî êàê ñóììà äâóõ èçîáèëüíûõ ÷èñåë, ðàâíî 24. Ìàòåìàòè÷åñêèì àíàëèçîì ìîæíî ïîêàçàòü, ÷òî âñå öåëûå ÷èñëà áîëüøå ÷åì 28123 ìîæíî çàïèñàòü êàê ñóììó äâóõ îáèëüíûõ ÷èñåë. Îäíàêî ýòîò âåðõíèé ïðåäåë íå ìîæåò áûòü óìåíüøåí ñ ïîìîùüþ àíàëèçà, äàæå åñëè èçâåñòíî, ÷òî íàèáîëüøåå ÷èñëî, êîòîðîå íå ìîæåò áûòü âûðàæåíî êàê ñóììà äâóõ èçáûòî÷íûõ ÷èñåë, ìåíüøå ýòîãî ïðåäåëà.
Íàéäèòå ñóììó âñåõ ïîëîæèòåëüíûõ öåëûõ ÷èñåë, êîòîðûå íåëüçÿ çàïèñàòü êàê ñóììó äâóõ îáèëüíûõ ÷èñåë.
