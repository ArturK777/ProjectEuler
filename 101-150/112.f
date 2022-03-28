ms@ VALUE STOPWATCH
: U>PAD  ( u -- # )   S>D <# #S #>  DUP >R PAD SWAP CMOVE R> ;
: REVPAD  ( # -- )   \ Reverse # chars in PAD
   1- DUP 1+ 2/ 0 DO DUP PAD I - + DUP C@  PAD I + DUP C@ 3 ROLL C! C!  LOOP DROP ;
: BOUNCE?  ( # -- ? )   PAD C@ SWAP
   1 DO PAD I + C@ TUCK > IF DROP UNLOOP TRUE EXIT THEN LOOP DROP FALSE ;
: PAD>  ( # -- )   DUP PAD + 1- C@ PAD C@ < IF REVPAD ELSE DROP THEN ;
: BRUT  ( u% -- u )  0 100 
   BEGIN 1+ DUP 1+
      U>PAD DUP PAD> BOUNCE?
      IF SWAP 1+ SWAP OVER 100 * OVER / 3 PICK = 
      ELSE FALSE THEN
   UNTIL NIP NIP ;
99 BRUT .
ms@ STOPWATCH - CR . .( ms) CR

\EOF 1587000 141 ms
Problem 112
Bouncy numbers
Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number; for example, 134468.
Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.
We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.
Clearly there cannot be any bouncy numbers below one-hundred, but just over half of the numbers below one-thousand (525) are bouncy. In fact, the least number for which the proportion of bouncy numbers first reaches 50% is 538.
Surprisingly, bouncy numbers become more and more common and by the time we reach 21780 the proportion of bouncy numbers is equal to 90%.
Find the least number for which the proportion of bouncy numbers is exactly 99%.

Прыгучие числа
Работая слева направо, если ни одна цифра не превышает цифру слева от нее, это называется возрастающим числом; например, 134468.
Точно так же, если ни одна цифра не превышает цифру справа от нее, это называется убывающим числом; например, 66420.
Мы будем называть положительное целое число, которое не увеличивается и не уменьшается, «прыгучим» числом; например, 155349.
Ясно, что прыгучих чисел меньше ста быть не может, но чуть более половины чисел меньше тысячи (525) являются прыгучими. На самом деле, наименьшее число, для которого доля прыгучих чисел впервые достигает 50%, — это 538.
Удивительно, но прыгучие числа становятся все более и более распространенными, и к тому времени, когда мы достигнем 21780, доля прыгучих чисел равна 90%.
Найдите наименьшее число, для которого доля прыгучих чисел составляет ровно 99%.
