REQUIRE CONCAT ~micro\lib\str.f  
: DECODE  ( -- )
   10 0 DO  
      PAD 20 + I 3 * +  
      C@ DUP 57 > IF 
         CASE
            [CHAR] T OF 10 ENDOF \ Ten
                  74 OF 11 ENDOF \ Jack
            [CHAR] Q OF 12 ENDOF \ Queen
            [CHAR] K OF 13 ENDOF \ King
            [CHAR] A OF 14 ENDOF \ Ace
         ENDCASE
      ELSE 48 -
      THEN
      PAD I 2* + C!
      PAD 21 + I 3 * + C@  PAD I 2* 1+ + C!
   LOOP ;
: CARDVAL  ( hand card -- u )   2 * SWAP 10 * + PAD + C@ ;
: CARDSUIT  ( hand card -- u )   2 * 1+ SWAP 10 * + PAD + C@ ;
: CARDSWAP  ( hand card -- )   
   2DUP CARDVAL >R 2DUP CARDSUIT >R 1+ 
   2DUP CARDVAL >R 2DUP CARDSUIT >R 1- 
   2DUP 2 * 1+ SWAP 10 * + PAD + R> SWAP C!
   2DUP 2 * SWAP 10 * + PAD + R> SWAP C! 1+
   2DUP 2 * 1+ SWAP 10 * + PAD + R> SWAP C!
   2 * SWAP 10 * + PAD + R> SWAP C! ;
: SORT  ( -- )
   2 0 DO I 0
      BEGIN
         2DUP CARDVAL >R
         2DUP 1+ CARDVAL R> < 
         IF 2DUP CARDSWAP  DUP IF 1- THEN ELSE 1+ THEN
         DUP 3 >
      UNTIL 2DROP
   LOOP ;
: FLASH?  ( hand -- 0 | val )   
   4 0 DO DUP I CARDSUIT SWAP
   DUP I 1+ CARDSUIT ROT
   <> IF DROP 0 UNLOOP EXIT THEN 
   LOOP  4 CARDVAL ;
: ROYALFLASH?  ( hand -- 0 | 14 )   FLASH? 14 = IF 14 ELSE 0 THEN ;
: STRAIGHT?  ( hand -- 0 | val )
   4 0 DO DUP I CARDVAL SWAP
   DUP I 1+ CARDVAL ROT 1+
   <> IF DROP 0 UNLOOP EXIT THEN 
   LOOP  4 CARDVAL ;
: STRAIGHTFLASH?  ( hand -- 0 | val )   
   DUP DUP FLASH? SWAP STRAIGHT? AND IF 4 CARDVAL ELSE DROP 0 THEN ;
: FOUR?  ( hand -- 0 | val )   
   0  2DUP CARDVAL >R 
   1+ 2DUP CARDVAL >R 
   1+ 2DUP CARDVAL >R 
   1+ 2DUP CARDVAL NIP DUP R> = 
   IF DUP R> = 
      IF R> = 
         IF 0 CARDVAL EXIT ELSE
          THEN 
      ELSE R> 2DROP THEN
   ELSE R> R> DROP 2DROP THEN
   1  2DUP CARDVAL >R
   1+ 2DUP CARDVAL >R 
   1+ 2DUP CARDVAL >R 
   1+ 2DUP CARDVAL NIP DUP R> = 
   IF DUP R> =
      IF R> =
         IF 1 CARDVAL EXIT THEN 
      ELSE R> 2DROP THEN
   ELSE R> R> DROP 2DROP
   THEN  DROP 0 ;
