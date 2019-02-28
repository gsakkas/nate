
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,50)-(3,67)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (3,50)-(3,67)) (Var (Just (3,51)-(3,56)) "clone") [Var (Just (3,57)-(3,58)) "x",Bop (Just (3,59)-(3,66)) Minus (Var (Just (3,60)-(3,61)) "n") (Lit (Just (3,64)-(3,65)) (LI 1))]
*)

(* typed spans
(3,50)-(3,67)
*)

(* correct types
'a list
*)

(* bad types
int
*)
