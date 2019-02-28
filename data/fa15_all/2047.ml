
let identity a = a;;

let pipe fs =
  let f a x = a x in let base = identity in List.fold_left f base fs;;


(* fix

let identity a = a;;

let pipe fs =
  let f a x = a in let base = identity in List.fold_left f base fs;;

*)

(* changed spans
(5,14)-(5,17)
a
VarG

*)

(* changed exprs
Var (Just (5,14)-(5,15)) "a"
*)

(* typed spans
(5,14)-(5,15)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a
*)
