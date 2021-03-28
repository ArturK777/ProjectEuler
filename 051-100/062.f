: CUBE  ( u -- ud )   DUP DUP * UM* ;
: DPERM?  ( ud1 ud2 -- ? )   \ is ud1 permutation of ud2 ?
   PAD 50 ERASE
   <# #S #> DUP >R PAD 10 + SWAP CMOVE
   <# #S #> DUP >R PAD 30 + SWAP CMOVE
   2R> DUP ROT = IF DUP 
      0 DO PAD 10 I + + C@ 48 - PAD +  1 SWAP +! LOOP
      0 DO PAD 30 I + + C@ 48 - PAD + -1 SWAP +! LOOP
      -1 10 0 DO PAD I + C@ IF DROP 0 LEAVE THEN LOOP 
   ELSE DROP 0
   THEN ;
: BRUT  ( border -- ud ) DUP
   4642 DO 1
      I CUBE  
      3 PICK I 1+ ?DO
         I CUBE 2OVER DPERM? IF ROT 1+ -ROT THEN
      LOOP 2DROP
      5 = IF DROP I CUBE LEAVE THEN
   LOOP ;   
TIME&DATE 2DROP 2DROP 60 * +
10000 BRUT D.
TIME&DATE 2DROP 2DROP 60 * + SWAP - CR .( Seconds: ) .

\EOF
Cubic permutations
Problem 62
The cube, 41063625 (345^3), can be permuted to produce two other cubes: 56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is the smallest cube which has exactly three permutations of its digits which are also cube.
Find the smallest cube for which exactly five permutations of its digits are cube.
