
let rec clone x n =
  match n <= 0 with | true  -> [] | false  -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n <= 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,51)-(3,68)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (3,51)-(3,68)) (Var (Just (3,52)-(3,57)) "clone") [Var (Just (3,58)-(3,59)) "x",Bop (Just (3,60)-(3,67)) Minus (Var (Just (3,61)-(3,62)) "n") (Lit (Just (3,65)-(3,66)) (LI 1))]
*)

(* typed spans
(3,51)-(3,68)
*)

(* correct types
'a list
*)

(* bad types
int
*)
