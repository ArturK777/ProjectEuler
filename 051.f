CREATE PATT 10 ALLOT
CREATE NN 10 CELLS ALLOT
: PRIME?  ( u -- ? )   \ is u a prime number - full ver
   DUP 2 = IF EXIT ELSE DUP 2 < IF DROP 0 EXIT THEN THEN
   DUP 2 ?DO DUP I MOD IF ELSE DROP 0 LEAVE THEN  LOOP ;
: FIND-SAME  ( u -- len )   \ find same digits in u and mark its positions in PATT by it value 1+
   PAD 256 ERASE  PATT 10 ERASE
   S>D <# #S #> DUP >R PAD 240 + SWAP CMOVE R>
   DUP 0 DO PAD I 240 + + C@  OVER I 1+
      ?DO DUP PAD I 240 + + C@ =
         IF DUP 47 - DUP PATT J + C!  PATT I + C! THEN 
      LOOP DROP
   LOOP ;
: REPL  ( position -- ) 
   10 0 DO
      I 48 + PAD 255 + C! 
      DUP I 10 * PAD + + PAD 255 + SWAP 1 CMOVE
   LOOP DROP ;
: REPLACE  ( len -- )   \ write 10 replacements in NN
   10 0 DO PAD 240 + PAD I 10 * + 10 CMOVE  LOOP
   0 OVER 0 DO  PATT I + C@  DUP 
      IF OVER  
         IF OVER = 
            IF I REPL THEN
         ELSE
            SWAP DROP
            I REPL
         THEN
      ELSE DROP
      THEN
   LOOP SWAP 
   0 DO PATT I + C@ OVER = IF 0 PATT I + C! THEN LOOP DROP ;
: CH>NUM  ( len -- )
   10 0 DO 0. PAD I 10 * + 3 PICK 
   >NUMBER 2DROP DROP
   NN I CELLS + !
   LOOP DROP ;
: BRUT  ( # begin -- ) 
   BEGIN DUP
      FIND-SAME
      BEGIN 0 OVER 0 DO PATT I + C@ + LOOP
      WHILE DUP REPLACE 
         DUP CH>NUM
         0 10 0 
         DO NN I CELLS + @ PRIME?
            IF 1+ THEN
         LOOP 
         3 PICK < INVERT IF DROP NIP EXIT  THEN
      REPEAT  DROP 1+ 
   AGAIN ;
8 111858 BRUT  . 
\EOF 121313
Prime digit replacements
Problem 51
By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.
Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.

Замена простых цифр
При замене 1-й цифры двухзначного числа * 3 получается, что шесть из девяти возможных значений: 13, 23, 43, 53, 73 и 83 - все простые.
Заменив 3-ю и 4-ю цифры 56**3 той же цифрой, это 5-значное число является первым примером, имеющим семь простых чисел среди десяти сгенерированных чисел, что дает семейство: 56003, 56113, 56333, 56443, 56663, 56773 , и 56993. Следовательно, 56003, будучи первым членом этого семейства, является наименьшим простым числом с этим свойством.
Найдите наименьшее простое число, которое, заменив часть числа (не обязательно соседние цифры) той же цифрой, является частью семейства из восьми простых чисел.
