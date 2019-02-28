
let rec clone x n = [clone x (n - 1); x];;


(* fix

let rec clone x n = (clone x (n - 1)) @ [x];;

*)

(* changed spans
(2,20)-(2,40)
clone x (n - 1) @ [x]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (2,20)-(2,43)) (Var (Just (2,38)-(2,39)) "@") [App (Just (2,20)-(2,37)) (Var (Just (2,21)-(2,26)) "clone") [Var (Just (2,27)-(2,28)) "x",Bop (Just (2,29)-(2,36)) Minus (Var (Just (2,30)-(2,31)) "n") (Lit (Just (2,34)-(2,35)) (LI 1))],List (Just (2,40)-(2,43)) [Var (Just (2,41)-(2,42)) "x"] Nothing]
*)

(* typed spans
(2,20)-(2,43)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
