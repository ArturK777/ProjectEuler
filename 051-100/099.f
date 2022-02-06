CREATE REDUCT 0 ,  CREATE MAX# 0 ,  CREATE MAXD 0 , 0 ,
: OPEN  ( $ -- fid )   R/O OPEN-FILE THROW ;
: READ  ( fid -- power u !eof? )
   PAD 16 ROT READ-LINE THROW  PAD ROT S" ," SEARCH
   IF 2DUP 1- SWAP 1+ SWAP 0. 2SWAP >NUMBER 2DROP DROP -ROT
      DROP PAD - PAD SWAP 0. 2SWAP >NUMBER 2DROP DROP ROT
   ELSE 2DROP THEN ;
: PWR  ( power u -- ud )   \ multiply power times, check if > 10^9 then divide to 10^9
   0 REDUCT ! DUP 0 
   3 ROLL 0 DO
      2DUP 100000000. D> IF REDUCT 1+! 100000000 ELSE 1 THEN
      3 PICK SWAP M*/
   LOOP ROT DROP ;
: BRUT  ( fid -- # )
   1 0 BEGIN  2 PICK READ  
   WHILE PWR 
      2DUP 100000000. D> IF REDUCT 1+! 1 100000000 M*/ THEN  REDUCT @
      DUP 4 PICK > 
      IF -ROT MAXD 2! NIP OVER MAX# ! 
      ELSE 3 PICK = 
         IF MAXD 2@ D>
            IF OVER MAX# ! THEN
         ELSE 2DROP THEN
      THEN 
      SWAP 1+ SWAP
   REPEAT 2DROP MAX# @ ;
S" C:\YaDisk\CODE\LEARN\FORTH\@\ProjectEuler.net\p099_base_exp.txt" OPEN 
BRUT . CLOSE-FILE THROW
\EOF 709
Largest exponential
Problem 99
Comparing two numbers written in index form like 2^11 and 3^7 is not difficult, as any calculator would confirm that 211 = 2048 < 37 = 2187.
However, confirming that 632382^518061 > 519432^525806 would be much more difficult, as both numbers contain over three million digits.
Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file containing one thousand lines with a base/exponent pair on each line, determine which line number has the greatest numerical value.
NOTE: The first two lines in the file represent the numbers in the example given above.

Наибольшая экспонента
Сравнение двух чисел, записанных в виде индекса, например 2^11 и 3^7, несложно, поскольку любой калькулятор подтвердит, что 211 = 2048 <37 = 2187.
Однако подтвердить, что 632382^518061> 519432^525806 будет намного сложнее, поскольку оба числа содержат более трех миллионов цифр.
Используя base_exp.txt (щелкните правой кнопкой мыши и «Сохранить ссылку / цель как ...»), текстовый файл размером 22 КБ, содержащий одну тысячу строк с парой основание / показатель в каждой строке, определите, какой номер строки имеет наибольшее числовое значение.
ПРИМЕЧАНИЕ. Первые две строки в файле представляют собой числа из приведенного выше примера.