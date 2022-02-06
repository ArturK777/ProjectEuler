: !!  ( u -- u! )   DUP IF 1 SWAP 1+ 1 ?DO I * LOOP  ELSE DROP 1 THEN ;
: FactSum  ( u -- u' )   0 SWAP
   BEGIN 10 /MOD 2DUP OR
   WHILE SWAP !! ROT + SWAP
   REPEAT 2DROP ;
: CountPAD  ( -- # )   0 BEGIN 1+ DUP CELLS PAD + @ 0= UNTIL ;
: Uniq!?  ( u -- #|0 )   0
   BEGIN  1+ DUP CELLS PAD + @ DUP 
   WHILE  2 PICK = IF 2DROP CountPAD EXIT THEN 
   REPEAT DROP CELLS PAD + ! 0 ;
: Chain  ( u-start -- # )   0
   PAD 60 CELLS ERASE  0
   BEGIN  DROP 1+ SWAP FactSum DUP -ROT Uniq!? DUP
   UNTIL NIP NIP ;
: BRUT  ( limit -- u )   0 SWAP 1
   DO I Chain 60 = 
      IF 1+ I 7 U.R DUP 10 MOD IF ELSE CR THEN THEN 
   LOOP CR CR ;
1000000 BRUT .
\EOF 402
Digit factorial chains
Problem 74
The number 145 is well known for the property that the sum of the factorial of its digits is equal to 145:
1! + 4! + 5! = 1 + 24 + 120 = 145
Perhaps less well known is 169, in that it produces the longest chain of numbers that link back to 169; it turns out that there are only three such loops that exist:
169 > 363601 > 1454 > 169
871 > 45361 > 871
872 > 45362 > 872
It is not difficult to prove that EVERY starting number will eventually get stuck in a loop. For example,
69 > 363600 > 1454 > 169 > 363601 (> 1454)
78 > 45360 > 871 > 45361 (> 871)
540 > 145 (> 145)
Starting with 69 produces a chain of five non-repeating terms, but the longest non-repeating chain with a starting number below one million is sixty terms.
How many chains, with a starting number below one million, contain exactly sixty non-repeating terms?

Факториальные цепочки цифр
Число 145 хорошо известно тем свойством, что сумма факториала его цифр равна 145:
1! + 4! + 5! = 1 + 24 + 120 = 145
Возможно, менее известен 169, поскольку он дает самую длинную цепочку чисел, которая ведет к 169; оказывается, что таких петель всего три:
169> 363601> 1454> 169
871> 45361> 871
872> 45362> 872
Нетрудно доказать, что КАЖДЫЙ стартовый номер в конечном итоге застрянет в петле. Например,
69> 363600> 1454> 169> 363601 (> 1454)
78> 45360> 871> 45361 (> 871)
540> 145 (> 145)
Начиная с 69, получается цепочка из пяти неповторяющихся терминов, но самая длинная неповторяющаяся цепочка с начальным номером ниже одного миллиона составляет шестьдесят членов.
Сколько цепочек с начальным номером меньше миллиона содержат ровно шестьдесят неповторяющихся терминов?
