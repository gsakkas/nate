
let pipe fs =
  let f a x a x = x a in let base d = d in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a x = a x in let base d = d in List.fold_left f base fs;;

*)

(* changed spans
(3,20)-(3,21)
x
VarG

*)

(* changed exprs
Var (Just (3,20)-(3,21)) "x"
*)

(* typed spans
(3,20)-(3,21)
*)

(* correct types
'a
*)

(* bad types
'a
*)
