
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else additivePersistence sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(8,24)-(8,65)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (8,24)-(8,69)) (Var (Just (8,24)-(8,43)) "additivePersistence") [App (Just (8,44)-(8,69)) (Var (Just (8,45)-(8,52)) "sumList") [App (Just (8,53)-(8,68)) (Var (Just (8,54)-(8,65)) "digitsOfInt") [Var (Just (8,66)-(8,67)) "n"]]]
*)

(* typed spans
(8,24)-(8,69)
*)

(* correct types
int
*)

(* bad types
int
*)
