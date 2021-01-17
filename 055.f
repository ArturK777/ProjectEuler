: U>PAD  ( n -- len )   0 SWAP
   BEGIN  10 /MOD SWAP 2DUP OR
   WHILE  2 PICK PAD + C! SWAP 1+ SWAP
   REPEAT 2DROP ;
: PAL?  ( len -- ? )   DUP 2/ SWAP 1- SWAP 0 
   DO DUP PAD + I - C@ PAD I + C@
      <> IF DROP 0 UNLOOP EXIT THEN
   LOOP DROP -1 ;
: SUM  ( len -- len' )
   DUP 0 SWAP 128 OVER - SWAP 0
   DO PAD I + OVER + C@
      PAD I + C@ + ROT +
      10 /MOD
      SWAP PAD I + C! SWAP
   LOOP  SWAP IF 128 SWAP - PAD + 1 SWAP C! 1+ ELSE DROP THEN ;
: %REVER  ( i len -- i' len' | 0 0 )   
   DUP 0> IF DUP 
      0 DO PAD I + C@ PAD 127 + I - C! LOOP
      SUM DUP PAL? 0= 
      IF SWAP DUP 50 <
         IF 1+ SWAP
            RECURSE
         ELSE 2DROP 0 0
         THEN
      THEN
   THEN ;
: BRUT  ( border -- # )   0 SWAP
   10 DO 
      1 I U>PAD %REVER DROP 0= 
      IF 1+ I U>PAD PAL? IF I . THEN 
      THEN 
   LOOP CR ;
10000 BRUT .

\EOF 249
Lychrel numbers
Problem 55
If we take 47, reverse and add, 47 + 74 = 121, which is palindromic.
Not all numbers produce palindromes so quickly. For example,
349 + 943 = 1292,
1292 + 2921 = 4213
4213 + 3124 = 7337
That is, 349 took three iterations to arrive at a palindrome.
Although no one has proved it yet, it is thought that some numbers, like 196, never produce a palindrome. A number that never forms a palindrome through the reverse and add process is called a Lychrel number. Due to the theoretical nature of these numbers, and for the purpose of this problem, we shall assume that a number is Lychrel until proven otherwise. In addition you are given that for every number below ten-thousand, it will either (i) become a palindrome in less than fifty iterations, or, (ii) no one, with all the computing power that exists, has managed so far to map it to a palindrome. In fact, 10677 is the first number to be shown to require over fifty iterations before producing a palindrome: 4668731596684224866951378664 (53 iterations, 28-digits).
Surprisingly, there are palindromic numbers that are themselves Lychrel numbers; the first example is 4994.
How many Lychrel numbers are there below ten-thousand?
NOTE: Wording was modified slightly on 24 April 2007 to emphasise the theoretical nature of Lychrel numbers.

Числа Лихрела
Если взять 47, перевернуть и сложить 47 + 74 = 121, что является палиндромом.
Не все числа создают палиндромы так быстро. Например,
349 + 943 = 1292,
1292 + 2921 = 4213
4213 + 3124 = 7337
То есть 349 потребовалось три итерации, чтобы получить палиндром.
Хотя никто еще этого не доказал, считается, что некоторые числа, например 196, никогда не дают палиндрома. Число, которое никогда не образует палиндром через процесс переворота и сложения, называется числом Лихрела. Из-за теоретической природы этих чисел и для решения этой проблемы мы будем предполагать, что число является Лихрелом, пока не будет доказано обратное. Вдобавок вам дается, что для каждого числа ниже десяти тысяч оно либо (i) станет палиндромом менее чем за пятьдесят итераций, либо (ii) никому со всей имеющейся вычислительной мощностью пока не удалось сопоставьте его с палиндромом. Фактически, 10677 - это первое число, которое требует более пятидесяти итераций перед созданием палиндрома: 4668731596684224866951378664 (53 итерации, 28 цифр).
Удивительно, но существуют палиндромные числа, которые сами по себе являются числами Лихрела; первый пример - 4994.
Сколько же чисел Личрел меньше десяти тысяч?
ПРИМЕЧАНИЕ. 24 апреля 2007 г. формулировка была немного изменена, чтобы подчеркнуть теоретическую природу чисел Лихрела.
