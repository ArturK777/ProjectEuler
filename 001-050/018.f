REQUIRE CONCAT ~micro\lib\str.f
15 CONSTANT SIZE
CREATE #DUMP SIZE DUP * ALLOT #DUMP SIZE DUP * ERASE \ array 15x15
CREATE TSTR SIZE 3 * ALLOT \ temp string    
: C>N ( a -- u ) DUP C@ 48 - 10 * SWAP 1+ C@ 48 - + ; \ convert
: OPEN-DUMP ( -- fileid ) SOURCE-NAME CUT-PATH S" 018.txt" CONCAT R/O OPEN-FILE THROW ;
: READ-DUMP ( fileid -- ) 0
   BEGIN 1+ OVER TSTR SIZE 3 * ROT READ-LINE THROW
   WHILE DROP DUP 0 DO TSTR I 2 * I + + C>N OVER 1- SIZE * I + #DUMP + C! LOOP
   REPEAT 2DROP CLOSE-FILE THROW ;
: CHECK SIZE 0 DO I 1+ 0 DO J SIZE * I #DUMP + + C@ . LOOP CR  LOOP ;
: BRUT ( -- max-sum ) 0 2 SIZE 2 - LSHIFT 1 
DO #DUMP C@ 0 SIZE 1- 0 
	DO J I RSHIFT 1 AND +
		#DUMP OVER I 1+ SIZE * + + C@	ROT + SWAP
	LOOP DROP MAX
LOOP ;
OPEN-DUMP READ-DUMP BRUT . CR
\ CHECK

\EOF

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

Maximum path sum I
Problem 18
By starting at the top of the triangle below and moving 
to adjacent numbers on the row below, 
the maximum total from top to bottom is 23.

3
7 4 		 Vars: ( SIZE - 1 ) ** 2 = 4  ( 9 )
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)

Íà÷àâ ñ âåðøèíû òðåóãîëüíèêà íèæå è äâèãàÿñü
íà ñîñåäíèå ÷èñëà â ñòðîêå íèæå,
ìàêñèìàëüíàÿ ñóììà ñâåðõó âíèç - 23.

3
7 4
2 4 6
8 5 9 3

Òî åñòü 3 + 7 + 4 + 9 = 23.
Íàéäèòå ìàêñèìàëüíóþ ñóììó ñâåðõó âíèç â òðåóãîëüíèêå íèæå:
ÏÐÈÌÅ×ÀÍÈÅ. Ïîñêîëüêó ñóùåñòâóåò òîëüêî 16384 ìàðøðóòà, ìîæíî ðåøèòü ýòó ïðîáëåìó, ïðîáóÿ êàæäûé ìàðøðóò. Îäíàêî çàäà÷à 67 - ýòî òà æå ïðîáëåìà ñ òðåóãîëüíèêîì, ñîäåðæàùèì ñòî ñòðîê; ýòî íå ìîæåò áûòü ðåøåíî ãðóáîé ñèëîé è òðåáóåò óìíîãî ìåòîäà! ; î)

