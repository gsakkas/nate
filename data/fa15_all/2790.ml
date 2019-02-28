
let x l = List.map string_of_int;;

let pipe fs = let f a x = a x in let base f = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base f x = x in List.fold_left f base fs;;

*)

(* changed spans
(4,26)-(4,29)
x
VarG

(4,33)-(4,75)
fun x -> x
LamG VarG

*)

(* changed exprs
Var (Just (2,26)-(2,27)) "x"
Lam (Just (2,42)-(2,47)) (VarPat (Just (2,42)-(2,43)) "x") (Var (Just (2,46)-(2,47)) "x") Nothing
*)

(* typed spans
(2,26)-(2,27)
(2,42)-(2,47)
*)

(* correct types
'a -> 'b -> 'b
'a -> 'a
*)

(* bad types
'a
'a
*)
