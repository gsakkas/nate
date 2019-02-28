
let rec clone x n = if n > 0 then x :: (clone ((x n) - 1)) else x;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,23)-(2,28)
n < 1
BopG VarG LitG

(2,34)-(2,58)
[]
ListG EmptyG

(2,39)-(2,58)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
Bop (Just (2,23)-(2,28)) Lt (Var (Just (2,23)-(2,24)) "n") (Lit (Just (2,27)-(2,28)) (LI 1))
List (Just (2,34)-(2,36)) [] Nothing
App (Just (2,47)-(2,64)) (Var (Just (2,48)-(2,53)) "clone") [Var (Just (2,54)-(2,55)) "x",Bop (Just (2,56)-(2,63)) Minus (Var (Just (2,57)-(2,58)) "n") (Lit (Just (2,61)-(2,62)) (LI 1))]
*)

(* typed spans
(2,23)-(2,28)
(2,34)-(2,36)
(2,47)-(2,64)
*)

(* correct types
bool
'a list
'a list
*)

(* bad types
bool
int -> int list
int -> int list
*)
