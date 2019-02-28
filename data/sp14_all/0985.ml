
let rec clone x n = if n < 1 then [] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,47)-(2,64)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (2,47)-(2,64)) (Var (Just (2,48)-(2,53)) "clone") [Var (Just (2,54)-(2,55)) "x",Bop (Just (2,56)-(2,63)) Minus (Var (Just (2,57)-(2,58)) "n") (Lit (Just (2,61)-(2,62)) (LI 1))]
*)

(* typed spans
(2,47)-(2,64)
*)

(* correct types
'a list
*)

(* bad types
int
*)
