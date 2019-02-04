
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> digitalRoot (digits (sumList n));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec digitalRoot n = match digits n with | x::[] -> x;;

*)

(* changed spans
(7,16)-(7,70)
EMPTY
EmptyG

(7,21)-(7,70)
EMPTY
EmptyG

(7,27)-(7,29)
EMPTY
EmptyG

(7,43)-(7,44)
EMPTY
EmptyG

(7,55)-(7,56)
EMPTY
EmptyG

(7,55)-(7,70)
EMPTY
EmptyG

(7,59)-(7,70)
EMPTY
EmptyG

(7,60)-(7,67)
EMPTY
EmptyG

(7,68)-(7,69)
EMPTY
EmptyG

(10,2)-(10,77)
match digits n with
| x :: [] -> x
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,VarG)])

(10,45)-(10,56)
EMPTY
EmptyG

(10,45)-(10,77)
EMPTY
EmptyG

(10,57)-(10,77)
EMPTY
EmptyG

(10,58)-(10,64)
EMPTY
EmptyG

(10,65)-(10,76)
EMPTY
EmptyG

(10,66)-(10,73)
EMPTY
EmptyG

(10,74)-(10,75)
EMPTY
EmptyG

*)
