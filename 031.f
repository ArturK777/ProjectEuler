CREATE COINS 1 C, 2 C, 5 C, 10 C, 20 C, 50 C, 100 C, 200 C,
CREATE WAYS  1 , 200 CELLS ALLOT 
: BRUT  ( border -- ways )   1+ 7 0
   DO DUP COINS I + C@
      DO WAYS I CELLS + @ 
         I  COINS J + C@  - CELLS  WAYS + @  +
         WAYS I CELLS +  !
      LOOP
   LOOP DROP
   WAYS 200 CELLS + @ 1+ ;
200 BRUT .
\EOF 73682
Coin sums
Problem 31
In the United Kingdom the currency is made up of pound (f) and pence (p). There are eight coins in general circulation:
    1p, 2p, 5p, 10p, 20p, 50p, f1 (100p), and f2 (200p).
It is possible to make F2 in the following way:
    1xf1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
How many different ways can ?2 be made using any number of coins?

C# :
int target = 200;
int[] coinSizes = { 1, 2, 5, 10, 20, 50, 100, 200 };
int[] ways = new int[target+1];
ways[0] = 1;
 
for (int i = 0; i < coinSizes.Length; i++) {
    for (int j = coinSizes[i]; j <= target; j++) {
        ways[j] += ways[j - coinSizes[i]];
    }
}
