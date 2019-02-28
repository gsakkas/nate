
let rec clone x n = if x <= 0 then [] else [clone x];;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,23)-(2,24)
n
VarG

(2,43)-(2,52)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
Var (Just (2,23)-(2,24)) "n"
App (Just (2,43)-(2,58)) (Var (Just (2,43)-(2,48)) "clone") [Var (Just (2,49)-(2,50)) "x",Bop (Just (2,51)-(2,58)) Minus (Var (Just (2,52)-(2,53)) "n") (Lit (Just (2,56)-(2,57)) (LI 1))]
*)

(* typed spans
(2,23)-(2,24)
(2,43)-(2,58)
*)

(* correct types
int
'a list
*)

(* bad types
int
'a list
*)
