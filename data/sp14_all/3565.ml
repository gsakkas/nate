
let rec clone x n = if n > 0 then x :: ((clone x n) - 1) else [];;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

*)

(* changed spans
(2,39)-(2,56)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (2,39)-(2,56)) (Var (Just (2,40)-(2,45)) "clone") [Var (Just (2,46)-(2,47)) "x",Bop (Just (2,48)-(2,55)) Minus (Var (Just (2,49)-(2,50)) "n") (Lit (Just (2,53)-(2,54)) (LI 1))]
*)

(* typed spans
(2,39)-(2,56)
*)

(* correct types
'a list
*)

(* bad types
int
*)
