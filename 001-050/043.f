10 CONSTANT N
CREATE PERM 1 C, 0 C, 2 C, 3 C, 4 C, 5 C, 6 C, 7 C, 8 C, 9 C,
CREATE DIVS 2 C, 3 C, 5 C, 7 C, 11 C, 13 C, 17 C,
: !!  ( u -- u! )   1 SWAP 1+ 1 DO I * LOOP ;
: POW10  ( i -- d{10^i} )   DUP IF 1. ROT 0 DO 10 1 M*/ LOOP ELSE DROP 1. THEN ;
: PERM@  ( i -- c )   PERM + C@ ; 
: PERM-TYPE  ( -- )   N 0 DO PERM I + C@ . LOOP CR ;
: PERM-NUMD  (  -- ud )  0. N 0 DO I POW10 PERM 9 + I - C@ 1 M*/ D+ LOOP ;
: PERM3  ( i -- n )  DUP PERM + C@ 100 * OVER 1+ PERM + C@ 10 * + SWAP 2+ PERM + C@ + ;
: DIV?  ( -- ? ) 
   -1 7 0 DO I 1+ PERM3
      DIVS I + C@ MOD IF DROP 0 LEAVE THEN
   LOOP ;
: SWAP@  ( i j -- )   2DUP PERM@ SWAP PERM@ ROT PERM + C! SWAP PERM + C! ;
: BRUT  ( # -- ud )    0. 1  \ pandigital lexicographic permutator
   BEGIN  N 2-
      BEGIN  
         DUP DUP PERM@
         SWAP 1+ PERM@  >
      WHILE 1-
      REPEAT
      N 1-
      BEGIN DUP PERM@
         2 PICK PERM@ SWAP  >
      WHILE 1-
      REPEAT
      2DUP SWAP@
      DROP 1+ N 1-
      BEGIN 2DUP  <
      WHILE 2DUP  SWAP@  1- SWAP 1+ SWAP 
      REPEAT
      2DROP
      DIV? IF >R PERM-NUMD D+ R> THEN
      1+ DUP 4 PICK =
   UNTIL DROP ROT DROP ;

9 !! 9 *  BRUT D. 

\EOF 16695334890

Sub-string divisibility
Problem 43
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.
Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:
    d2d3d4=406 is divisible by 2
    d3d4d5=063 is divisible by 3
    d4d5d6=635 is divisible by 5
    d5d6d7=357 is divisible by 7
    d6d7d8=572 is divisible by 11
    d7d8d9=728 is divisible by 13
    d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.

Ïîäñòðîêà äåëèìîñòü
×èñëî 1406357289 ïðåäñòàâëÿåò ñîáîé ïàíöèôðîâîå ÷èñëî îò 0 äî 9, ïîòîìó ÷òî îíî ñîñòîèò èç êàæäîé èç öèôð îò 0 äî 9 â îïðåäåëåííîì ïîðÿäêå, íî îíî òàêæå èìååò äîâîëüíî èíòåðåñíîå ñâîéñòâî äåëèìîñòè ïîäñòðîêè.
Ïóñòü d1 - ïåðâàÿ öèôðà, d2 - âòîðàÿ öèôðà è òàê äàëåå. Òàêèì îáðàçîì, ìû îòìå÷àåì ñëåäóþùåå:
    d2d3d4 = 406 äåëèòñÿ íà 2
    d3d4d5 = 063 äåëèòñÿ íà 3
    d4d5d6 = 635 äåëèòñÿ íà 5
    d5d6d7 = 357 äåëèòñÿ íà 7
    d6d7d8 = 572 äåëèòñÿ íà 11
    d7d8d9 = 728 äåëèòñÿ íà 13
    d8d9d10 = 289 äåëèòñÿ íà 17
Íàéäèòå ñóììó âñåõ ïàíöèôðîâûõ ÷èñåë îò 0 äî 9 ñ ýòèì ñâîéñòâîì.
