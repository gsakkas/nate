
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else 1 + (additivePersistence sumList (digitsOfInt n));;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else 1 + (additivePersistence (sumList (digitsOfInt n)));;

*)

(* changed spans
(8,28)-(8,73)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (8,28)-(8,75)) (Var (Just (8,29)-(8,48)) "additivePersistence") [App (Just (8,49)-(8,74)) (Var (Just (8,50)-(8,57)) "sumList") [App (Just (8,58)-(8,73)) (Var (Just (8,59)-(8,70)) "digitsOfInt") [Var (Just (8,71)-(8,72)) "n"]]]
*)

(* typed spans
(8,28)-(8,75)
*)

(* correct types
int
*)

(* bad types
int
*)
