
let rec clone x n = if n = 1 then [x] else List.append [x] ((clone x n) - 1);;


(* fix

let rec clone x n = if n = 1 then [x] else List.append [x] (clone x (n - 1));;

*)

(* changed spans
(2,59)-(2,76)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (2,59)-(2,76)) (Var (Just (2,60)-(2,65)) "clone") [Var (Just (2,66)-(2,67)) "x",Bop (Just (2,68)-(2,75)) Minus (Var (Just (2,69)-(2,70)) "n") (Lit (Just (2,73)-(2,74)) (LI 1))]
*)

(* typed spans
(2,59)-(2,76)
*)

(* correct types
'a list
*)

(* bad types
int
*)
