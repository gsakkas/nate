
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else additivePersistence sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else (additivePersistence (sumList (digitsOfInt n))) + 1;;

*)

(* changed spans
(8,24)-(8,65)
additivePersistence (sumList (digitsOfInt n)) + 1
BopG (AppG (fromList [EmptyG])) LitG

*)

(* changed exprs
Bop (Just (8,24)-(8,75)) Plus (App (Just (8,24)-(8,71)) (Var (Just (8,25)-(8,44)) "additivePersistence") [App (Just (8,45)-(8,70)) (Var (Just (8,46)-(8,53)) "sumList") [App (Just (8,54)-(8,69)) (Var (Just (8,55)-(8,66)) "digitsOfInt") [Var (Just (8,67)-(8,68)) "n"]]]) (Lit (Just (8,74)-(8,75)) (LI 1))
*)

(* typed spans
(8,24)-(8,75)
*)

(* correct types
int
*)

(* bad types
int
*)
