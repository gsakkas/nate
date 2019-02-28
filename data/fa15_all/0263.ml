
let rec clone x n = if x <= 0 then [] else List.fold_left n;;


(* fix

let rec cloneHelper x n = if x <= 0 then [] else cloneHelper x (n - 1);;

let rec clone x n = cloneHelper x n;;

*)

(* changed spans
(2,43)-(2,59)
cloneHelper x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (2,49)-(2,70)) (Var (Just (2,49)-(2,60)) "cloneHelper") [Var (Just (2,61)-(2,62)) "x",Bop (Just (2,63)-(2,70)) Minus (Var (Just (2,64)-(2,65)) "n") (Lit (Just (2,68)-(2,69)) (LI 1))]
*)

(* typed spans
(2,49)-(2,70)
*)

(* correct types
'a list
*)

(* bad types
'a -> 'b list -> 'a
*)
