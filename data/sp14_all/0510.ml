
let sqsum xs = let f a x = (+) x in let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,32)
a + x
BopG VarG VarG

(2,47)-(2,49)
0
LitG

*)

(* changed exprs
Bop (Just (2,27)-(2,32)) Plus (Var (Just (2,27)-(2,28)) "a") (Var (Just (2,31)-(2,32)) "x")
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
int -> int
'a list
*)
