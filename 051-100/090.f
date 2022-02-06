210 6 * ALLOCATE THROW VALUE COMB[]  \ list of all combinations 6 of 10
0 VALUE VCOMB
: VALIDCOMB  ( -- )   HERE TO VCOMB 0 C, 1 C, 0 C, 4 C, 0 C, 6 C, 1 C, 6 C, 2 C, 5 C, 3 C, 6 C, 4 C, 6 C, 6 C, 4 C, 8 C, 1 C, ;
: 9TO6  ( adr -- )   5 + DUP C@ 9 = IF 6 SWAP C! ELSE DROP THEN ;
: COMBLIST  ( -- # )   
   PAD 6 0 DO I OVER C! 1+ LOOP DROP 0 \ initial combination
   BEGIN COMB[] OVER 6 * + DUP PAD SWAP 6 CMOVE 9TO6 1+
      5 DUP PAD + 1 SWAP +!
      BEGIN DUP 0>  OVER DUP PAD + C@ SWAP 5 + < 0=  AND
      WHILE 1- DUP PAD + 1 SWAP +!
      REPEAT PAD C@ 5 <
   WHILE 1+ 6 SWAP ?DO I 1- PAD + C@ 1+ I PAD + C! LOOP
   REPEAT DROP ;
: CONT?  ( c i -- ? )   0 -ROT   \ is combination i contains c
   6 * COMB[] + DUP 6 + SWAP DO I C@ OVER = IF SWAP 1- SWAP LEAVE THEN LOOP DROP ;
: VALID?  ( j i -- ? )   -1 -ROT
   9 0 DO VCOMB I 2* + DUP C@ SWAP 1+ C@ 2DUP SWAP 2>R
      2OVER ROT SWAP CONT? -ROT CONT? AND -ROT 2DUP
      2R> ROT CONT? -ROT SWAP CONT? AND 3 ROLL OR
      0= IF ROT 1+ -ROT LEAVE THEN
   LOOP 2DROP ;
: COMB#  ( # -- #' )   0 SWAP 
   DUP 0 DO I 6 * COMB[] + C@ 0> IF LEAVE THEN
      DUP I 1+ ?DO J I VALID? IF SWAP 1+ SWAP THEN LOOP
   LOOP DROP ;
COMBLIST VALIDCOMB COMB# .
\EOF 1217

Cube digit pairs
Problem 90
Each of the six faces on a cube has a different digit (0 to 9) written on it; the same is done to a second cube. By placing the two cubes side-by-side in different positions we can form a variety of 2-digit numbers.
For example, the square number 64 could be formed: 6 4
In fact, by carefully choosing the digits on both cubes it is possible to display all of the square numbers below one-hundred: 01, 04, 09, 16, 25, 36, 49, 64, and 81.
For example, one way this can be achieved is by placing {0, 5, 6, 7, 8, 9} on one cube and {1, 2, 3, 4, 8, 9} on the other cube.
However, for this problem we shall allow the 6 or 9 to be turned upside-down so that an arrangement like {0, 5, 6, 7, 8, 9} and {1, 2, 3, 4, 6, 7} allows for all nine square numbers to be displayed; otherwise it would be impossible to obtain 09.
In determining a distinct arrangement we are interested in the digits on each cube, not the order.
{1, 2, 3, 4, 5, 6} is equivalent to {3, 6, 4, 1, 2, 5}
{1, 2, 3, 4, 5, 6} is distinct from {1, 2, 3, 4, 5, 9}
But because we are allowing 6 and 9 to be reversed, the two distinct sets in the last example both represent the extended set {1, 2, 3, 4, 5, 6, 9} for the purpose of forming 2-digit numbers.
How many distinct arrangements of the two cubes allow for all of the square numbers to be displayed?

ѕары цифр куба
Ќа каждой из шести граней куба написана сво€ цифра (от 0 до 9); то же самое проделываем со вторым кубом. ѕоместив два куба бок о бок в разные позиции, мы можем образовать множество двухзначных чисел.
Ќапример, квадрат номер 64 может быть образован: 6 4
‘актически, тщательно выбира€ цифры на обоих кубах, можно отобразить все квадратные числа меньше сотни: 01, 04, 09, 16, 25, 36, 49, 64 и 81.
Ќапример, одним из способов достижени€ этого €вл€етс€ размещение {0, 5, 6, 7, 8, 9} на одном кубе и {1, 2, 3, 4, 8, 9} на другом кубе.
ќднако дл€ этой проблемы мы позволим 6 или 9 перевернуть вверх дном, чтобы расположение вроде {0, 5, 6, 7, 8, 9} и {1, 2, 3, 4, 6, 7} позвол€ет отображать все дев€ть квадратных чисел; иначе было бы невозможно получить 09.
ѕри определении четкого расположени€ нас интересуют цифры на каждом кубе, а не пор€док.
{1, 2, 3, 4, 5, 6} эквивалентно {3, 6, 4, 1, 2, 5}
{1, 2, 3, 4, 5, 6} отличаетс€ от {1, 2, 3, 4, 5, 9}
Ќо поскольку мы позвол€ем мен€ть местами числа 6 и 9, оба разных набора в последнем примере представл€ют собой расширенный набор {1, 2, 3, 4, 5, 6, 9} с целью формировани€ двузначных чисел.
—колько различных расположений двух кубиков позвол€ет отобразить все квадратные числа?
