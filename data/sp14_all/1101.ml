
let sqsum xs = let f a x = x ** 2 in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,33)
x * x
BopG VarG VarG

*)

(* changed exprs
Bop (Just (2,27)-(2,32)) Times (Var (Just (2,27)-(2,28)) "x") (Var (Just (2,31)-(2,32)) "x")
*)

(* typed spans
(2,27)-(2,32)
*)

(* correct types
int
*)

(* bad types
int
*)
