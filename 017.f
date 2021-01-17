CREATE DLEN 0 C, 3 C, 3 C, 5 C, 4 C, 4 C, 3 C, 5 C, 5 C, 4 C, \ one - nine
				3 C, 6 C, 6 C, 8 C, 8 C, 7 C, 7 C, 9 C, 8 C, 8 C, \ ten - nineteen
				6 C, 6 C, 5 C, 5 C, 5 C, 7 C, 6 C, 6 C,			  \ twenty - ninety
: NLEN ( n -- len ) 100 /MOD DUP
IF DLEN + C@ 7 + SWAP ELSE SWAP THEN \ hundred
2DUP 0= SWAP 0= OR INVERT IF SWAP 3 + SWAP THEN \ and
DUP 20 >
IF 10 /MOD DLEN 18 + + C@ ROT + SWAP DLEN + C@ +
ELSE DUP IF DLEN + C@ + ELSE DROP THEN
THEN ;
: MAIN 0 SWAP 1 DO I NLEN + LOOP 11 + ;
1000 MAIN .

: CHECK 13 1 DO I . I NLEN CR LOOP ;

\EOF 21124

one two three rour five six seven 

Number letter counts
If the numbers 1 to 5 are written out in words: 
one, two, three, four, five, 
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
If all the numbers from 1 to 1000 (one thousand) 
(inclusive were written out in words, how many letters would be used?
NOTE: Do not count spaces or hyphens. 
For example, 342 (three hundred and forty-two) contains 23 letters
and 115 (one hundred and fifteen) contains 20 letters. 
The use of "and" when writing out numbers is in compliance 
with British usage.

(Количество букв считается
Если числа от 1 до 5 записаны прописью:
один два три четыре пять,
тогда всего используется 3 + 3 + 5 + 4 + 4 = 19 букв.
Если все числа от 1 до 1000 (одна тысяча)
(включительно прописаны прописными буквами, сколько букв будет использовано?
ПРИМЕЧАНИЕ. Не учитывайте пробелы и дефисы.
Например, 342 (триста сорок две) содержит 23 буквы
115 (сто пятнадцать) содержат 20 букв.
Использование "и" при написании чисел соответствует
с британским использованием.
