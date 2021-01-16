: SUM-SQ  ( c -- n )   1+ 1 0 -ROT DO I DUP * + LOOP ;
: SQ-SUM  ( c -- n )   1+ 1 0 -ROT DO I + LOOP DUP * ;
100 DUP SQ-SUM SWAP SUM-SQ - . 

\EOF 25164150
Problem 6
The sum of the squares of the first ten natural numbers is 385
The square of the sum of the first ten natural numbers is 3025
Hence the difference between the sum of the squares 
of the first ten natural numbers and the square of the sum is 3025-385=2640
Find the difference between the sum of the squares 
of the first one hundred natural numbers and the square of the sum.

Сумма квадратов первых десяти натуральных чисел равна 385.
Квадрат суммы первых десяти натуральных чисел равен 3025.
Отсюда разница между суммой квадратов
первых десяти натуральных чисел и квадрат суммы равен 3025-385 = 2640
Найдите разницу между суммой квадратов
первых ста натуральных чисел и квадрат суммы.