: FULL?  ( hand set -- 0 | val )   SWAP
   OVER 1 = IF
      0  2DUP CARDVAL >R 
      1+ 2DUP CARDVAL >R
      1+ 2DUP CARDVAL DUP R> =
      IF R> =
         IF 1+
            2DUP CARDVAL ROT ROT
            1+ 2DUP CARDVAL NIP ROT
            = IF NIP 0 CARDVAL EXIT THEN
         ELSE DROP THEN
      ELSE R> 2DROP DROP THEN
   THEN
   OVER 2 = IF
      0  2DUP CARDVAL >R 
      1+ 2DUP CARDVAL >R
      1+ 2DUP CARDVAL DUP R> =
      IF R> =
         IF 1+
            2DUP CARDVAL ROT ROT
            1+ 2DUP CARDVAL NIP ROT
            = IF NIP 4 CARDVAL EXIT THEN
         ELSE DROP THEN
      ELSE R> 2DROP DROP THEN
   THEN
   OVER 1 = IF
      0  2DUP CARDVAL ROT ROT
      1+ 2DUP CARDVAL 3 ROLL
      = IF
         1+ 2DUP CARDVAL >R
         1+ 2DUP CARDVAL >R
         1+ 2DUP CARDVAL NIP DUP R> =
         IF R> = IF NIP 4 CARDVAL EXIT THEN
         ELSE R> 2DROP THEN
      ELSE DROP THEN 
   THEN
   OVER 2 = IF
      0  2DUP CARDVAL ROT ROT
      1+ 2DUP CARDVAL 3 ROLL
      = IF
         1+ 2DUP CARDVAL >R
         1+ 2DUP CARDVAL >R
         1+ 2DUP CARDVAL NIP DUP R> =
         IF R> = IF NIP 0 CARDVAL EXIT THEN
         ELSE R> 2DROP THEN
      ELSE DROP THEN 
   THEN 2DROP  0 ;
: THREE?  ( hand -- 0 | val )
   0  2DUP CARDVAL >R 
   1+ 2DUP CARDVAL >R 
   1+ 2DUP CARDVAL NIP DUP R> = 
   IF R> = IF 0 CARDVAL EXIT THEN
   ELSE R> 2DROP  THEN
   1  2DUP CARDVAL >R 
   1+ 2DUP CARDVAL >R 
   1+ 2DUP CARDVAL NIP DUP R> = 
   IF R> = IF 1 CARDVAL EXIT THEN 
   ELSE R> 2DROP  THEN
   2  2DUP CARDVAL >R 
   1+ 2DUP CARDVAL >R 
   1+ 2DUP CARDVAL NIP DUP R> = 
   IF R> = IF 2 CARDVAL EXIT THEN
   ELSE R> 2DROP THEN
   DROP 0 ;  
: 2PAIRS?  ( hand set -- 0 | val )   SWAP 
   OVER 1 = IF DUP 0 CARDVAL OVER 1 CARDVAL =
      IF DUP 2 CARDVAL OVER 3 CARDVAL =
         IF NIP 0 CARDVAL EXIT THEN
      THEN THEN
   OVER 2 = IF DUP 0 CARDVAL OVER 1 CARDVAL =
      IF DUP 2 CARDVAL OVER 3 CARDVAL =
         IF NIP 2 CARDVAL EXIT THEN
      THEN THEN
   OVER 1 = IF DUP 0 CARDVAL OVER 1 CARDVAL =
      IF DUP 3 CARDVAL OVER 4 CARDVAL =
         IF NIP 0 CARDVAL EXIT THEN
      THEN THEN
   OVER 2 = IF DUP 0 CARDVAL OVER 1 CARDVAL =
      IF DUP 3 CARDVAL OVER 4 CARDVAL =
         IF NIP 3 CARDVAL EXIT THEN
      THEN THEN
   OVER 1 = IF DUP 1 CARDVAL OVER 2 CARDVAL =
      IF DUP 3 CARDVAL OVER 4 CARDVAL =
         IF NIP 1 CARDVAL EXIT THEN
      THEN THEN
   OVER 2 = IF DUP 1 CARDVAL OVER 2 CARDVAL =
      IF DUP 3 CARDVAL OVER 4 CARDVAL =
         IF NIP 2 CARDVAL EXIT THEN
      THEN THEN
   2DROP 0 ;
