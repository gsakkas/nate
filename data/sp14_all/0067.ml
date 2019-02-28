
let pipe fs =
  let f a x y z = z y in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y z = y z in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,20)-(3,21)
z
VarG

*)

(* changed exprs
Var (Just (3,20)-(3,21)) "z"
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
