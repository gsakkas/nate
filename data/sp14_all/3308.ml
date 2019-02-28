
let rec clone x n = let i = 0 in if i < n then x :: ((clone x n) - 1) else [];;


(* fix

let rec clone x n = let i = 0 in if i < n then x :: (clone x (n - 1)) else [];;

*)

(* changed spans
(2,52)-(2,69)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (2,52)-(2,69)) (Var (Just (2,53)-(2,58)) "clone") [Var (Just (2,59)-(2,60)) "x",Bop (Just (2,61)-(2,68)) Minus (Var (Just (2,62)-(2,63)) "n") (Lit (Just (2,66)-(2,67)) (LI 1))]
*)

(* typed spans
(2,52)-(2,69)
*)

(* correct types
'a list
*)

(* bad types
int
*)