: PAIR?  ( hand -- 0 | val )
   DUP 0 CARDVAL OVER 1 CARDVAL = IF 0 CARDVAL EXIT THEN
   DUP 1 CARDVAL OVER 2 CARDVAL = IF 1 CARDVAL EXIT THEN
   DUP 2 CARDVAL OVER 3 CARDVAL = IF 2 CARDVAL EXIT THEN
   DUP 3 CARDVAL OVER 4 CARDVAL = IF 3 CARDVAL EXIT THEN
   DROP 0 ; 
: WIN?  ( -- ? )   
   0 ROYALFLASH? 1 ROYALFLASH? 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 STRAIGHTFLASH? 1 STRAIGHTFLASH? 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 FOUR? 1 FOUR? 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 1 FULL? 1 1 FULL? 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 2 FULL? 1 2 FULL? 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 FLASH? 1 FLASH? 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 STRAIGHT? 1 STRAIGHT? 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 THREE? 1 THREE? 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 1 2PAIRS? 1 1 2PAIRS? 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 2 2PAIRS? 1 2 2PAIRS? 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 PAIR? 1 PAIR? 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 4 CARDVAL 1 4 CARDVAL 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 3 CARDVAL 1 3 CARDVAL 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 2 CARDVAL 1 2 CARDVAL 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 1 CARDVAL 1 1 CARDVAL 2DUP <> IF > EXIT ELSE 2DROP THEN
   0 ;
