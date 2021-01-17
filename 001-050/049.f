: PRIME2?  ( u -- flag )   \ is 5 <= u(odd) a prime number ?
   DUP 3 DO DUP I MOD IF ELSE DROP 0 LEAVE THEN 2 +LOOP ;
: PR#  ( u1 u2 -- # )   \ count primes from to : 5 < u1 < u2
   0 -ROT SWAP DO I PRIME2? IF 1+ THEN 2 +LOOP ;
: PRIME#FROM  ( # u-from -- adr )   \ fill list of primes 
   OVER CELLS ALLOCATE THROW  0 -ROT SWAP 2-  
   BEGIN  2+  DUP PRIME2?
      IF DUP 2 PICK 4 PICK CELLS + !
         ROT 1+ -ROT
      THEN
      2SWAP 2DUP = >R 2SWAP R>
   UNTIL
   2SWAP 2DROP DROP ;
: PERM?  ( u1 u2 -- ? )   \ is u1 permutation of u2 ?
   PAD 10 ERASE
   BEGIN  10 /MOD SWAP 2DUP OR
   WHILE  PAD + 1 SWAP +!
   REPEAT 2DROP 
   BEGIN  10 /MOD SWAP 2DUP OR
   WHILE  PAD + -1 SWAP +!
   REPEAT 2DROP
   -1 10 0 DO PAD I + C@ IF DROP 0 LEAVE THEN LOOP ;
: BRUT  ( from -- )
   DUP 10000 PR# DUP ROT PRIME#FROM
   OVER  0 
   DO DUP I CELLS + @ 
      I 1+
      BEGIN
         DUP CELLS 3 PICK + @ DUP >R
         2 PICK -  R> +
         DUP 10000 <
      WHILE
         DUP  PRIME2?
         IF DUP 3 PICK
            PERM?
            IF DUP 2 PICK CELLS 5 PICK + @  PERM?
               IF >R   CELLS 2 PICK + @  SWAP R> -ROT
                  S>D <# #S #> PAD SWAP CMOVE
                  S>D <# #S #> PAD 4 + SWAP CMOVE
                  S>D <# #S #> PAD 8 + SWAP CMOVE
                  PAD 12 TYPE
                  LEAVE
               THEN
            THEN
         THEN DROP 1+
      REPEAT
      2DROP DROP
   LOOP 2DROP ;
1489 BRUT

\EOF 296962999629              
Prime permutations
Problem 49
The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
What 12-digit number do you form by concatenating the three terms in this sequence?

Ïðîñòûå ïåðåñòàíîâêè
Àðèôìåòè÷åñêàÿ ïîñëåäîâàòåëüíîñòü 1487, 4817, 8147, â êîòîðîé êàæäîå èç ÷ëåíîâ óâåëè÷èâàåòñÿ íà 3330, íåîáû÷íà ïî äâóì ïðè÷èíàì: (i) êàæäûé èç òðåõ ÷ëåíîâ ÿâëÿåòñÿ ïðîñòûì, è (ii) êàæäîå èç ÷åòûðåõçíà÷íûõ ÷èñåë ÿâëÿåòñÿ ïåðåñòàíîâêè äðóã äðóãà.
Íå ñóùåñòâóåò àðèôìåòè÷åñêèõ ïîñëåäîâàòåëüíîñòåé, ñîñòîÿùèõ èç òðåõ îäíî-, äâóõ- èëè òðåõçíà÷íûõ ïðîñòûõ ÷èñåë, äåìîíñòðèðóþùèõ ýòî ñâîéñòâî, íî åñòü åùå îäíà ÷åòûðåõçíà÷íàÿ âîçðàñòàþùàÿ ïîñëåäîâàòåëüíîñòü.
Êàêîå 12-çíà÷íîå ÷èñëî âû ïîëó÷èòå, îáúåäèíèâ òðè ÷ëåíà â ýòîé ïîñëåäîâàòåëüíîñòè?
