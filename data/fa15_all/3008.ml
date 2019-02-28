
let rec clone x n = if n = 1 then [] @ x else (clone x) :: (([x] n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,23)-(2,28)
n <= 0
BopG VarG LitG

(2,46)-(2,55)
x
VarG

(2,47)-(2,52)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

(2,60)-(2,67)
n
VarG

*)

(* changed exprs
Bop (Just (2,23)-(2,29)) Le (Var (Just (2,23)-(2,24)) "n") (Lit (Just (2,28)-(2,29)) (LI 0))
Var (Just (2,43)-(2,44)) "x"
App (Just (2,48)-(2,65)) (Var (Just (2,49)-(2,54)) "clone") [Var (Just (2,55)-(2,56)) "x",Bop (Just (2,57)-(2,64)) Minus (Var (Just (2,58)-(2,59)) "n") (Lit (Just (2,62)-(2,63)) (LI 1))]
Var (Just (2,58)-(2,59)) "n"
*)

(* typed spans
(2,23)-(2,29)
(2,43)-(2,44)
(2,48)-(2,65)
(2,58)-(2,59)
*)

(* correct types
bool
'a
'a list
int
*)

(* bad types
bool
'a
'a list -> 'a
int
*)
