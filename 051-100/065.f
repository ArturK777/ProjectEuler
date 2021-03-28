REQUIRE BIGINIT ~@/bigint.f
3 100 BIGINIT
1 0 S>BIG   \ d
2 1 S>BIG   \ n
: NUMER  ( border -- u )
   1+ 2 DO
      0 2 BMOV    \ temp
      1 0 BMOV    \ n 
      I 3 MOD IF 1 ELSE 2 I 3 / * THEN
      1 BMUL
      1 2 BSUM
   LOOP
   1 BDIGSUM ;
100 NUMER .
\EOF 272
Convergents of e
Problem 65
The square root of 2 can be written as an infinite continued fraction.
The infinite continued fraction can be written, , indicates that 2 repeats ad infinitum. In a similar way,
It turns out that the sequence of partial values of continued fractions for square roots provide the best rational approximations. Let us consider the convergents for
Hence the sequence of the first ten convergents for
are:
What is most surprising is that the important mathematical constant,
The first ten terms in the sequence of convergents for e are:
The sum of digits in the numerator of the 10th convergent is
Find the sum of digits in the numerator of the 100th convergent of the continued fraction for.