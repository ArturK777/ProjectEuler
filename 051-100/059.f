REQUIRE CONCAT ~micro/lib/str.f 
: READ-DUMP  ( $ -- adr len )   
   SOURCE-NAME CUT-PATH 2SWAP CONCAT  R/O OPEN-FILE THROW
   DUP FILE-SIZE THROW D>S DUP ALLOCATE THROW 
   DUP ROT 3 PICK READ-FILE THROW 
   ROT CLOSE-FILE THROW
   DUP 2 / ALLOCATE THROW 0 ROT 0 SWAP
   0 DO 3 PICK I + C@ DUP 44 = 
      IF 2OVER + NIP C! 1+ 0 
      ELSE 48 - SWAP 10 * + THEN
   LOOP 0 2OVER + NIP C! 1+ ROT DROP ;
: SPLIT  ( adr len -- adr len adr' len/3 )   \ split message to 3 piles
   DUP ALLOCATE THROW OVER 3 / DUP
   0 DO 3 PICK I 3 * + C@ 2 PICK I + C!
      3 PICK I 3 * + 1+ C@ OVER 3 PICK + I + C!
      3 PICK I 3 * + 2+ C@ OVER 2* 3 PICK + I + C!
   LOOP ;
: COMM  ( adr len i -- char )   \ most common char in pile
   PAD 128 ERASE  OVER * 2DUP + ROT DROP SWAP
   DO DUP I + C@ PAD + 1 SWAP +! LOOP DROP
   0 0 128 0 DO DUP I PAD + C@
      < IF DROP I PAD + C@ NIP I SWAP THEN
   LOOP DROP ;
: 3KEY  ( adr' len/3 -- )   \ find 3 letters and put it in PAD
   3 0 DO 2DUP I COMM 32 XOR PAD I 130 + + C! LOOP 
   2DROP PAD 130 + PAD 3 CMOVE
   CR ." Key is: " PAD 3 TYPE CR ;
: DECRYPT  ( adr len -- sum )   0 SWAP 0
   ." Message: " CR
   DO 3 0 DO
         OVER I J + + C@
         PAD I + C@ XOR DUP EMIT +
      LOOP
   3 +LOOP NIP CR CR ;
S" p059_cipher.txt" READ-DUMP SPLIT 3KEY DECRYPT .

\EOF 129448
   \ 2DUP 0 DO DUP I + C@ . LOOP DROP   
17576
XOR decryption
Problem 59
Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.
A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.
For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.
Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key. If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message. The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.
Your task has been made easy, as the encryption key consists of three lower case characters. Using p059_cipher.txt (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words, decrypt the message and find the sum of the ASCII values in the original text.