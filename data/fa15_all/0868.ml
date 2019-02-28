
let pipe fs =
  let f a x y = x (a y) in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,38)-(3,40)
fun fs -> fs
LamG VarG

*)

(* changed exprs
Lam (Just (3,36)-(3,43)) (VarPat (Just (3,36)-(3,38)) "fs") (Var (Just (3,41)-(3,43)) "fs") Nothing
*)

(* typed spans
(3,36)-(3,43)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> 'b
*)
