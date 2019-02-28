
let rec clone x n = if n <= 0 then [] else x :: ((x clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,43)-(2,67)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (2,43)-(2,58)) (Var (Just (2,43)-(2,48)) "clone") [Var (Just (2,49)-(2,50)) "x",Bop (Just (2,51)-(2,58)) Minus (Var (Just (2,52)-(2,53)) "n") (Lit (Just (2,56)-(2,57)) (LI 1))]
*)

(* typed spans
(2,43)-(2,58)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
