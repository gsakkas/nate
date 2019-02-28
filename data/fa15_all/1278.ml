
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence sumList (digits n));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(10,28)-(10,68)
additivePersistence (sumList (digits n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (10,28)-(10,70)) (Var (Just (10,29)-(10,48)) "additivePersistence") [App (Just (10,49)-(10,69)) (Var (Just (10,50)-(10,57)) "sumList") [App (Just (10,58)-(10,68)) (Var (Just (10,59)-(10,65)) "digits") [Var (Just (10,66)-(10,67)) "n"]]]
*)

(* typed spans
(10,28)-(10,70)
*)

(* correct types
int
*)

(* bad types
int
*)
