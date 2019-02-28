
let pipe fs = let f a x a x = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a x = a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,48)-(2,49)
fun y -> y
LamG VarG

*)

(* changed exprs
Lam (Just (3,34)-(3,39)) (VarPat (Just (3,34)-(3,35)) "y") (Var (Just (3,38)-(3,39)) "y") Nothing
*)

(* typed spans
(3,34)-(3,39)
*)

(* correct types
('a -> 'b) -> 'a -> 'b
*)

(* bad types
int
*)
