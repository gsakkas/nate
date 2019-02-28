
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then []
  else
    (let myList = digits n in
     let num = sumList myList in num + (additivePersistence num));;


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
(11,7)-(11,9)
0
LitG

(14,33)-(14,64)
let sum =
  num + additivePersistence num in
1 + additivePersistence num
LetG NonRec (fromList [BopG EmptyG EmptyG]) (BopG EmptyG EmptyG)

*)

(* changed exprs
Lit (Just (11,7)-(11,8)) (LI 0)
Let (Just (15,5)-(16,34)) NonRec [(VarPat (Just (15,9)-(15,12)) "sum",Bop (Just (15,15)-(15,46)) Plus (Var (Just (15,15)-(15,18)) "num") (App (Just (15,21)-(15,46)) (Var (Just (15,22)-(15,41)) "additivePersistence") [Var (Just (15,42)-(15,45)) "num"]))] (Bop (Just (16,5)-(16,34)) Plus (Lit (Just (16,5)-(16,6)) (LI 1)) (App (Just (16,9)-(16,34)) (Var (Just (16,10)-(16,29)) "additivePersistence") [Var (Just (16,30)-(16,33)) "num"]))
*)

(* typed spans
(11,7)-(11,8)
(15,5)-(16,34)
*)

(* correct types
int
int
*)

(* bad types
'a list
int
*)
