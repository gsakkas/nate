
let sqsum xs =
  let f a x a x = x *. x in let base = 0.0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,12)-(3,24)
x * x
BopG VarG VarG

(3,39)-(3,42)
0
LitG

*)

(* changed exprs
Bop (Just (2,27)-(2,32)) Times (Var (Just (2,27)-(2,28)) "x") (Var (Just (2,31)-(2,32)) "x")
Lit (Just (2,47)-(2,48)) (LI 0)
*)

(* typed spans
(2,27)-(2,32)
(2,47)-(2,48)
*)

(* correct types
int
int
*)

(* bad types
'a -> float -> float
float
*)
