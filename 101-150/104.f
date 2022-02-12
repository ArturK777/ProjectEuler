2VARIABLE LEFT1  2VARIABLE LEFT2  VARIABLE RIGHT1  VARIABLE RIGHT2
: PANDIG?  ( n -- ? )   \ is number n pandigital? (contain all the digits 1 to 9, but not necessarily in order)
   PAD 10 ERASE
   BEGIN 10 /MOD 2DUP OR
   WHILE SWAP  PAD + DUP C@
   IF 2DROP 0 EXIT ELSE 1 SWAP C! THEN
   REPEAT  2DROP 
   PAD 9 0 DO 1+ DUP C@ 0= IF DROP FALSE UNLOOP EXIT THEN LOOP
   DROP TRUE ;
: D10^  ( i -- d{10^i} )   1. ROT 0 DO 10 1 M*/ LOOP ;   \ double power of 10
17 D10^ 2CONSTANT D17
: DFIB17  ( -- # )  \ find 1st & 2nd Fibonacci numbers >10e17 and split it
   1. 1. 3 >R  \ counter
   BEGIN  R> 1+ >R
      2SWAP 2OVER D+ 2DUP D17 D>
   UNTIL
   2DUP 2DUP LEFT1 2! 1 1000000000 M*/
   1000000000 1 M*/  2OVER 2SWAP
   D- D>S RIGHT1 ! D+
   2DUP 2DUP LEFT2 2! 1 1000000000 M*/
   1000000000 1 M*/ D- D>S RIGHT2 !  R> ;
: LEFT+  ( -- )
   LEFT1 2@ LEFT2 2@ 2DUP LEFT1 2! D+
   2DUP 999999999999999. D> IF 1 10 M*/ LEFT1 2@ 1 10 M*/ LEFT1 2! THEN LEFT2 2! ;
: RIGHT+  ( -- u )
   RIGHT1 @ RIGHT2 @ DUP RIGHT1 ! + 
   DUP 999999999 > IF 1000000000 MOD THEN DUP RIGHT2 ! ;
: MAIN  ( # -- #' )
   BEGIN 1+
      LEFT+ RIGHT+ PANDIG? 
      IF LEFT2 2@ 1 1000000 M*/ D>S PANDIG? ELSE 0 THEN
   UNTIL ;
DFIB17 MAIN .
\EOF 329468
Problem 104
Pandigital Fibonacci ends
The Fibonacci sequence is defined by the recurrence relation:
    Fn = Fn-1 + Fn-2, where F1 = 1 and F2 = 1.
It turns out that F541, which contains 113 digits, is the first Fibonacci number for which the last nine digits are 1-9 pandigital (contain all the digits 1 to 9, but not necessarily in order). And F2749, which contains 575 digits, is the first Fibonacci number for which the first nine digits are 1-9 pandigital.
Given that Fk is the first Fibonacci number for which the first nine digits AND the last nine digits are 1-9 pandigital, find k.

Пандигитальный Фибоначчи заканчивается
Последовательность Фибоначчи определяется рекуррентным соотношением:
    Fn = Fn-1 + Fn-2, где F1 = 1 и F2 = 1.
Оказывается, F541, содержащее 113 цифр, является первым числом Фибоначчи, для которого последние девять цифр являются панцифровыми от 1 до 9 (содержат все цифры от 1 до 9, но не обязательно по порядку). А F2749, который содержит 575 цифр, является первым числом Фибоначчи, для которого первые девять цифр являются панцифровыми от 1 до 9.
Учитывая, что Fk — первое число Фибоначчи, для которого первые девять цифр И последние девять цифр являются панцифровыми от 1 до 9, найдите k.

: FIBBIG  ( -- # )  \ Брутфорс не прошёл по переполнению, макс число #37965 в 7934 знаков
   2 BEGIN 1+  \ counter
      BSWAP BOVER B+ B>V$ DUP \ . TYPE CR
      112 > IF
         OVER 9 PANDIG?  DUP IF 1 ^ -ROT 2DUP TYPE CR ROT THEN         \ left 9
         -ROT 9 - + 9 PANDIG? DUP IF 2 ^ -ROT 2DUP TYPE CR ROT THEN   \ right 9
          AND
      ELSE 2DROP 0
      THEN
   UNTIL ;
\ BONE BONE FIBBIG .    \ brut fails
