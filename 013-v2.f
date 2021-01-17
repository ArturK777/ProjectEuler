REQUIRE CONCAT ~micro\lib\str.f
0 VALUE FID \ fileid
CREATE TSTR 50 ALLOT
: OPEN-DUMP ( -- ) SOURCE-NAME        CUT-PATH S" 013.txt" CONCAT        R/O OPEN-FILE THROW TO FID ;
: READ-N11 ( a -- d ) \ convert string of 11 chars to double
        10 + DUP C@ 48 - 0 \ low digit double
        1 9 0 DO ( a d-sum n-mult )
                >R ROT 1- DUP >R C@ 48 - 0 2R> >R 10 * DUP >R 1 M*/ D+ 2R> 2SWAP ROT
        LOOP DROP ROT 1- C@ 48 -        10000000000. ROT 1 M*/ D+ ;
: READ-DUMP ( -- ) 0 0  \ get dump to mem
        BEGIN TSTR 50 FID READ-LINE THROW   \ read chars
  WHILE DROP TSTR READ-N11 D+ \ get sum
  REPEAT DROP
  FID CLOSE-FILE THROW ;

OPEN-DUMP READ-DUMP 1 1000 M*/ D.

\EOF 5537376230
Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.
Найдите первые десять цифр суммы следующих ста 50-значных чисел.
013.txt