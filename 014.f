: EVEN ( d -- d ) D2/ ;
: ODD ( d -- d ) 3 1 M*/ 1 M+ ;
: WINNER ( i0 n0 i n -- iMax nMax ) DUP 3 PICK > IF 2SWAP THEN 2DROP ;
: COUNT- ( start -- number ) 0.
        BEGIN 1+ -ROT
                2DUP 2DUP D2/ D2* D= INVERT \ if dword odd ?
                IF ODD ELSE EVEN THEN
                2DUP 1. D- D0= >R ROT R>
        UNTIL >R 2DROP R> 1+ ;
: BRUT 1+ 0. 12 3 ROLL SWAP DO I DUP COUNT- WINNER LOOP ;
1000000  BRUT DROP .

\EOF 837799
Problem 14
The following iterative sequence is defined for the set of positive integers:
n > n/2 (n is even)
n > 3n + 1 (n is odd)
Using the rule above and starting with 13, we generate the following sequence:
13 > 40 > 20 > 10 > 5 > 16 > 8 > 4 > 2 > 1
It can be seen that this sequence (starting at 13 and finishing at 1)
contains 10 terms. Although it has not been proved yet (Collatz Problem),
it is thought that all starting numbers finish at 1.
Which starting number, under one million, produces the longest chain?
NOTE: Once the chain starts the terms are allowed to go above one million.


Следующая итерационная последовательность определена
для набора натуральных чисел:
n> n / 2 (n четно)
n> 3n + 1 (n нечетное)
Используя приведенное выше правило и начиная с 13,
мы генерируем следующую последовательность:
13> 40> 20> 10> 5> 16> 8> 4> 2> 1
Видно, что эта последовательность (начиная с 13 и заканчивая 1)
содержит 10 терминов.
Хотя это еще не доказано (проблема Коллатца),
считается, что все стартовые номера заканчиваются на 1.
Какое начальное число, меньшее миллиона, дает самую длинную
цепочку?
ПРИМЕЧАНИЕ: Как только цепочка начинается,
термины могут превышать один миллион.
================================================

[ifdef] empty
    empty
    marker empty
[then]

: collatz_next                  ( n1 --- n2 )
\G Compute the next element in the Collatz sequence
    dup 1 and if
        3 * 1+
    else
        2/
    then
    ;

0 value starting_number
\G Storage for the start of a Collatz sequence

0 value starting_number_for_longest_sequence
\G Storage for the value of starting_number corresponding the
\G long sequence.

0 value longest_sequence
\G Storage for length of longest sequence so far

: $collatz
\G Initialize for finding the longest Collatz sequence
    0 to longest_sequence
    0 to starting_number
    0 to starting_number_for_longest_sequence
    ;

 $collatz

: !largest                      ( n --- )
\G Conditionally store n as the length of the longest Collatz
\G sequence, additionally recording the value that started the
\G sequence.
    dup longest_sequence >
    if
        to longest_sequence
        starting_number to starting_number_for_longest_sequence
    else
        drop
    then
    ;


variable length
\G Storage for the length of a Collatz sequence

: collatz_length                ( n --- )
\G Compute the length of the Collatz sequence starting at n
    dup to starting_number
    1 length !                  \ count the starting value
    begin
        collatz_next
        1 length +!             \ count this value
        dup 1 =
    until
    drop
    length @
    ;

: do_problem_14                 ( --- n )
\G Run the problem returning the length of the longest sequence
    $collatz
    1000000 1 do
        i collatz_length !largest
    loop
    starting_number_for_longest_sequence
    ;

cr .( do_problem_14 )
cr .( ============= )
cr do_problem_14 .
cr