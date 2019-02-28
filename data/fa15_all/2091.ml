
let rec clone x n = if n = 0 then [] else (clone x n) - 1;;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,42)-(2,57)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])])))

*)

(* changed exprs
ConApp (Just (2,42)-(2,64)) "::" (Just (Tuple (Just (2,42)-(2,64)) [Var (Just (2,42)-(2,43)) "x",App (Just (2,47)-(2,64)) (Var (Just (2,48)-(2,53)) "clone") [Var (Just (2,54)-(2,55)) "x",Bop (Just (2,56)-(2,63)) Minus (Var (Just (2,57)-(2,58)) "n") (Lit (Just (2,61)-(2,62)) (LI 1))]])) Nothing
*)

(* typed spans
(2,42)-(2,64)
*)

(* correct types
'a list
*)

(* bad types
int
*)
