
let pipe fs =
  let f a x k = x (k a) in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x k = x (a k) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,21)-(3,22)
k
VarG

*)

(* changed exprs
Var (Just (3,21)-(3,22)) "k"
*)

(* typed spans
(3,21)-(3,22)
*)

(* correct types
'a
*)

(* bad types
'a
*)
