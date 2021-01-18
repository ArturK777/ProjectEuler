CREATE TEST 10 ALLOT
CREATE PATT 10 ALLOT
CREATE /NUM 10 ALLOT
CREATE /MAX 1 CELLS ALLOT
: -0?  ( n -- ? )   \ n free of zeroes ?
   BEGIN 10 /MOD 2DUP OR
   WHILE SWAP 0= IF DROP 0 EXIT THEN
   REPEAT 2DROP -1 ;
: UNIQ?  ( n -- ? )   \ check n for unique digits
   PAD 10 ERASE
   BEGIN 10 /MOD 2DUP OR
   WHILE SWAP PAD + DUP C@
   IF 2DROP 0 EXIT ELSE 1 SWAP C! THEN
   REPEAT 2DROP -1 ;   
: PEEK  ( n -- ? )   \ check n for pandigital
   BEGIN 10 /MOD 2DUP OR
   WHILE SWAP  PATT + C@
      IF DROP 0 EXIT THEN
   REPEAT  2DROP -1 ;
: CHECK  ( n -- ? )   \ all 3 checks
   DUP -0? SWAP DUP UNIQ? SWAP PEEK AND AND ; 
: POKE  ( n -- )   0 SWAP \ write pattern
   BEGIN 10 /MOD 2DUP OR
   WHILE SWAP PATT + 1 SWAP C! SWAP 1+ SWAP
   REPEAT 2DROP PATT C@ + PATT C! ;
: POKE-CPR  ( n -- )   0 SWAP  TEST 10 ERASE  \ write concatenated product
   BEGIN 10 /MOD 2DUP OR
   WHILE SWAP 48 + 2 PICK TEST + C!  SWAP 1+ SWAP
   REPEAT 2DROP
   /NUM C@ 1+ SWAP DUP 0 DO
      DUP I - TEST + 1- C@ 2 PICK I /NUM + + C! 
   LOOP  + 1- /NUM C!  ;
: CPR  ( i -- 0 | max-mult true )   1 SWAP
   PATT 10 ERASE  /NUM 10 ERASE
   BEGIN 2DUP * DUP
      CHECK IF ELSE 2DROP DROP 0 EXIT THEN
      DUP POKE POKE-CPR
      PATT C@ 9 < 
   WHILE SWAP 1+ SWAP 
   REPEAT DROP -1  ;   
: CPR->NUM  ( -- u )   0. /NUM COUNT >NUMBER 2DROP D>S  ;
: BRUT  ( border -- max )   
   1 DO 
      I CPR IF I .  DROP CPR->NUM DUP . CR /MAX @ MAX /MAX ! THEN
   LOOP /MAX @  ; 
98765 BRUT .

\EOF 932718654
Pandigital multiples
Problem 38
Take the number 192 and multiply it by each of 1, 2, and 3:
    192 ? 1 = 192
    192 ? 2 = 384
    192 ? 3 = 576
By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?

Пандигитальные кратные
Возьмите число 192 и умножьте его на 1, 2 и 3:
    192? 1 = 192
    192? 2 = 384
    192? 3 = 576
Объединяя каждое произведение, мы получаем панцифровую цифру от 1 до 9, 192384576. Мы назовем 192384576 конкатенированным произведением 192 и (1,2,3).
То же самое может быть достигнуто, если начать с 9 и умножить на 1, 2, 3, 4 и 5, получив pandigital, 918273645, который является конкатенированным произведением 9 и (1,2,3,4,5).
Какое наибольшее панцифровое 9-значное число от 1 до 9 может быть образовано как конкатенированное произведение целого числа на (1,2, ..., n), где n> 1?