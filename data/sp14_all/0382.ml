
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, (((clone 0 lenl1) - lenl2) @ l2))
  else ((((clone 0 lenl2) - lenl1) @ l1), l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

*)

(* changed spans
(8,13)-(8,38)
clone 0 (lenl1 - lenl2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(9,9)-(9,34)
clone 0 (lenl2 - lenl1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(9,9)-(9,34)
clone
VarG

(9,9)-(9,34)
0
LitG

(9,9)-(9,34)
lenl2 - lenl1
BopG VarG VarG

*)

(* changed exprs
App (Just (8,13)-(8,38)) (Var (Just (8,14)-(8,19)) "clone") [Lit (Just (8,20)-(8,21)) (LI 0),Bop (Just (8,22)-(8,37)) Minus (Var (Just (8,23)-(8,28)) "lenl1") (Var (Just (8,31)-(8,36)) "lenl2")]
App (Just (9,9)-(9,34)) (Var (Just (9,10)-(9,15)) "clone") [Lit (Just (9,16)-(9,17)) (LI 0),Bop (Just (9,18)-(9,33)) Minus (Var (Just (9,19)-(9,24)) "lenl2") (Var (Just (9,27)-(9,32)) "lenl1")]
Var (Just (9,10)-(9,15)) "clone"
Lit (Just (9,16)-(9,17)) (LI 0)
Bop (Just (9,18)-(9,33)) Minus (Var (Just (9,19)-(9,24)) "lenl2") (Var (Just (9,27)-(9,32)) "lenl1")
*)

(* typed spans
(8,13)-(8,38)
(9,9)-(9,34)
(9,10)-(9,15)
(9,16)-(9,17)
(9,18)-(9,33)
*)

(* correct types
int list
int list
int -> int -> int list
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
