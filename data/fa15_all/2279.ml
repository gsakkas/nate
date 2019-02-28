
let pipe fs =
  let f a x x' = x' a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = a x' in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,20)-(3,21)
x'
VarG

*)

(* changed exprs
Var (Just (3,19)-(3,21)) "x'"
*)

(* typed spans
(3,19)-(3,21)
*)

(* correct types
'a
*)

(* bad types
'a
*)
