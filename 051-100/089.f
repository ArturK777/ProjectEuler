REQUIRE CONCAT ~micro\lib\str.f
16 CONSTANT BUF
: OPEN  ( $ -- fid )   SOURCE-NAME CUT-PATH 2SWAP CONCAT R/O OPEN-FILE THROW ;
: ROMSAVE  ( len -- save )   0 
   PAD 2 PICK S" DCCCC" SEARCH IF DROP 5 BLANK 3 + ELSE 2DROP THEN
   PAD 2 PICK S" LXXXX" SEARCH IF DROP 5 BLANK 3 + ELSE 2DROP THEN
   PAD 2 PICK S" VIIII" SEARCH IF DROP 5 BLANK 3 + ELSE 2DROP THEN
   PAD 2 PICK S" CCCC" SEARCH NIP NIP IF 2+ THEN
   PAD 2 PICK S" XXXX" SEARCH NIP NIP IF 2+ THEN
   PAD 2 PICK S" IIII" SEARCH NIP NIP IF 2+ THEN
   NIP ;
: READ  ( fid -- fid savesum )   0
   BEGIN PAD BUF 3 PICK READ-LINE THROW OVER BUF > ABORT" Enlarge buffer!"
   WHILE  ROMSAVE +
   REPEAT DROP ;
: CLOSE  ( fid -- )   CLOSE-FILE THROW ;   
S" p089_roman.txt"  OPEN READ . CLOSE

\EOF 743

Roman numerals
Problem 89
For a number written in Roman numerals to be considered valid there are basic rules which must be followed. Even though the rules allow some numbers to be expressed in more than one way there is always a "best" way of writing a particular number.
For example, it would appear that there are at least six ways of writing the number sixteen:
IIIIIIIIIIIIIIII
VIIIIIIIIIII
VVIIIIII
XIIIIII
VVVI
XVI
However, according to the rules only XIIIIII and XVI are valid, and the last example is considered to be the most efficient, as it uses the least number of numerals.
The 11K text file, roman.txt (right click and 'Save Link/Target As...'), contains one thousand numbers written in valid, but not necessarily minimal, Roman numerals; see About... Roman Numerals for the definitive rules for this problem.
Find the number of characters saved by writing each of these in their minimal form.
Note: You can assume that all the Roman numerals in the file contain no more than four consecutive identical units.

римские цифры
Чтобы число, написанное римскими цифрами, считалось действительным, необходимо соблюдать основные правила. Несмотря на то, что правила позволяют выражать некоторые числа более чем одним способом, всегда есть «лучший» способ записать конкретное число.
Например, может показаться, что существует по крайней мере шесть способов написать число шестнадцать:
IIIIIIIIIIIIIIII
VIIIIIIIIIII
VVIIIIII
XIIIIII
VVVI
XVI
Однако по правилам действительны только XIIIIII и XVI, и последний пример считается наиболее эффективным, так как в нем используется наименьшее количество цифр.
Текстовый файл размером 11 КБ, roman.txt (щелкните правой кнопкой мыши и выберите «Сохранить ссылку / цель как ...»), содержит тысячу чисел, записанных действительными, но не обязательно минимальными римскими цифрами; см. О ... Римские цифры для окончательных правил решения этой проблемы.
Найдите количество сохраненных символов, записав каждый из них в минимальной форме.
Примечание. Можно предположить, что все римские цифры в файле содержат не более четырех последовательных одинаковых единиц.
