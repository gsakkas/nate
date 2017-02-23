
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n <= 0
  then []
  else if n < 10 then 0 else 1 + (additivePersistence sumList (digits n));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(10,5)-(10,6)
(10,5)-(10,11)
(10,10)-(10,11)
(11,7)-(11,9)
(12,7)-(12,73)
(12,33)-(12,73)
(12,54)-(12,61)
(12,63)-(12,69)
*)

(* type error slice
(9,3)-(12,75)
(9,28)-(12,73)
(10,2)-(12,73)
(10,2)-(12,73)
(11,7)-(11,9)
(12,7)-(12,73)
(12,22)-(12,23)
(12,33)-(12,73)
(12,34)-(12,53)
*)

(* all spans
(2,20)-(3,60)
(3,2)-(3,60)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,60)
(3,48)-(3,49)
(3,25)-(3,47)
(3,26)-(3,37)
(3,38)-(3,46)
(3,39)-(3,40)
(3,43)-(3,45)
(3,50)-(3,60)
(3,51)-(3,59)
(3,51)-(3,52)
(3,57)-(3,59)
(5,11)-(5,34)
(5,15)-(5,34)
(5,15)-(5,26)
(5,27)-(5,34)
(5,28)-(5,31)
(5,32)-(5,33)
(7,16)-(7,70)
(7,21)-(7,70)
(7,27)-(7,29)
(7,43)-(7,44)
(7,55)-(7,70)
(7,55)-(7,56)
(7,59)-(7,70)
(7,60)-(7,67)
(7,68)-(7,69)
(9,28)-(12,73)
(10,2)-(12,73)
(10,5)-(10,11)
(10,5)-(10,6)
(10,10)-(10,11)
(11,7)-(11,9)
(12,7)-(12,73)
(12,10)-(12,16)
(12,10)-(12,11)
(12,14)-(12,16)
(12,22)-(12,23)
(12,29)-(12,73)
(12,29)-(12,30)
(12,33)-(12,73)
(12,34)-(12,53)
(12,54)-(12,61)
(12,62)-(12,72)
(12,63)-(12,69)
(12,70)-(12,71)
*)
