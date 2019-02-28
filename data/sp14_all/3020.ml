
let pipe fs =
  let f a x = (+) (a x) in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,23)
fun a -> a
LamG VarG

(3,38)-(3,39)
fun x -> x
LamG VarG

*)

(* changed exprs
Lam (Just (2,24)-(2,29)) (VarPat (Just (2,24)-(2,25)) "a") (Var (Just (2,28)-(2,29)) "a") Nothing
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
int -> int
int
*)
