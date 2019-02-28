
let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

*)

(* changed spans
(3,52)-(3,69)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (3,52)-(3,69)) (Var (Just (3,53)-(3,58)) "clone") [Var (Just (3,59)-(3,60)) "x",Bop (Just (3,61)-(3,68)) Minus (Var (Just (3,62)-(3,63)) "n") (Lit (Just (3,66)-(3,67)) (LI 1))]
*)

(* typed spans
(3,52)-(3,69)
*)

(* correct types
'a list
*)

(* bad types
int
*)
