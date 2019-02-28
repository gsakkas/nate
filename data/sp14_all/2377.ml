
let rec digitsOfIntHelper n =
  if n > 0 then (digitsOfIntHelper (n / 10)) @ [n mod 10] else [];;

let rec digitsOfInt n = if n == 0 then [0] else digitsOfIntHelper n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | x::s -> x + (sumList s);;

let rec additivePersistence n =
  if n = 0 then 0 else 1 + (additivePersistence sumList digits n);;


(* fix

let rec digitsOfIntHelper n =
  if n > 0 then (digitsOfIntHelper (n / 10)) @ [n mod 10] else [];;

let rec digitsOfInt n = if n == 0 then [0] else digitsOfIntHelper n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | x::s -> x + (sumList s);;

let rec additivePersistence n =
  if n = 0 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(12,27)-(12,65)
additivePersistence (sumList (digits n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (12,27)-(12,69)) (Var (Just (12,28)-(12,47)) "additivePersistence") [App (Just (12,48)-(12,68)) (Var (Just (12,49)-(12,56)) "sumList") [App (Just (12,57)-(12,67)) (Var (Just (12,58)-(12,64)) "digits") [Var (Just (12,65)-(12,66)) "n"]]]
*)

(* typed spans
(12,27)-(12,69)
*)

(* correct types
int
*)

(* bad types
int
*)
