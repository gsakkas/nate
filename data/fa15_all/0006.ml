
let rec clone x n = if x <= 0 then [] else x @ (clone x (n - 1));;


(* fix

let rec clone x n = if x <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,43)-(2,64)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])])))

*)

(* changed exprs
ConApp (Just (2,43)-(2,65)) "::" (Just (Tuple (Just (2,43)-(2,65)) [Var (Just (2,43)-(2,44)) "x",App (Just (2,48)-(2,65)) (Var (Just (2,49)-(2,54)) "clone") [Var (Just (2,55)-(2,56)) "x",Bop (Just (2,57)-(2,64)) Minus (Var (Just (2,58)-(2,59)) "n") (Lit (Just (2,62)-(2,63)) (LI 1))]])) Nothing
*)

(* typed spans
(2,43)-(2,65)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
