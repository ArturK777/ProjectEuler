CREATE CH# 0 , 0 , 10 , 11 , 24 , 39 , 5 ,
CREATE CC# 0 , 0 , 10 ,
GetTickCount VALUE RND
40 CELLS ALLOCATE THROW VALUE BOARD 
: RAND  ( u1 -- u2 )   \ Pseudo random from 1 to u1
   RND 1103515245 * 12345 + DUP TO RND
   65536 / 32768 MOD SWAP MOD ABS 1+ ;
: CHANCE  ( u -- u' )
   CH# 1+!  CH# @ 16 MOD DUP 6 < 
   IF NIP 1+ CELLS CH# + @ EXIT THEN
   DUP 6 = OVER 7 = OR
   IF DROP
      DUP 7 = IF DROP 15 THEN
      DUP 22 = IF DROP 25 THEN
      DUP 36 = IF DROP 5 THEN 
      EXIT
   THEN
   DUP 8 = IF DROP 22 = IF 28 ELSE 12 THEN EXIT THEN
   9 = IF 3 - THEN ;
: CC  ( u -- u' )
   CC# 1+!  CC# @ 16 MOD DUP 2 <
   IF NIP 1+ CELLS CC# + @ ELSE DROP THEN ;
: SIMULATE  ( # -- u )   0 0 ROT
   0 DO 4 RAND 4 RAND 2DUP =
      IF + SWAP 1+ DUP 2 > 
         IF DROP 2DROP 10 0   \ 3 consecutive doubles 
         ELSE -ROT + 40 MOD SWAP
         THEN 
      ELSE + NIP + 40 MOD 0
      THEN  
      SWAP 
      DUP 7 = OVER 22 = OR OVER 36 = OR IF CHANCE THEN
      DUP 2 = OVER 17 = OR OVER 33 = OR IF CC THEN
      DUP 30 = IF DROP 10 THEN
      DUP CELLS BOARD + 1+!
      SWAP
   LOOP 2DROP ;
: 3BEST ( -- $ )
   3 0 DO 0 0
      40 0 DO
         BOARD I CELLS + @ DUP 2 PICK > IF NIP NIP I SWAP ELSE DROP THEN
      LOOP
      DROP DUP S>D <# #S #> PAD I 2* + SWAP CMOVE 
      CELLS BOARD + CELL ERASE
   LOOP PAD 6 ;
1000000 SIMULATE 3BEST  TYPE
\EOF 101524
Monopoly odds
Problem 84
In the game, Monopoly, the standard board is set up in the following way:
p084_monopoly_board.png
A player starts on the GO square and adds the scores on two 6-sided dice to determine the number of squares they advance in a clockwise direction. Without any further rules we would expect to visit each square with equal probability: 2.5%. However, landing on G2J (Go To Jail), CC (community chest), and CH (chance) changes this distribution.
In addition to G2J, and one card from each of CC and CH, that orders the player to go directly to jail, if a player rolls three consecutive doubles, they do not advance the result of their 3rd roll. Instead they proceed directly to jail.
At the beginning of the game, the CC and CH cards are shuffled. When a player lands on CC or CH they take a card from the top of the respective pile and, after following the instructions, it is returned to the bottom of the pile. There are sixteen cards in each pile, but for the purpose of this problem we are only concerned with cards that order a movement; any instruction not concerned with movement will be ignored and the player will remain on the CC/CH square.
    Community Chest (2/16 cards):
        Advance to GO
        Go to JAIL
    Chance (10/16 cards):
        Advance to GO
        Go to JAIL
        Go to C1
        Go to E3
        Go to H2
        Go to R1
        Go to next R (railway company)
        Go to next R
        Go to next U (utility company)
        Go back 3 squares.
The heart of this problem concerns the likelihood of visiting a particular square. That is, the probability of finishing at that square after a roll. For this reason it should be clear that, with the exception of G2J for which the probability of finishing on it is zero, the CH squares will have the lowest probabilities, as 5/8 request a movement to another square, and it is the final square that the player finishes at on each roll that we are interested in. We shall make no distinction between "Just Visiting" and being sent to JAIL, and we shall also ignore the rule about requiring a double to "get out of jail", assuming that they pay to get out on their next turn.
By starting at GO and numbering the squares sequentially from 00 to 39 we can concatenate these two-digit numbers to produce strings that correspond with sets of squares.
Statistically it can be shown that the three most popular squares, in order, are JAIL (6.24%) = Square 10, E3 (3.18%) = Square 24, and GO (3.09%) = Square 00. So these three most popular squares can be listed with the six-digit modal string: 102400.
If, instead of using two 6-sided dice, two 4-sided dice are used, find the six-digit modal string.

����� �������� � �������� GO � ���������� ���� �� ���� ������������ �������, ����� ���������� ���������� ���������, �� ������� �� ������������ �� ������� �������. ��� �����-���� �������������� ������ �� ������� �������� ������ ������ � ������ ������������: 2,5%. ������ ������� �� G2J (Go To Jail), CC (������������ ������) � CH (����) �������� ��� �������������.

� ���������� � G2J � �� ����� ����� �� ������� �� CC � CH, ������� ����������� ������ ����������� ����� � ������, ���� ����� ����������� ��� ���������������� �����, �� �� ����������� ��������� ������ 3-�� ������. ������ ����� ��� �������� ����� � ������.
� ������ ���� ����� CC � CH ��������������. ����� ����� ������������ �� CC ��� CH, �� ����� ����� �� ������� ����� ��������������� ������ �, ������ �����������, ���������� �� � ����� ������. � ������ ������ ����������� ����, �� ��� ������� ���� ������ ��� ���������� ������ �����, ������� ����������� ��������; ����� ����������, �� ��������� � ���������, ����� ���������������, � ����� ��������� � �������� CC / CH.
    ������ ���������� (2/16 ����):
        ������� � GO
        ����� � ������
    ���� (10/16 ����):
        ������� � GO
        ����� � ������
        ������� � C1
        ������� � E3
        ������� � H2
        ������� � R1
        ������� � ���������� R (��������������� ��������)
        ������� � ���������� R
        ������� � ���������� U (������������ �����������)
        ��������� �� 3 �������� �����.
���� ���� �������� �������� ����������� ��������� ��� ��� ���� �������. �� ���� ����������� ������ �� ���� ������ ����� ������. �� ���� ������� ������ ���� ����, ���, �� ����������� G2J, ��� �������� ����������� ������ ����� ����, �������� CH ����� ����� ���������� �����������, ��������� 5/8 ����������� ����������� �� ������ ����, � ��� ��������� �������, �� ������� ����� ����������� � ������ ������������ ��� ������. �� �� ����� ������ �������� ����� ������� ������� � ��������� � ??������, � ����� ����� ������������ ������� � ���������� �������� ��� ������� �� �������, ��� �������, ��� ��� ��������, ����� ����� � ��������� ���.
����� � GO � ��������������� ������������ �������� �� 00 �� 39, �� ����� ���������� ��� ���������� �����, ����� �������� ������, ��������������� ������� ���������.
������������� ����� ��������, ��� ��� ����� ���������� �������� �� �������: JAIL (6,24%) = ������� 10, E3 (3,18%) = ������� 24 � GO (3,09%) = ������� 00. ����, ��� ��� ����� ���������� �������� ����� ���� ������ � ������������ ��������� �������: 102400.
���� ������ ���� 6-��������� ��������� ������ ������������ ��� 4-��������� ��������� �����, ������� ��������� ������ �� ����� ����.       
        