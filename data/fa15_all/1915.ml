
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) <= 0
  then n mod 10
  else additivePersistence sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) <= 0
  then n mod 10
  else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(10,7)-(10,48)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (10,7)-(10,52)) (Var (Just (10,7)-(10,26)) "additivePersistence") [App (Just (10,27)-(10,52)) (Var (Just (10,28)-(10,35)) "sumList") [App (Just (10,36)-(10,51)) (Var (Just (10,37)-(10,48)) "digitsOfInt") [Var (Just (10,49)-(10,50)) "n"]]]
*)

(* typed spans
(10,7)-(10,52)
*)

(* correct types
int
*)

(* bad types
int
*)
