
let rec clone x n = if n > 1 then x :: (clone x (n - 1));;


(* fix

let rec clone x n = x :: (clone x (n - 1));;

*)

(* changed spans
(2,20)-(2,56)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])])))

*)

(* changed exprs
ConApp (Just (2,20)-(2,42)) "::" (Just (Tuple (Just (2,20)-(2,42)) [Var (Just (2,20)-(2,21)) "x",App (Just (2,25)-(2,42)) (Var (Just (2,26)-(2,31)) "clone") [Var (Just (2,32)-(2,33)) "x",Bop (Just (2,34)-(2,41)) Minus (Var (Just (2,35)-(2,36)) "n") (Lit (Just (2,39)-(2,40)) (LI 1))]])) Nothing
*)

(* typed spans
(2,20)-(2,42)
*)

(* correct types
'a list
*)

(* bad types
unit
*)
