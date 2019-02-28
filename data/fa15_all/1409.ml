
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | [] -> 0 | h::t -> digitalRoot (sumList n);;


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

(10,2)-(10,65)
match digits n with
| x :: [] -> x
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,VarG)])

(10,30)-(10,31)
EMPTY
EmptyG

(10,42)-(10,53)
EMPTY
EmptyG

(10,42)-(10,65)
EMPTY
EmptyG

(10,54)-(10,65)
EMPTY
EmptyG

(10,55)-(10,62)
EMPTY
EmptyG

(10,63)-(10,64)
x
VarG

*)

(* typed spans
int
int
*)
