0 VALUE LIM   0 VALUE LIM2  0 VALUE #FAC  0 VALUE K
: KINIT  ( lim -- )   
   DUP TO LIM  
   DUP 2* TO LIM2  
   S>D D>F FLOG2 F>D D>S DUP TO #FAC ." #factors=" . CR  
   LIM2 1+ CELLS ALLOCATE THROW DUP TO K
   8 + LIM 1+ 2 DO I 2* OVER ! CELL+ LOOP DROP  ;  \ init K array
: I'FAC  ( i -- u )   CELLS PAD + @ ;              \ i's factor
: I'FAC++  ( i -- )   CELLS PAD + 1+! ;          \ inc i's factor
: PROSUM  ( # -- prod sum )  1 0 ROT 0
   DO I CELLS PAD + @ DUP ROT + -ROT * SWAP LOOP ;
: BRANCH  ( -- )   OVER 1- OVER =
   IF DUP I'FAC++
      OVER PROSUM
      OVER LIM2 >
      IF 2DROP 1- 
      ELSE
         OVER SWAP - 3 PICK +
         DUP LIM > 0=
         2 PICK 2 PICK CELLS K + @
         < AND
         IF CELLS K + ! ELSE 2DROP THEN
      THEN 
   EXIT THEN
   DUP I'FAC OVER 1+ I'FAC <
   IF DUP I'FAC
      OVER 1+ CELLS PAD + !
      DUP I'FAC++  1+
   EXIT THEN
   DUP I'FAC OVER 1+ I'FAC < 0= IF 1- THEN ;
: BRUT  ( -- )
   1 PAD !  1 0
   BEGIN DUP 
      IF BRANCH
      ELSE
         OVER #FAC = IF 2DROP EXIT THEN
         0 I'FAC 1 I'FAC < 
         IF 0 I'FAC++
         ELSE
            OVER CELLS PAD + 0x7FFF SWAP !
            2 PAD !  SWAP 1+ SWAP
         THEN
         1+ 0 I'FAC 1-  PAD CELL+ ! 
      THEN
   AGAIN ;
: KSUM  ( -- u )   LIM 1+ 2 
   DO K I CELLS + @ LIM 1+ I 1+
      ?DO K I CELLS + @ DUP 
         IF OVER = IF 0 K I CELLS + ! THEN  \ zero dubs
         ELSE DROP THEN 
      LOOP DROP
   LOOP 
   0 LIM 1+ 2 DO K I CELLS + @ + LOOP ;
12000 KINIT BRUT KSUM .

\EOF 7587457

2 * 5 = 10
2 + 5 = 7 + 1 + 1 + 1 = 10 = 2 + 5 + 1 + 1 + 1 =  10 k=5 


Product-sum numbers
Problem 88
A natural number, N, that can be written as the sum and product of a given set of at least two natural numbers, {a1, a2, ... , ak} is called a product-sum number: N = a1 + a2 + ... + ak = a1 * a2 * ... * ak.
For example, 6 = 1 + 2 + 3 = 1 * 2 * 3.
For a given set of size, k, we shall call the smallest N with this property a minimal product-sum number. The minimal product-sum numbers for sets of size, k = 2, 3, 4, 5, and 6 are as follows.
k=2: 4 = 2 * 2 = 2 + 2
k=3: 6 = 1 * 2 * 3 = 1 + 2 + 3
k=4: 8 = 1 * 1 * 2 * 4 = 1 + 1 + 2 + 4
k=5: 8 = 1 * 1 * 2 * 2 * 2 = 1 + 1 + 2 + 2 + 2
k=6: 12 = 1 * 1 * 1 * 1 * 2 * 6 = 1 + 1 + 1 + 1 + 2 + 6
Hence for 2<=k<=6, the sum of all the minimal product-sum numbers is 4+6+8+12 = 30; note that 8 is only counted once in the sum.
In fact, as the complete set of minimal product-sum numbers for 2<=k<=12 is {4, 6, 8, 12, 15, 16}, the sum is 61.
What is the sum of all the minimal product-sum numbers for 2<=k<=12000?

Числа продукта-суммы
Проблема 88
Натуральное число N, которое может быть записано как сумма и произведение данного набора по крайней мере двух натуральных чисел, {a1, a2, ..., ak}, называется числом произведение-сумма: N = a1 + a2 + ... + ак = а1 * а2 * ... * ак.
Например, 6 = 1 + 2 + 3 = 1 * 2 * 3.
Для данного набора размера k мы будем называть наименьшее N с этим свойством минимальным числом произведения-суммы. Минимальные значения суммы произведения для наборов размера k = 2, 3, 4, 5 и 6 следующие.
к = 2: 4 = 2 * 2 = 2 + 2
к = 3: 6 = 1 * 2 * 3 = 1 + 2 + 3
к = 4: 8 = 1 * 1 * 2 * 4 = 1 + 1 + 2 + 4
к = 5: 8 = 1 * 1 * 2 * 2 * 2 = 1 + 1 + 2 + 2 + 2
к = 6: 12 = 1 * 1 * 1 * 1 * 2 * 6 = 1 + 1 + 1 + 1 + 2 + 6
Следовательно, для 2<=K<=6 сумма всех минимальных чисел произведения-суммы равна 4 + 6 + 8 + 12 = 30; обратите внимание, что 8 засчитывается в сумме только один раз.

Фактически, поскольку полный набор чисел минимальной суммы произведения для 2 <= k <= 12 равен {4, 6, 8, 12, 15, 16}, сумма равна 61.

Какова сумма всех минимальных чисел произведения-суммы для 2 <= k <= 12000?
