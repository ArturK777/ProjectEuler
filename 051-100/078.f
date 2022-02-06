0 VALUE #LST
: SGN  ( u -- -1|1 )   4 MOD 1 > IF -1 ELSE 1 THEN ;
: LIST-INIT  ( -- )   HERE 0 OVER ! TO #LST ;
: LIST-ADD  ( u -- )   #LST DUP 1+! DUP @ CELLS + ! ;
: LIST#  ( i -- u )   1+ CELLS #LST + @ ;
: BRUT  ( -- u )   0
   BEGIN 1+ 0 1
      0 LIST-ADD
      BEGIN DUP 3 PICK > 0=
      WHILE
         2 PICK SWAP - LIST# OVER SGN *
         2 PICK LIST# + 1000000 MOD
         2 PICK 1+ CELLS #LST + !
         1+ DUP 2 MOD IF -1 ELSE 1 THEN OVER 2/ 1+ *
         DUP 3 * 1- * 2/ 
      REPEAT 2DROP
      DUP LIST# 0=
   UNTIL ;
LIST-INIT 1 LIST-ADD BRUT .

\EOF 55374
Coin partitions
Problem 78
Let p(n) represent the number of different ways in which n coins can be separated into piles. For example, five coins can be separated into piles in exactly seven different ways, so p(5)=7.
OOOOO
OOOO   O
OOO   OO
OOO   O   O
OO   OO   O
OO   O   O   O
O   O   O   O   O
Find the least value of n for which p(n) is divisible by one million.

Перегородки для монет
Пусть p (n) представляет количество различных способов, которыми n монет можно разделить на стопки. Например, пять монет можно разделить на стопки ровно семью различными способами, поэтому p (5) = 7.
ООООО
ОООО О
ООО ОО
ООО О О
OO OO O
OO O O O
О О О О О
Найдите наименьшее значение n, для которого p (n) делится на один миллион.