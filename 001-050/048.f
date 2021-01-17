3001 CONSTANT LEN
CREATE POWSUM LEN ALLOT
CREATE TEMP LEN ALLOT
: N>TEMP  ( i -- # )
   TEMP LEN ERASE  0 SWAP
   BEGIN  10 /MOD SWAP 2DUP OR
   WHILE  2 PICK TEMP + C! SWAP 1+ SWAP
   REPEAT 2DROP ;
: POW  ( i -- )   \ i^i
   DUP N>TEMP  DROP
   DUP 1 ?DO 0 LEN 0
      DO OVER
         TEMP I + C@  *
         10 /MOD SWAP ROT +
         10 /MOD ROT + SWAP
         TEMP I +  C!
      LOOP DROP
   LOOP DROP  ;
: SUM  ( # -- )
   0 DO
      I 1+ POW
      0 LEN 0 DO
         POWSUM I + C@
         TEMP I + C@ +
         10 /MOD  SWAP ROT +
         10 /MOD  ROT + SWAP
         POWSUM I + C!
      LOOP DROP
   LOOP ;
\ : TYP  ( -- )   LEN 0 DO POWSUM LEN I - 1- + C@ 48 + EMIT LOOP ;
: TYP  ( -- )   POWSUM DUP LEN + 1- DO I C@ 48 + EMIT -1 +LOOP ;
1000 SUM TYP

\EOF 9110846700
Self powers
Problem 48
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
