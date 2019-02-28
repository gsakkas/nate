
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then n else (append n) mod (10 digitsOfInt (n / 10));;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,17)-(5,18)
[n]
ListG VarG

(5,40)-(5,42)
append
VarG

(5,43)-(5,54)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* typed spans
(5,17)-(5,20)
(5,26)-(5,32)
(5,33)-(5,55)
*)

(* typed spans
int list
int list -> int list -> int list
int list
*)

(* typed spans
int
int
int -> int
*)
