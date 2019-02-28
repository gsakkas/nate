
let pipe fs =
  let f a x = match fs with | x::y -> x in
  let base = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,39)
x
VarG

(4,13)-(4,14)
fun y -> y
LamG VarG

*)

(* changed exprs
Var (Just (2,26)-(2,27)) "x"
Lam (Just (2,40)-(2,45)) (VarPat (Just (2,40)-(2,41)) "y") (Var (Just (2,44)-(2,45)) "y") Nothing
*)

(* typed spans
(2,26)-(2,27)
(2,40)-(2,45)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
'a
'a -> 'b -> 'a
*)
