REQUIRE CONCAT ~micro\lib\str.f
CREATE TRI# 1000 ALLOT
: TRI  ( -- )   TRI# 1000 ERASE  \ create triangle array
   45 1 DO 1 I 1+ I * 2 /  TRI# + C! LOOP  ;
: OPEN-WORDS  ( adr u -- fid )   SOURCE-NAME CUT-PATH 2SWAP CONCAT  R/O OPEN-FILE THROW ;
: 1SHIFT  ( fid -- )   DUP FILE-POSITION THROW 1. D+ ROT REPOSITION-FILE THROW ;
: GET-WORD ( adr fid -- u )
   DUP FILE-POSITION THROW D>S  -ROT
   BEGIN 2DUP 1 SWAP READ-FILE THROW DROP  OVER C@ 34 =  UNTIL 
   DUP FILE-POSITION
   THROW D>S 3 PICK - 1- >R
   ROT S>D ROT DUP >R REPOSITION-FILE THROW  2R>
   READ-FILE THROW  ;
: TRI?  ( adr u -- 1 | 0 )  
   0 SWAP 0 DO  OVER I + C@ 64 - +  LOOP
   NIP TRI# + C@  ;
: COUNT-WORDS  ( fid -- fid # )
   20  ALLOCATE THROW SWAP 0
   BEGIN >R
      DUP 1SHIFT  
      2DUP GET-WORD
      2 PICK SWAP TRI?  R> + >R
      DUP 1SHIFT
      2DUP 1 SWAP READ-FILE THROW DROP
      OVER C@ 44 <> R> SWAP
   UNTIL ROT DROP ;
TRI  
S" p042_words.txt" OPEN-WORDS 
COUNT-WORDS . CLOSE-FILE THROW

\EOF 162
Coded triangle numbers
Problem 42
The nth term of the sequence of triangle numbers is given by, tn = 1/2n(n+1); so the first ten triangle numbers are:
1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.
Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?
