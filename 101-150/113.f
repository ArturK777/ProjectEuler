ms@ VALUE STOPWATCH
2VARIABLE TEMP
: MAIN  ( power -- du )   DUP 
   10 0 DO I 1+ 0 PAD I 2* CELLS + 2! LOOP
   9. ROT 1 DO 0.
      10 0 DO PAD I 2* CELLS + 2@ D+ LOOP  2DUP TEMP 2!
      D2* D+  PAD 18 CELLS + 2@ -10 M+ D-
      0 9 DO 
         PAD I 2* CELLS + 2@
         TEMP 2@ 2DUP PAD I 2* CELLS + 2!
         2SWAP D- TEMP 2!
      -1 +LOOP
   LOOP ROT 1- 20 * NEGATE M+ ;
100 MAIN D.
ms@ STOPWATCH - CR . .( ms) CR

\EOF 51161058134250 0 ms
Problem 113
Non-bouncy numbers

Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number; for example, 134468.
Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.
We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.
As n increases, the proportion of bouncy numbers below n increases such that there are only 12951 numbers below one-million that are not bouncy and only 277032 non-bouncy numbers below 10^10.
How many numbers below a googol (10^100) are not bouncy?

Непрыгучие числа
Работая слева направо, если ни одна цифра не превышает цифру слева от нее, это называется возрастающим числом; например, 134468.
Точно так же, если ни одна цифра не превышает цифру справа от нее, это называется убывающим числом; например, 66420.
Мы будем называть положительное целое число, которое не увеличивается и не уменьшается, «прыгучим» числом; например, 155349.
По мере увеличения n доля прыгучих чисел ниже n увеличивается, так что только 12 951 число меньше одного миллиона не являются прыгучими, и только 277 032 не прыгучих числа меньше 10^10.
Сколько чисел ниже гугола (10^100) не являются прыгучими?