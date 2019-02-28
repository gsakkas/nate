
let pipe fs = let f a x = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun a  -> x) a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
fun a -> x
LamG VarG

(2,33)-(2,73)
a
VarG

(2,44)-(2,45)
fun x -> x
LamG VarG

*)

(* changed exprs
Lam (Just (3,14)-(3,27)) (VarPat (Just (3,19)-(3,20)) "a") (Var (Just (3,25)-(3,26)) "x") Nothing
Var (Just (3,28)-(3,29)) "a"
Lam (Just (3,42)-(3,47)) (VarPat (Just (3,42)-(3,43)) "x") (Var (Just (3,46)-(3,47)) "x") Nothing
*)

(* typed spans
(3,14)-(3,27)
(3,28)-(3,29)
(3,42)-(3,47)
*)

(* correct types
('a -> 'a) -> 'a -> 'a
'a -> 'a
'a -> 'a
*)

(* bad types
'a -> 'b
'a
int
*)
