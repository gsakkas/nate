
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> h + (digitalRoot t);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if n < 10 then n else digitalRoot (sumList (digits n));;

*)

(* changed spans
(7,20)-(8,64)
EMPTY
EmptyG

(8,2)-(8,64)
EMPTY
EmptyG

(8,8)-(8,14)
EMPTY
EmptyG

(8,8)-(8,16)
EMPTY
EmptyG

(8,15)-(8,16)
EMPTY
EmptyG

(8,33)-(8,34)
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(8,45)-(8,64)
match xs with
| [] -> 0
| h :: t -> h + sumList t
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

(8,50)-(8,61)
sumList
VarG

*)
