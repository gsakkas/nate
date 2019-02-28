
let pipe fs =
  let f a x x a = a x in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,20)-(3,21)
a
VarG

*)

(* changed exprs
Var (Just (3,20)-(3,21)) "a"
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
