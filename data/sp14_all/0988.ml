
let pipe fs =
  let f a x = List.map x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,24)
fun x -> x
LamG VarG

(3,39)-(3,40)
fun x -> x
LamG VarG

*)

(* changed exprs
Lam (Just (2,24)-(2,29)) (VarPat (Just (2,24)-(2,25)) "x") (Var (Just (2,28)-(2,29)) "x") Nothing
Lam (Just (2,42)-(2,47)) (VarPat (Just (2,42)-(2,43)) "x") (Var (Just (2,46)-(2,47)) "x") Nothing
*)

(* typed spans
(2,24)-(2,29)
(2,42)-(2,47)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
'a list -> 'b list
int
*)
