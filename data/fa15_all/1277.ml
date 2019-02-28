
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n <= 0
  then []
  else if n < 10 then 0 else 1 + (additivePersistence sumList (digits n));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(12,7)-(12,73)
n < 10
BopG VarG LitG

(12,7)-(12,73)
0
LitG

(12,7)-(12,73)
1 + additivePersistence (sumList (digits n))
BopG LitG (AppG (fromList [EmptyG]))

(12,7)-(12,73)
1
LitG

(12,7)-(12,73)
additivePersistence (sumList (digits n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Bop (Just (10,5)-(10,11)) Lt (Var (Just (10,5)-(10,6)) "n") (Lit (Just (10,9)-(10,11)) (LI 10))
Lit (Just (10,17)-(10,18)) (LI 0)
Bop (Just (10,24)-(10,70)) Plus (Lit (Just (10,24)-(10,25)) (LI 1)) (App (Just (10,28)-(10,70)) (Var (Just (10,29)-(10,48)) "additivePersistence") [App (Just (10,49)-(10,69)) (Var (Just (10,50)-(10,57)) "sumList") [App (Just (10,58)-(10,68)) (Var (Just (10,59)-(10,65)) "digits") [Var (Just (10,66)-(10,67)) "n"]]])
Lit (Just (10,24)-(10,25)) (LI 1)
App (Just (10,28)-(10,70)) (Var (Just (10,29)-(10,48)) "additivePersistence") [App (Just (10,49)-(10,69)) (Var (Just (10,50)-(10,57)) "sumList") [App (Just (10,58)-(10,68)) (Var (Just (10,59)-(10,65)) "digits") [Var (Just (10,66)-(10,67)) "n"]]]
*)

(* typed spans
(10,5)-(10,11)
(10,17)-(10,18)
(10,24)-(10,70)
(10,24)-(10,25)
(10,28)-(10,70)
*)

(* correct types
bool
int
int
int
int
*)

(* bad types
int
int
int
int
int
*)
