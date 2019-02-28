
let sqsum xs = let f a x = () in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a * a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,29)
a * a
BopG VarG VarG

*)

(* changed exprs
Bop (Just (2,27)-(2,32)) Times (Var (Just (2,27)-(2,28)) "a") (Var (Just (2,31)-(2,32)) "a")
*)

(* typed spans
(2,27)-(2,32)
*)

(* correct types
int
*)

(* bad types
unit
*)
