: U>PAD  ( u -- # )   S>D <# #S #>  DUP >R PAD SWAP CMOVE R> ;
: SQSUM  ( u -- u' )   U>PAD  0 SWAP 0 DO PAD I + C@ 48 - DUP * + LOOP ;
: CHAIN  ( u -- ? )
   BEGIN  SQSUM
      DUP 1 = IF DROP 0 EXIT THEN
      DUP 89 = IF DROP 1 EXIT THEN
   AGAIN ;
: #89  ( lim -- # )   0 SWAP  1 DO I CHAIN + LOOP ;
10000000 #89 .   
\EOF 8581146
Square digit chains
Problem 92
A number chain is created by continuously adding the square of the digits in a number to form a new number until it has been seen before.
For example,
44 > 32 > 13 > 10 > 1 > 1
85 > 89 > 145 > 42 > 20 > 4 > 16 > 37 > 58 > 89
Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.
How many starting numbers below ten million will arrive at 89?

Цепочки с квадратными цифрами
Цепочка номеров создается путем непрерывного добавления квадрата цифр в число, чтобы сформировать новое число, пока оно не было видно раньше.
Например,
44> 32> 13> 10> 1> 1
85> 89> 145> 42> 20> 4> 16> 37> 58> 89
Следовательно, любая цепочка, которая достигает 1 или 89, застревает в бесконечной петле. Самое удивительное, что КАЖДЫЙ начальный номер в конечном итоге дойдет до 1 или 89.
Сколько начальных чисел меньше десяти миллионов дойдут до 89?