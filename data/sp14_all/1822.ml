
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let counter = 0;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then 0
  else
    (let myList = digits n in
     let num = sumList myList in
     let sum = num + (additivePersistence num) in
     counter = ((additivePersistence num) + 1));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then 0
  else
    (let myList = digits n in
     let num = sumList myList in
     let sum = num + (additivePersistence num) in
     1 + (additivePersistence num));;

*)

(* changed spans
(18,5)-(18,46)
1 + additivePersistence num
BopG LitG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (16,5)-(16,34)) Plus (Lit (Just (16,5)-(16,6)) (LI 1)) (App (Just (16,9)-(16,34)) (Var (Just (16,10)-(16,29)) "additivePersistence") [Var (Just (16,30)-(16,33)) "num"])
*)

(* typed spans
(16,5)-(16,34)
*)

(* correct types
int
*)

(* bad types
bool
*)
