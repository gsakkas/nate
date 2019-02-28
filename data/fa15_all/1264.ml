
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let x = digitsOfInt n in
  match x with
  | head -> 0
  | head::tail -> 1 + (additivePersistence sumList n);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let x = digitsOfInt n in
  match x with
  | head -> 0
  | head::tail -> 1 + (additivePersistence (sumList x));;

*)

(* changed spans
(12,22)-(12,53)
additivePersistence (sumList x)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (12,22)-(12,55)) (Var (Just (12,23)-(12,42)) "additivePersistence") [App (Just (12,43)-(12,54)) (Var (Just (12,44)-(12,51)) "sumList") [Var (Just (12,52)-(12,53)) "x"]]
*)

(* typed spans
(12,22)-(12,55)
*)

(* correct types
int
*)

(* bad types
int
*)
