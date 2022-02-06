REQUIRE CONCAT ~micro\lib\str.f
: READ2PAIRS ( $ -- # )   \ read pairs from input file.txt into PAD
   SOURCE-NAME CUT-PATH 2SWAP CONCAT R/O OPEN-FILE THROW 0
   BEGIN PAD 4 3 PICK READ-FILE THROW DUP
   WHILE 1- 0
      DO PAD I + C@ OVER 4 * I PAD 20 + + + C! LOOP 
      20 OVER 4 * PAD + + 1+ DUP 1+ 2 CMOVE> 1+ 
   REPEAT DROP SWAP CLOSE-FILE THROW ;
: PAIRS  ( # -- $ )   2*  10 0 DO I 48 + I PAD 10 + + C! LOOP
   0 BEGIN
      10 0 DO
         PAD 10 I + + C@
         IF \ digit exist in passcode and not ordered
            -1 2 PICK 0
            DO PAD 20 + I 2* + 1+ C@ J 48 + = 
               IF 1+ LEAVE THEN
            LOOP
            IF 0 2 PICK 0
               DO PAD 20 + I 2* + C@ J 48 + =
                  IF 1+ PAD 20 + I 2* + 2 ERASE THEN  \ remove pairs
               LOOP
               IF DUP PAD + I 48 + SWAP C! 1+ THEN
               0 PAD 10 I + + C!  \ exclude digit from set
            THEN
         THEN
      LOOP
      OVER PAD 20 + DUP ROT + SWAP 0 -ROT
      DO I C@ + LOOP  \ any pair exist ?
   WHILE
   REPEAT
   NIP PAD 10 + DUP 10 + SWAP DO I C@ DUP IF LEAVE ELSE DROP THEN LOOP
   OVER PAD + C!  PAD SWAP 1+ ;
S" p079_keylog.txt" READ2PAIRS PAIRS TYPE
\EOF 73162890
Passcode derivation
Problem 79
A common security method used for online banking is to ask the user for three random characters from a passcode. For example, if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.
The text file, keylog.txt, contains fifty successful login attempts.
Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.

Обычный метод безопасности, используемый для онлайн-банкинга, - запросить у пользователя три случайных символа из пароля. Например, если код доступа был 531278, они могут запросить 2-й, 3-й и 5-й символы; ожидаемый ответ: 317.
Текстовый файл keylog.txt содержит пятьдесят успешных попыток входа в систему.
Учитывая, что три символа всегда запрашиваются по порядку, проанализируйте файл, чтобы определить самый короткий секретный код доступа неизвестной длины.