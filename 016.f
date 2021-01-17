CREATE BIGNUM 320 ALLOT 
: !END ( a -- flag ) 2@ 0. D= INVERT ;
: M2 ( -- ) 0 BIGNUM
	BEGIN DUP !END 2 PICK OR
	WHILE DUP C@ 2* 10 /MOD >R ROT + SWAP TUCK C! R> SWAP 1+
	REPEAT 2DROP ;
: POW2 ( pow -- ) BIGNUM 320 ERASE 1 BIGNUM C! 0 DO M2 LOOP ; 
: SUM2 ( -- sum ) 0 320 0 DO BIGNUM I + C@ + LOOP ;
1000 POW2 SUM2 .

: BB BIGNUM 320 DUMP ;

\EOF 1366
(Power digit sum
Problem 16
2**15 = 32768 and the sum of its digits 
is 3 + 2 + 7 + 6 + 8 = 26.
What is the sum of the digits of the number 2**1000?

2 ** 15 = 32768 и сумма его цифр
равно 3 + 2 + 7 + 6 + 8 = 26.
Какова сумма цифр числа 2**1000?

=========================================================
\ Power digit sum
\
\ Problem 16
\
\ 2^15 = 32768
\
\ and the sum of its digits is
\
\   3 + 2 + 7 + 6 + 8 = 26.
\
\ What is the sum of the digits of the number 2^1000?

[ifdef] empty
    empty
    marker empty
[then]

350 constant #digits            \ big enough for 2**1000
\G Return the length of the digits array

create digits                   ( --- addr )
\G Return the address of the digits storage array
    #digits allot

: 0digits                       ( --- )
\G Zero the digits array
    digits #digits erase
    ;

: ?digit_range                  ( n --- n )
\G Confirm that n is a valid index into the digits array
    dup 0<         abort" too small"
    dup #digits >= abort" too large"
    ;

: )digit                        ( n --- addr )
\G Return the address of the nth byte of the digits array
    ?digit_range
    digits +
    ;

: c!digit                       ( c n --- )
\G Store a byte into the digits array at location n
    ?digit_range
    )digit c!
    ;

: c@digit                       ( n --- c )
\G Fetch a byte from the digits array at location n
    ?digit_range
    )digit c@
    ;

: n!digits                      ( n ---  )
\G Store the value of n into the digits array
    0digits
    0 <# #s #>
    0 do
        count '0 - i c!digit
    loop
    ;

: -digit-leading-zeroes         ( n1 --- n2 )
\G Return the index of the first (highest addressed) non-zero
\G byte
    begin
        dup c@digit 0=
        while
            1-
            dup 0< if
                drop 0 exit
            then
    repeat
    ;

: .digits                       ( --- )
\G Display the characters of the digits array
    digits #digits 1- -digit-leading-zeroes
    0 swap ?do
        i c@digit 1 .r
    -1 +loop
    space
    ;

: digits_2*                     ( --- )
\G Multiply the contents of the digits array by 2
    0
    #digits
    0 do
        i c@digit 2* +
        10 /mod swap
        i c!digit
    loop
    abort" Carry out on digits_2*"
    ;

: sum_digits                    ( --- n )
\G Compute the sum of the bytes in the digits array
    0 #digits 0
    do
        i c@digit +
    loop
    ;

1000 constant NMAX              ( --- n )
\G Return the exponent for the power of 2 to be computed by this
\G problem

: do_problem_16                 ( --- n )
\G Compute 2**1000 and sum the decimal digits in the result
    2 n!digits
    NMAX 1- 0 do
        digits_2*
    loop
    [ 0 [IF] ]
    cr .digits
    [ [THEN] ]
    sum_digits
    ;

cr .( do_problem_16 )
cr .( ============= )
cr do_problem_16 .
cr

