REQUIRE CONCAT ~micro/lib/str.f
: OPEN  ( $ -- fid )   SOURCE-NAME CUT-PATH 2SWAP CONCAT R/O OPEN-FILE THROW ;
: PARSE_WORD  ( c-adr len -- # )   \ parse string in PAD(len) for unsigned words to c-adr, ret quantity of them 
   0  PAD ROT
   BEGIN  0. 2SWAP >NUMBER  2SWAP DROP  OVER
   WHILE 3 PICK CELLS 5 PICK + !
      1- ROT 1+ ROT 1+ ROT
   REPEAT NIP NIP -ROT DUP >R CELLS + ! R> 1+ ;
: X^Y  ( y x -- x^y )   DUP ROT 1 ?DO OVER * LOOP NIP ;
: SUMDIM  ( adr # -- sum )   0 SWAP 0 DO OVER I CELLS + @ + LOOP NIP ; 
: CHECK1  ( adr # -- 0|sum )
   DUP 2 X^Y DUP CELLS ALLOCATE THROW  
   OVER 1 DO 0 I 
      4 PICK 0 DO DUP 1 AND 1 = IF
            SWAP 5 PICK I CELLS + @ + SWAP THEN 2/
      LOOP DROP 
      OVER I CELLS + !
   LOOP
   \ OVER 0 DO DUP I CELLS + @ . I 1+ 16 MOD 0= IF CR THEN LOOP CR CR  \ check
   OVER 1 DO DUP I CELLS + @ I 1+ DUP 4 PICK < IF
         BEGIN
            2 PICK OVER CELLS + @ 2 PICK = 
            IF I OVER AND 0= IF 2DROP 2DROP 2DROP 0 UNLOOP EXIT THEN THEN 
            1+ DUP 4 PICK =
         UNTIL 2DROP
      THEN
   LOOP 2DROP 2DROP SUMDIM ;
: CHECK2  ( adr # -- ? )
   OVER @  0
   2 PICK 2/ 0 DO 
      3 PICK 3 PICK 1- I - CELLS + @ + SWAP
      3 PICK I 1+ CELLS + @ + SWAP  2DUP > 0= IF UNLOOP 2DROP 2DROP FALSE EXIT THEN
   LOOP 2DROP 2DROP TRUE ;
: SORT  ( adr # -- )   1- 0   \ Sort # words in adr
   BEGIN >R OVER R@ CELLS + @ 2 PICK R@ 1+ CELLS + @ 2DUP >
      IF 3 PICK R@ CELLS + !  2 PICK R@ 1+ CELLS + ! R> DUP
         IF 1- THEN  
      ELSE 2DROP R> 1+
      THEN 2DUP = 
   UNTIL 2DROP DROP ;
: READ  ( fid -- sum fid )   >R  0    \ result
   BEGIN PAD 80 R@ READ-LINE THROW
   WHILE
      PAD 80 + DUP ROT PARSE_WORD  2DUP SORT 
      \ 2DUP 0 DO DUP @ . CELL+ LOOP CR DROP
      2DUP CHECK2 
      IF CHECK1  ELSE 2DROP 0 THEN  +
   REPEAT DROP R> ;
S" p105_sets.txt"  OPEN READ CLOSE-FILE THROW . CR


\EOF  73702
Problem 105
Special subset sums: testing
Let S(A) represent the sum of elements in set A of size n. We shall call it a special sum set if for any two non-empty disjoint subsets, B and C, the following properties are true:
    S(B) <> S(C); that is, sums of subsets cannot be equal.
    If B contains more elements than C then S(B) > S(C).
For example, {81, 88, 75, 42, 87, 84, 86, 65} is not a special sum set because 65 + 87 + 88 = 75 + 81 + 84 (240) , whereas {157, 150, 164, 119, 79, 159, 161, 139, 158} satisfies both rules for all possible subset pair combinations and S(A) = 1286.
Using sets.txt (right click and "Save Link/Target As..."), a 4K text file with one-hundred sets containing seven to twelve elements (the two examples given above are the first two sets in the file), identify all the special sum sets, A1, A2, ..., Ak, and find the value of S(A1) + S(A2) + ... + S(Ak).
NOTE: This problem is related to Problem 103 and Problem 106.

Специальные суммы подмножеств: тестирование
Пусть S(A) представляет собой сумму элементов множества A размера n. Мы будем называть его специальным суммирующим множеством, если для любых двух непустых непересекающихся подмножеств B и C верны следующие свойства:
    С(В) <> С(С); то есть суммы подмножеств не могут быть равны.
    Если B содержит больше элементов, чем C, то S(B) > S(C).
Например, {81, 88, 75, 42, 87, 84, 86, 65} не является специальным набором сумм, поскольку 65 + 87 + 88 = 75 + 81 + 84, тогда как {157, 150, 164, 119, 79 , 159, 161, 139, 158} удовлетворяет обоим правилам для всех возможных комбинаций пар подмножеств и S(A) = 1286.
Используя set.txt (щелчок правой кнопкой мыши и «Сохранить ссылку/цель как...»), текстовый файл 4K с сотней наборов, содержащих от семи до двенадцати элементов (два примера, приведенные выше, являются первыми двумя наборами в файле), идентифицируйте все специальные наборы сумм, A1, A2, ..., Ak, и найдите значение S (A1) + S (A2) + ... + S (Ak).
