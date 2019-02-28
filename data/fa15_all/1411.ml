
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | x::[] -> 0 | h::t -> digitalRoot (digits (sumList n));;


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

(10,2)-(10,77)
match digits n with
| x :: [] -> x
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,VarG)])

(10,65)-(10,76)
EMPTY
EmptyG

*)

(* typed spans
(7,24)-(7,56)
*)

(* typed spans
int
*)

(* typed spans
int
*)
