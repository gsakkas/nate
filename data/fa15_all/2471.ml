
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else additivePersistence (sumList ((digitsOfInt n) + 1));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else (additivePersistence (sumList (digitsOfInt n))) + 1;;

*)

(* changed spans
(8,24)-(8,75)
additivePersistence (sumList (digitsOfInt n)) + 1
BopG (AppG (fromList [EmptyG])) LitG

(8,53)-(8,74)
EMPTY
EmptyG

*)

(* typed spans
(8,24)-(8,75)
*)

(* typed spans
int
*)

(* typed spans
int
*)
