CREATE FIB-1 1000 ALLOT FIB-1 1000 ERASE 1 FIB-1 C!
CREATE FIB-2 1000 ALLOT FIB-2 1000 ERASE 1 FIB-2 C!
CREATE FIB 1000 ALLOT FIB 1000 ERASE  2 FIB C!
: FIB-SHIFT  ( -- )
   1000 0 DO 
      FIB-1 I + C@ FIB-2 I + C! 
      FIB I + C@ FIB-1 I + C! 
   LOOP ;
: FIB-ADD  ( -- )   0
   1000 0 DO 
      FIB-2 I + C@ FIB-1 I + C@ + + 10 /MOD SWAP FIB I + C! 
   LOOP DROP ;
: BRUT  ( -- i )   3 BEGIN 1+  FIB-SHIFT  FIB-ADD FIB  999 + C@ 0 >  UNTIL ;
BRUT .

\EOF 4782
1000-digit Fibonacci number
Problem 25
The Fibonacci sequence is defined by the recurrence relation:
    Fn = Fn-1 + Fn-2, where F1 = 1 and F2 = 1.
Hence the first 12 terms will be:
    F1 = 1
    F2 = 1
    F3 = 2
    F4 = 3
    F5 = 5
    F6 = 8
    F7 = 13
    F8 = 21
    F9 = 34
    F10 = 55
    F11 = 89
    F12 = 144
The 12th term, F12, is the first term to contain three digits.
What is the index of the first term in the Fibonacci sequence to contain 1000 digits?
