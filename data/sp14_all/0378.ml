
let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone ((x n) - 1));;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,55)-(2,74)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (2,55)-(2,72)) (Var (Just (2,56)-(2,61)) "clone") [Var (Just (2,62)-(2,63)) "x",Bop (Just (2,64)-(2,71)) Minus (Var (Just (2,65)-(2,66)) "n") (Lit (Just (2,69)-(2,70)) (LI 1))]
*)

(* typed spans
(2,55)-(2,72)
*)

(* correct types
'a list
*)

(* bad types
int -> int list
*)
