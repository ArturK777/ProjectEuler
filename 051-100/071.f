: BRUT  ( -- u )   0 1
   3 1000000 DO
      I 3 * 1- 7 / 
      OVER OVER M*
      4 PICK I M* D> 
      IF -ROT 2DROP I ELSE DROP THEN
   -1 +LOOP DROP ;
BRUT . 
\EOF 428570
Ordered fractions
Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, it is called a reduced proper fraction.
If we list the set of reduced proper fractions for d <= 8 in ascending order of size, we get:
1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
It can be seen that 2/5 is the fraction immediately to the left of 3/7.
By listing the set of reduced proper fractions for d <= 1,000,000 in ascending order of size, find the numerator of the fraction immediately to the left of 3/7.

”пор€доченные дроби
–ассмотрим дробь n / d, где n и d - натуральные числа. ≈сли n <d и HCF (n, d) = 1, она называетс€ приведенной собственной дробью.
≈сли мы перечислим набор сокращенных собственных дробей дл€ d <= 8 в пор€дке возрастани€ размера, мы получим:
1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3 / 5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
¬идно, что 2/5 - это дробь слева от 3/7.
ѕеречисл€€ набор приведенных собственных дробей дл€ d <= 1 000 000 в пор€дке возрастани€ размера, найдите числитель дроби слева от 3/7.