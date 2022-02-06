: WAYS  ( u -- u' )
   PAD OVER 1+ CELLS ERASE  1 PAD !
   DUP 1 DO
      DUP 1+ I DO
         I J - CELLS PAD + @ 
         I CELLS PAD + DUP @ 
         ROT + SWAP !
      LOOP
   LOOP
   CELLS PAD + @ ;
100 WAYS .
\EOF 190569291
Counting summations
Problem 76
It is possible to write five as a sum in exactly six different ways:
4 + 1
3 + 2
3 + 1 + 1
2 + 2 + 1
2 + 1 + 1 + 1
1 + 1 + 1 + 1 + 1
How many different ways can one hundred be written as a sum of at least two positive integers?

ћожно записать п€ть в виде суммы ровно шестью различными способами:
4 + 1
3 + 2
3 + 1 + 1
2 + 2 + 1
2 + 1 + 1 + 1
1 + 1 + 1 + 1 + 1
—колько разных способов можно записать сотню как сумму как минимум двух положительных целых чисел?