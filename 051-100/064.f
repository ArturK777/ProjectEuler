: BRUT ( border -- u )   0            \ res
   SWAP 1+ 2 DO
      I S>D D>F FSQRT F>D D>S DUP DUP * I =
      IF                             \ res lim
         DROP
      ELSE 0 1 0 3 PICK              \ res lim per d m a
         BEGIN
            2 PICK * SWAP -          \ res lim per d m
            DUP DUP * I SWAP - ROT / \ res lim per m d
            OVER 4 PICK + OVER /     \ res lim per m d a
            2SWAP SWAP 1+ SWAP 2SWAP \ res lim per+1 m d a
            ROT SWAP                 \ res lim per d m a
            DUP 5 PICK 2* =          \ res lim per d m a ?
         UNTIL
         2DROP ROT 2DROP 2 MOD IF 1+ THEN
      THEN
   LOOP ;
10000 BRUT .

\EOF 1322
Odd period square roots
Problem 64

All square roots are periodic when written as continued fractions and can be written in the form:

For example, let us consider

If we continue we would get the following expansion:

The process can be summarised as follows:


It can be seen that the sequence is repeating. For conciseness, we use the notation

, to indicate that the block (1,3,1,8) repeats indefinitely.

The first ten continued fraction representations of (irrational) square roots are:

, period=
, period=
, period=
, period=
, period=
, period=
, period=
, period=
, period=
, period=Exactly four continued fractions, for

, have an odd period.

How many continued fractions for
have an odd period?

 вадратные корни с нечетным периодом
ѕроблема 64

¬се квадратные корни периодичны, когда записываютс€ в виде непрерывных дробей, и могут быть записаны в форме:

Ќапример, рассмотрим

≈сли мы продолжим, то получим следующее расширение:

ѕроцесс можно резюмировать следующим образом:


¬идно, что последовательность повтор€етс€. ƒл€ краткости воспользуемс€ обозначени€ми

, чтобы указать, что блок (1,3,1,8) повтор€етс€ бесконечно.

ѕервые дес€ть представлений (иррациональных) квадратных корней непрерывной дробью:

, период =
, период =
, период =
, период =
, период =
, период =
, период =
, период =
, период =
, период = –овно четыре непрерывных дроби, дл€

, имеют нечетный период.

—колько непрерывных дробей дл€
у вас нечетный период?