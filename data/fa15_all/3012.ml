
let rec clone x n = if n <= 0 then [] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,48)-(2,65)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (2,48)-(2,65)) (Var (Just (2,49)-(2,54)) "clone") [Var (Just (2,55)-(2,56)) "x",Bop (Just (2,57)-(2,64)) Minus (Var (Just (2,58)-(2,59)) "n") (Lit (Just (2,62)-(2,63)) (LI 1))]
*)

(* typed spans
(2,48)-(2,65)
*)

(* correct types
'a list
*)

(* bad types
int
*)
