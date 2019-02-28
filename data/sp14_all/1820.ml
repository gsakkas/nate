
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let counter = 0;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then counter
  else
    (let myList = digits n in
     let num = sumList myList in
     let counter = 0 in
     counter = ((counter + (1 num)) + (additivePersistence num)));;


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
     let num = sumList myList in num + (additivePersistence num));;

*)

(* changed spans
(13,7)-(13,14)
0
LitG

(17,5)-(18,64)
num + additivePersistence num
BopG VarG (AppG (fromList [EmptyG]))

(17,5)-(18,64)
num
VarG

(17,5)-(18,64)
additivePersistence num
AppG (fromList [VarG])

(17,5)-(18,64)
additivePersistence
VarG

(17,5)-(18,64)
num
VarG

*)

(* changed exprs
Lit (Just (11,7)-(11,8)) (LI 0)
Bop (Just (14,33)-(14,64)) Plus (Var (Just (14,33)-(14,36)) "num") (App (Just (14,39)-(14,64)) (Var (Just (14,40)-(14,59)) "additivePersistence") [Var (Just (14,60)-(14,63)) "num"])
Var (Just (14,33)-(14,36)) "num"
App (Just (14,39)-(14,64)) (Var (Just (14,40)-(14,59)) "additivePersistence") [Var (Just (14,60)-(14,63)) "num"]
Var (Just (14,40)-(14,59)) "additivePersistence"
Var (Just (14,60)-(14,63)) "num"
*)

(* typed spans
(11,7)-(11,8)
(14,33)-(14,64)
(14,33)-(14,36)
(14,39)-(14,64)
(14,40)-(14,59)
(14,60)-(14,63)
*)

(* correct types
int
int
int
int
int -> int
int
*)

(* bad types
int
bool
bool
bool
bool
bool
*)
