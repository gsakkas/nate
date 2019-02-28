
let rec clone x n = match n with | 0 -> [] | _ -> [x; clone x (n - 1)];;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,50)-(2,70)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])])))

*)

(* changed exprs
ConApp (Just (2,50)-(2,72)) "::" (Just (Tuple (Just (2,50)-(2,72)) [Var (Just (2,50)-(2,51)) "x",App (Just (2,55)-(2,72)) (Var (Just (2,56)-(2,61)) "clone") [Var (Just (2,62)-(2,63)) "x",Bop (Just (2,64)-(2,71)) Minus (Var (Just (2,65)-(2,66)) "n") (Lit (Just (2,69)-(2,70)) (LI 1))]])) Nothing
*)

(* typed spans
(2,50)-(2,72)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
