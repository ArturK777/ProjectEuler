: FILL#  ( -- adr )
   1000010 ALLOCATE THROW DUP 1000000 + OVER  1 
   BEGIN DUP S>D <# #S #>  DUP 2>R 2 PICK R>  CMOVE R> ROT + SWAP 1+
      OVER 3 PICK >
   UNTIL  DROP 2DROP  ;
: PEEK*  ( adr -- mul ) 1 1
   7 0 DO 0 2OVER + 1- C@ 48 -
      NIP * SWAP 10 * SWAP
   LOOP -ROT 2DROP ;
FILL#  PEEK* . 

\EOF 210
Champernowne's constant
Problem 40
An irrational decimal fraction is created by concatenating the positive integers:
0.123456789101112131415161718192021...
It can be seen that the 12th digit of the fractional part is 1.
If dn represents the nth digit of the fractional part, find the value of the following expression.
d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000

Ïîñòîÿííàÿ ×àìïåðíîóíà
Ïðîáëåìà 40
Èððàöèîíàëüíàÿ äåñÿòè÷íàÿ äðîáü ñîçäàåòñÿ ïóòåì îáúåäèíåíèÿ ïîëîæèòåëüíûõ öåëûõ ÷èñåë:
0,123456789101112131415161718192021 ...
Âèäíî, ÷òî 12-ÿ öèôðà äðîáíîé ÷àñòè ðàâíà 1.
Åñëè dn ïðåäñòàâëÿåò ñîáîé n-þ öèôðó äðîáíîé ÷àñòè, íàéäèòå çíà÷åíèå ñëåäóþùåãî âûðàæåíèÿ.
d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000