: READ-HANDS  ( adr u score -- score' )   ROT ROT
   SOURCE-NAME CUT-PATH 2SWAP CONCAT  R/O OPEN-FILE THROW 
   DUP FILE-SIZE THROW D>S 30 /  1 SWAP
   0 DO OVER
      PAD 20 + 28 ROT
      READ-LINE THROW 0= ABORT" Can't read file" DROP
      DECODE  SORT
      WIN? IF ROT 1+ ROT ROT THEN
      1+
   LOOP
   DROP
   CLOSE-FILE THROW ;  
S" p054_poker.txt" 0 READ-HANDS .

\EOF 376
Poker hands
In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:
    High Card: Highest value card.
    One Pair: Two cards of the same value.
    Two Pairs: Two different pairs.
    Three of a Kind: Three cards of the same value.
    Straight: All cards are consecutive values.
    Flush: All cards of the same suit.
    Full House: Three of a kind and a pair.
    Four of a Kind: Four cards of the same value.
    Straight Flush: All cards are consecutive values of same suit.
    Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
The cards are valued in the order:
2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next highest cards are compared, and so on.
Consider the following five hands dealt to two players:
Hand	 	Player 1	 	Player 2	 	Winner
1	 	5H 5C 6S 7S KD Pair of Fives 	 	2C 3S 8S 8D TD Pair of Eights	 	Player 2
2	 	5D 8C 9S JS AC Highest card Ace 	2C 5C 7D 8S QH Highest card Queen 	Player 1
3	 	2D 9C AS AH AC Three Aces  	 	3D 6D 7D TD QD Flush with Diamonds 	Player 2
4	 	4D 6S 9H QH QC Pair of Queens Highest card Nine 	3D 6D 7H QD QS Pair of Queens Highest card Seven 	Player 1
5	 	2H 2D 4C 4D 4S Full House With Three Fours	 	3C 3D 3S 9S 9D Full House with Three Threes	 	Player 1
The file, poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.
How many hands does Player 1 win?

Ïîêåðíûå ðóêè
Â ïîêåðå ñ êàðòî÷íîé èãðîé ðóêà ñîñòîèò èç ïÿòè êàðò è ðàíæèðóåòñÿ îò íèçøåé ê âûñøåé ñëåäóþùèì îáðàçîì:
    High Card: êàðòà ñ íàèáîëüøèì çíà÷åíèåì.
    Îäíà ïàðà: äâå êàðòû îäíîãî äîñòîèíñòâà.
    Äâå ïàðû: äâå ðàçíûå ïàðû.
    Òðîéêà: òðè êàðòû îäíîãî äîñòîèíñòâà.
    Ñòðèò: âñå êàðòû èìåþò ïîñëåäîâàòåëüíóþ öåííîñòü.
    Ôëåø: âñå êàðòû îäíîé ìàñòè.
    Ôóëë-õàóñ: òðîéêà è ïàðà.
    Êàðå: ÷åòûðå êàðòû îäíîãî äîñòîèíñòâà.
    Ñòðèò-ôëåø: âñå êàðòû ïîäðÿä èäóò îäíîé ìàñòè.
    Ðîÿë-ôëåø: äåñÿòêà, âàëåò, äàìà, êîðîëü, òóç îäíîé ìàñòè.
Êàðòû îöåíèâàþòñÿ â ñëåäóþùåì ïîðÿäêå:
2, 3, 4, 5, 6, 7, 8, 9, 10, âàëåò, äàìà, êîðîëü, òóç.
Åñëè ó äâóõ èãðîêîâ îäèíàêîâûå ðàíãè, òî âûèãðûâàåò ðàíã, ñîñòàâëåííûé èç íàèâûñøåãî äîñòîèíñòâà; íàïðèìåð, ïàðà âîñüìåðîê ïðåâîñõîäèò ïàðó ïÿòåðîê (ñì. ïðèìåð 1 íèæå). Íî åñëè äâà ðàíãà ðàâíû, íàïðèìåð, ó îáîèõ èãðîêîâ åñòü ïàðà äàì, òîãäà ñðàâíèâàþòñÿ ñàìûå âûñîêèå êàðòû â êàæäîé ðóêå (ñì. Ïðèìåð 4 íèæå); åñëè ñòàðøèå êàðòû ñîâïàäàþò, ñðàâíèâàþòñÿ ñëåäóþùèå ïî âåëè÷èíå êàðòû è òàê äàëåå.
Ðàññìîòðèì ñëåäóþùèå ïÿòü ðóê, ðîçäàííûõ äâóì èãðîêàì:
Ðóêà èãðîê 1 èãðîê 2 ïîáåäèòåëü
1 5H 5C 6S 7S KD Ïàðà ïÿòåðîê 2C 3S 8S 8D TD Ïàðà âîñüìåðîê Èãðîê 2
2 5D 8C 9S JS AC Ñòàðøàÿ êàðòà Òóç 2C 5C 7D 8S QH Ñòàðøàÿ êàðòà Êîðîëåâà Èãðîê 1
3 2D 9C AS AH AC Òðè òóçà 3D 6D 7D TD QD Ôëåø ñ áóáíàìè Èãðîê 2
4 4D 6S 9H QH QC Ïàðà äàì Ñòàðøàÿ êàðòà Äåâÿòü 3D 6D 7H QD QS Ïàðà äàì Ñòàðøàÿ êàðòà Ñåìü èãðîêîâ 1
5 2H 2D 4C 4D 4S Ôóëë-õàóñ ñ òðåìÿ ÷åòâåðêàìè 3C 3D 3S 9S 9D Ôóëë-õàóñ ñ òðåìÿ òðîéêàìè Èãðîê 1
Ôàéë poker.txt ñîäåðæèò îäíó òûñÿ÷ó ñëó÷àéíûõ ðóê, ðàçäà÷åííûõ äâóì èãðîêàì. Êàæäàÿ ñòðîêà ôàéëà ñîäåðæèò äåñÿòü êàðò (ðàçäåëåííûõ îäíèì ïðîáåëîì): ïåðâûå ïÿòü - ýòî êàðòû Èãðîêà 1, à ïîñëåäíèå ïÿòü - êàðòû Èãðîêà 2. Âû ìîæåòå ïðåäïîëîæèòü, ÷òî âñå ðóêè äåéñòâèòåëüíû (áåç íåäîïóñòèìûõ ñèìâîëîâ èëè ïîâòîðÿþùèõñÿ êàðò), ðóêè êàæäîãî èãðîêà íå ðàñïîëîæåíû â îïðåäåëåííîì ïîðÿäêå, è â êàæäîé ðóêå åñòü ÿâíûé ïîáåäèòåëü.
Ñêîëüêî ðóê âûèãðûâàåò Èãðîê 1?
