: PRIMES  ( -- adr )    HERE 
   2 , 3 , 5 , 7 , 11 , 13 , 17 , 19 , 23 , 29 , 31 , 
   37 , 41 , 43 , 47 , 53 , 59 , 61 , 67 , 71 , ; 
: WAYS  ( u -- u' )
   PRIMES 20 1
   BEGIN  1+ 
      PAD OVER 1+ CELLS ERASE  1 PAD !
      OVER 0
      DO DUP 1+ 3 PICK I CELLS + @ 
         DUP -ROT 2DUP > 
         IF DO I CELLS PAD + DUP @
               2 PICK I SWAP - CELLS PAD + @
               + SWAP !
            LOOP
         ELSE 2DROP
         THEN DROP
      LOOP DUP CELLS PAD + @ 4 PICK >
   UNTIL 2SWAP 2DROP NIP ;
5000 WAYS .
\EOF 71
Prime summations
Problem 77
It is possible to write ten as the sum of primes in exactly five different ways:
7 + 3
5 + 5
5 + 3 + 2
3 + 3 + 2 + 2
2 + 2 + 2 + 2 + 2
What is the first value which can be written as the sum of primes in over five thousand different ways?

