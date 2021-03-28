REQUIRE CONCAT ~micro\lib\str.f
100 CONSTANT SIZE   SIZE 3 * CONSTANT MAX-LEN
CREATE #DUMP SIZE DUP * CELLS ALLOT  \ array 100x100
: C>N ( adr -- u ) DUP C@ 48 - 10 * SWAP 1+ C@ 48 - +  ; \ convert chars to numbers
: READ-DUMP ( $ -- )   \ read input file.txt into memory array
   SOURCE-NAME CUT-PATH 2SWAP CONCAT R/O OPEN-FILE THROW 0
   BEGIN 1+ OVER PAD MAX-LEN ROT READ-LINE THROW
   WHILE DROP DUP 0 DO PAD I 2 * I + + C>N
   OVER 1- SIZE CELLS * I CELLS + #DUMP + ! LOOP
   REPEAT 2DROP CLOSE-FILE THROW ;
: CHECK  ( -- )   \ just checking array, not used
   SIZE 0 DO I 1+ 0 DO J SIZE CELLS * I CELLS #DUMP + + @ . LOOP CR LOOP ;
: DYNAPROG  ( -- max-sum)
   1 SIZE 1- DO
      I SIZE CELLS * #DUMP + 
      I 0 DO DUP I CELLS + DUP
         @ SWAP CELL+ @ MAX 
         OVER SIZE CELLS - I CELLS + DUP @ ROT + SWAP !
      LOOP DROP
   -1 +LOOP #DUMP @ ;
S" p067_triangle.txt" READ-DUMP DYNAPROG . CR
\EOF 7273
: BRUT ( -- max-sum ) 0 2 SIZE 2 - LSHIFT 1 0 ^
   DO #DUMP C@ 1 ^ 0 SIZE 1- 0
      DO J I RSHIFT 1 AND +
         #DUMP OVER I 1+ SIZE * + + C@        ROT + SWAP
      LOOP DROP MAX
   LOOP ;

index = 0;
    for (int j = 0;
         j < inputTriangle.GetLength(0) - 1; j++)
         {         index = index + (i >> j & 1);
        tempSum += inputTriangle[j + 1, index]
                  ;
    }
---------------

string filename = Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory) + "\\input.txt";
int[,] inputTriangle = readInput(filename);

int posSolutions = (int)Math.Pow(2, inputTriangle.GetLength(0) - 1);
int largestSum = 0;
int tempSum, index;

for (int i = 0; i <= posSolutions; i++) {
    tempSum = inputTriangle[0, 0];
    index = 0;
    for (int j = 0; j < inputTriangle.GetLength(0) - 1; j++)
         {         index = index + (i >> j & 1);
        tempSum += inputTriangle[j + 1, index];
    }
    if (tempSum > largestSum) {
        largestSum = tempSum;
    }
}

Maximum path sum II
Problem 67
By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
3
7 4
2 4 6
8 5 9 3
That is, 3 + 7 + 4 + 9 = 23.
Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'), a 15K text file containing a triangle with one-hundred rows.
NOTE: This is a much more difficult version of Problem 18. It is not possible to try every route to solve this problem, as there are 299 altogether! If you could check one trillion (1012) routes every second it would take over twenty billion years to check them all. There is an efficient algorithm to solve it. ;o)


