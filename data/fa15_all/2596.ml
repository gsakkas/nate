
let rec digitsOfInt n =
  if 0 >= n then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) != 0
  then 1 + (additivePersistence sumList (digitsOfInt n))
  else 0;;


(* fix

let rec digitsOfInt n =
  if 0 >= n then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) != 0
  then 1 + (additivePersistence (sumList (digitsOfInt n)))
  else 0;;

*)

(* changed spans
(9,11)-(9,56)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (9,11)-(9,58)) (Var (Just (9,12)-(9,31)) "additivePersistence") [App (Just (9,32)-(9,57)) (Var (Just (9,33)-(9,40)) "sumList") [App (Just (9,41)-(9,56)) (Var (Just (9,42)-(9,53)) "digitsOfInt") [Var (Just (9,54)-(9,55)) "n"]]]
*)

(* typed spans
(9,11)-(9,58)
*)

(* correct types
int
*)

(* bad types
int
*)
