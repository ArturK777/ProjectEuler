CREATE PERM 0 C, 1 C, 2 C, 3 C, 4 C, 5 C, 6 C, 7 C, 8 C, 9 C,
: POW10  ( i -- 10^i )   DUP IF 1 SWAP 0 DO 10 * LOOP ELSE DROP 1 THEN ;
: PERM@  ( i -- c )    PERM + C@ ; 
: PERM-TYPE  (  -- )   0 10 0 DO PERM 9 + I - C@  I POW10 * + LOOP U. CR ;
: SWAP@  ( i j -- )   2DUP PERM@ SWAP PERM@ ROT PERM + C! SWAP PERM + C! ;
: BRUT  ( # -- )   1- 0
   BEGIN 9
      BEGIN DUP DUP 1- PERM@  SWAP PERM@  SWAP > INVERT
      WHILE 1-
      REPEAT 
      10
      BEGIN DUP  1- PERM@  2 PICK 1- PERM@  SWAP < INVERT
      WHILE 1-
      REPEAT 
      
      2DUP 1- SWAP 1- SWAP@  DROP 1+ 10
      BEGIN 2DUP  <     
      WHILE 2DUP 1- SWAP 1- SWAP@  1- SWAP 1+ SWAP
      REPEAT 
      2DROP 
      1+ 2DUP = 
   UNTIL 
   PERM-TYPE ;
1000000 BRUT

\EOF 2783915460

int[] perm = new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
 
int count = 1;
int numPerm = 1000000;
while (count < numPerm) { int N = perm.Length;
   int i = N-1;
   while (perm[i - 1] >= perm[i]) { i = i - 1;}
    int j = N;
    while (perm[j - 1] <= perm[i - 1]) { j = j - 1; }
    // swap values at position i-1 and j-1
    swap(i - 1, j - 1); 
    i++;
    j = N;
    while (i < j) { swap(i - 1, j - 1);
            i++;
            j--; }
        count++; }
        
Lexicographic permutations
Problem 24
A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
012   021   102   120   201   210
What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

Ëåêñèêîãðàôè÷åñêèå ïåðåñòàíîâêè
Ïåðåñòàíîâêà - ýòî óïîðÿäî÷åííîå ðàñïîëîæåíèå îáúåêòîâ. Íàïðèìåð, 3124 - ýòî îäíà èç âîçìîæíûõ ïåðåñòàíîâîê öèôð 1, 2, 3 è 4. Åñëè âñå ïåðåñòàíîâêè ïåðå÷èñëåíû â ÷èñëîâîì èëè àëôàâèòíîì ïîðÿäêå, ìû íàçûâàåì ýòî ëåêñèêîãðàôè÷åñêèì ïîðÿäêîì. Ëåêñèêîãðàôè÷åñêèå ïåðåñòàíîâêè 0, 1 è 2:
012 021 102 120 201 210
Êàêàÿ ìèëëèîííàÿ ëåêñèêîãðàôè÷åñêàÿ ïåðåñòàíîâêà öèôð 0, 1, 2, 3, 4, 5, 6, 7, 8 è 9?
Ëåêñèêîãðàôè÷åñêèå ïåðåñòàíîâêè
Ïðîáëåìà 24
Ïåðåñòàíîâêà - ýòî óïîðÿäî÷åííîå ðàñïîëîæåíèå îáúåêòîâ. Íàïðèìåð, 3124 - ýòî îäíà èç âîçìîæíûõ ïåðåñòàíîâîê öèôð 1, 2, 3 è 4. Åñëè âñå ïåðåñòàíîâêè ïåðå÷èñëåíû â ÷èñëîâîì èëè àëôàâèòíîì ïîðÿäêå, ìû íàçûâàåì ýòî ëåêñèêîãðàôè÷åñêèì ïîðÿäêîì. Ëåêñèêîãðàôè÷åñêèå ïåðåñòàíîâêè 0, 1 è 2:
012 021 102 120 201 210
Êàêàÿ ìèëëèîííàÿ ëåêñèêîãðàôè÷åñêàÿ ïåðåñòàíîâêà öèôð 0, 1, 2, 3, 4, 5, 6, 7, 8 è 9?
