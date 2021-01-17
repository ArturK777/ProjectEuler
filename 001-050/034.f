CREATE Fact 1 , 9 CELLS ALLOT  
: FactFill  1 10 1 DO I * DUP Fact I CELLS + ! LOOP DROP ;
: Brut  ( # -- sum )   0 SWAP
   10 DO 0 I
      BEGIN  10 /MOD SWAP 2DUP OR
      WHILE  CELLS Fact + @ ROT + SWAP
      REPEAT 2DROP
      I = IF I + I . CR THEN
   LOOP ;
FactFill  Fact 9 CELLS + @ 7 *  Brut .( Sum : ) .

\EOF 40730
Digit factorials
Problem 34
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
Find the sum of all numbers which are equal to the sum of the factorial of their digits.
Note: As 1! = 1 and 2! = 2 are not sums they are not included.

Ôàêòîðèàëû öèôð
145 - ëþáîïûòíîå ÷èñëî, òàê êàê 1! + 4! + 5! = 1 + 24 + 120 = 145.
Íàéäèòå ñóììó âñåõ ÷èñåë, êîòîðûå ðàâíû ñóììå ôàêòîðèàëà èõ öèôð.
Ïðèìå÷àíèå: êàê 1! = 1 è 2! = 2 íå ÿâëÿþòñÿ ñóììàìè, îíè íå âêëþ÷åíû.
