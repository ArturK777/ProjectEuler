REQUIRE CONCAT ~micro/lib/str.f
S" ..\..\LEARN\FORTH\@\LEHS\stringstack.f" INCLUDED
8 CONSTANT PRED   \ max # of prediction
9 9 PRED * * CONSTANT ALW#  \ buffer size for prediction digits
ALW# ALLOCATE THROW CONSTANT ALLOW   \ array of allowed digits for empty cells
10 ALLOCATE THROW VALUE TEMP
: ASC>  ( u -- u' )   0x0F AND ;    \ ascii number to binary number
: >ASC  ( u -- u' )   0x30 OR ;    \ binary number to ascii number
0 VALUE TUPS
: TUPLES  ( -- )   \ array [3][9][9] - rows columns blocks  
   HERE TO TUPS 81 0 DO I C, LOOP
   9 0 DO 81 0 DO J I + C, 9 +LOOP LOOP 
   0 C, 1 C, 2 C, 9 C, 10 C, 11 C, 18 C, 19 C, 20 C, 
   3 C, 4 C, 5 C, 12 C, 13 C, 14 C, 21 C, 22 C, 23 C, 
   6 C, 7 C, 8 C, 15 C, 16 C, 17 C, 24 C, 25 C, 26 C, 
   27 C, 28 C, 29 C, 36 C, 37 C, 38 C, 45 C, 46 C, 47 C, 
   30 C, 31 C, 32 C, 39 C, 40 C, 41 C, 48 C, 49 C, 50 C, 
   33 C, 34 C, 35 C, 42 C, 43 C, 44 C, 51 C, 52 C, 53 C, 
   54 C, 55 C, 56 C, 63 C, 64 C, 65 C, 72 C, 73 C, 74 C, 
   57 C, 58 C, 59 C, 66 C, 67 C, 68 C, 75 C, 76 C, 77 C, 
   60 C, 61 C, 62 C, 69 C, 70 C, 71 C, 78 C, 79 C, 80 C, ; 
: CEMPTY?  ( i -- ? )   PAD + C@ 48 = ;   \ cell empty ?
: TUPL#  ( i -- b c r )   \ i's cell belongs to row column block 
   9 /MOD  2DUP 3 / 3 * SWAP  3 / +  -ROT ;
: TUPLE?  ( i -- )   \ decoding a tuple
   1+ 9 /MOD ?DUP 0= IF ." row " . EXIT THEN
   DUP 1 = IF DROP ." column  " . EXIT THEN
   ." block " . ;
: VAL?  ( n i -- ? )   TUPL#   \ n b c r  \ is  n in cell i valid?
   3 0 DO 9 * I 81 * + DUP 9 + SWAP 
      DO TUPS I + C@ PAD + C@ ASC> 3 J - PICK = 
         IF SP@ 3 J - CELLS + SP! \ drop stack
      FALSE UNLOOP UNLOOP EXIT THEN  LOOP LOOP DROP TRUE ;
: VALID?  ( -- ? )   \ is whole solved field valid?
   27 0 DO TEMP 10 ERASE
      TUPS I 9 * + DUP 9 + SWAP DO I C@ PAD + C@ ASC> TEMP + 1+! LOOP
      TEMP 1+ 10 1 DO DUP C@ 1 > IF ." Field wrong in " J TUPLE? ." digit " I . UNLOOP UNLOOP DROP FALSE EXIT THEN 1+
      LOOP DROP 
   LOOP TRUE ; 
: PREDICT  ( -- # )   \ make predictions for each cell, return min # of, 0 means no solution
   PRED ALLOW ALW# ERASE
   81 0 DO PAD I + C@ ASC> 0= IF 
         0 10 1 DO I J VAL? 
            IF I OVER ALLOW J PRED * + + C! 1+ THEN LOOP MIN
      THEN LOOP ;
: WRT1  ( -- )   \ find & write 1 lonely predicted digit 
   ALLOW 81 0 DO
      DUP C@ ASC> ?DUP
      IF OVER 1+ C@ ASC>
         0= IF >ASC I PAD + C!
            UNLOOP DROP EXIT
         ELSE DROP THEN
      THEN PRED +
   LOOP DROP ;
: TEMP1?  ( -- )   \ any 1 in TEMP ?
   TEMP 1+ 10 1 DO DUP C@ 1 = ?DUP IF NIP UNLOOP EXIT THEN 1+ LOOP DROP 0 ;
: WRT2  ( -- ? )   TRUE \ find & write all uniq preductions in tuples , TRUE if nope
   27 0 DO  TEMP 10 ERASE
      TUPS I 9 * + DUP 9 + SWAP 2DUP DO
         ALLOW I C@ PRED * +     
         BEGIN DUP C@ ?DUP    \ loop in tuple J
         WHILE TEMP + 1+! 1+
         REPEAT DROP
      LOOP TEMP1? IF 
         DO ALLOW I C@ PRED * +
            BEGIN DUP C@ ?DUP \ loop in tuple J
            WHILE DUP TEMP + C@ 1 =
               IF >ASC I C@ PAD + C! NIP 0 SWAP
               ELSE DROP THEN 1+
            REPEAT  DROP 
         LOOP ELSE 2DROP 
         THEN LOOP ;   
: OPEN  ( $ -- fid )   SOURCE-NAME CUT-PATH 2SWAP CONCAT R/O OPEN-FILE THROW ;
: DRAW  ( -- )   CR
   9 0 DO 9 0 DO PAD J 9 * I + + C@ 
         DUP 48 = IF DROP 46 THEN SPACE EMIT
         I 1+ 3 MOD 0= IF 3 SPACES THEN LOOP CR
         I 1+ 3 MOD 0= IF CR THEN
      LOOP 25 0 DO 61 EMIT LOOP CR ;
: RESULT  ( -- u )   0. PAD 3 >NUMBER 2DROP DROP ;
: SOLVED?  ( -- ? )   \ is field solved?
   PAD 81 0 DO DUP C@ 48 = IF DROP UNLOOP FALSE EXIT THEN 1+ LOOP DROP TRUE ;
: NextEmptyCell  ( cell -- cell' )   PAD + BEGIN 1+ DUP C@ 48 = UNTIL PAD - ;
: PRED_C-#  ( cell #val -- u )      \ get predicted value from ALLOW, 0 if nope
   SWAP PRED * ALLOW + + C@ ;
: WRTCELL  ( c cell -- )   PAD + C! ;
: BRUT  ( -- )
   SEMPTY IF -1 NextEmptyCell DUP 0    \ begin with 1st empty cell
      PRED_C-# ?DUP 0= IF ." No solution " 0. EXIT THEN
      >ASC SWAP DUP -ROT WRTCELL
      DUP PRED * ALLOW + 1+ PAD 82 + PRED CMOVE
      PAD 81 + C!   PAD 82 PRED +  >STR
   ELSE STR@ + 2- C@                    \ find next empty cell
      DUP NextEmptyCell  DUP 0 PRED_C-# ?DUP
      IF >ASC OVER  WRTCELL
         DUP PRED * ALLOW + 1+ PAD 82 + PRED CMOVE
         PAD 81 + C!  PAD 82 PRED +  >STR  DROP
      ELSE DUP STR@ + 1- C@ 1+ PRED_C-# ?DUP IF 
         STR@ PAD SWAP CMOVE  SWAP WRTCELL
         ELSE DROP SDROP RECURSE
         THEN
      THEN
   THEN ;
: BRUT-  ( -- )   \ backtrack
   STR@ + PRED - DUP C@
   ?DUP IF >ASC SWAP 1- C@
      STR@ PAD SWAP CMOVE  \ restore field
      WRTCELL              \ next predicted digit
      STR@ + PRED - DUP 1+ SWAP PRED 1-
      CMOVE  \ shift stored predictions
   ELSE  DROP SDROP RECURSE  THEN ;
: SOLVE  ( -- res )
   BEGIN  PREDICT 
      ?DUP IF 1 = IF WRT1        \ lonely prediction
         ELSE WRT2               \ unique prediction in tuple
            IF BRUT THEN         \ brootforce
         THEN
      ELSE BRUT- THEN            \ backtrack
      SOLVED?
   UNTIL VALID? IF RESULT DUP . CR ELSE EXIT THEN ;
: READ  ( fid -- res )      0 \ result
   50 0 DO PAD 7 3 PICK READ-LINE THROW DROP PAD SWAP TYPE CR
      9 0 DO  PAD 9 I * + 9 3 PICK READ-LINE THROW 2DROP LOOP
      CLSTR SOLVE + DRAW LOOP ;
TUPLES S" p096_sudoku.txt"  OPEN READ . CLOSE-FILE THROW

\EOF 24702
Su Doku
Problem 96
Su Doku (Japanese meaning number place) is the name given to a popular puzzle concept. Its origin is unclear, but credit must be attributed to Leonhard Euler who invented a similar, and much more difficult, puzzle idea called Latin Squares. The objective of Su Doku puzzles, however, is to replace the blanks (or zeros) in a 9 by 9 grid in such that each row, column, and 3 by 3 box contains each of the digits 1 to 9. Below is an example of a typical starting puzzle grid and its solution grid.
p096_1.png     p096_2.png
A well constructed Su Doku puzzle has a unique solution and can be solved by logic, although it may be necessary to employ "guess and test" methods in order to eliminate options (there is much contested opinion over this). The complexity of the search determines the difficulty of the puzzle; the example above is considered easy because it can be solved by straight forward direct deduction.
The 6K text file, sudoku.txt (right click and 'Save Link/Target As...'), contains fifty different Su Doku puzzles ranging in difficulty, but all with unique solutions (the first puzzle in the file is the example above).
By solving all fifty puzzles find the sum of the 3-digit numbers found in the top left corner of each solution grid; for example, 483 is the 3-digit number found in the top left corner of the solution grid above.

Су Доку
Проблема 96
Су Доку (по-японски означает числовое место) - так называется популярная концепция головоломки. Его происхождение неясно, но следует отдать должное Леонарду Эйлеру, который изобрел похожую и гораздо более сложную идею головоломки под названием «Латинские квадраты». Однако цель головоломок Су Доку состоит в том, чтобы заменить пробелы (или нули) в сетке 9 на 9 таким образом, чтобы каждая строка, столбец и прямоугольник 3 на 3 содержали каждую из цифр от 1 до 9. Ниже приведен пример. типичной стартовой сетки головоломки и решетки ее решения.
p096_1.png p096_2.png
Хорошо построенная головоломка Su Doku имеет уникальное решение и может быть решена с помощью логики, хотя может потребоваться использование методов «предположения и проверки», чтобы исключить варианты (по этому поводу существует много спорных мнений). Сложность поиска определяет сложность головоломки; приведенный выше пример считается простым, потому что его можно решить прямым прямым выводом.
Текстовый файл размером 6K, sudoku.txt (щелкните правой кнопкой мыши и выберите «Сохранить ссылку / цель как ...»), содержит пятьдесят различных головоломок Su Doku разной сложности, но все с уникальными решениями (первая головоломка в файле - это пример выше. ).
Решив все пятьдесят головоломок, найдите сумму трехзначных чисел в верхнем левом углу каждой решетки; например, 483 - это трехзначное число в верхнем левом углу сетки решений выше.

01
003020600
900305001
001806400
008102900
700000008
006708200
002609500
800203009
005010300

: WRT2-  ( -- ? )   \ find & write 1 uniq preduction in tuple , TRUE if nope
   27 0 DO  TEMP 10 ERASE
      DEBUG IF ." Tuple " I . CR THEN
      TUPS I 9 * + DUP 9 + SWAP 2DUP DO
         DEBUG IF ." Cell " I C@ . ." : " THEN
         ALLOW I C@ PRED * +     
         BEGIN DUP C@ ?DUP    \ loop in tuple J
         WHILE  DEBUG IF DUP . THEN
            TEMP + 1+! 1+
         REPEAT DROP DEBUG IF CR THEN
      LOOP TEMP1? IF
         DEBUG IF TEMP 10 DUMP CR THEN
         DO ALLOW I C@ PRED * +
            BEGIN DUP C@ ?DUP \ loop in tuple J
            WHILE DUP TEMP + C@ 1 =
               IF DEBUG IF DUP ." Write uniq prediction to cell " I C@ . ." : " . CR THEN
                  >ASC I C@ PAD + C!  DROP UNLOOP UNLOOP FALSE EXIT
                ELSE DROP 
               THEN 1+
            REPEAT  DROP 
            DEBUG IF  CR THEN
         LOOP DROP CR
      ELSE 2DROP THEN
   LOOP TRUE ;