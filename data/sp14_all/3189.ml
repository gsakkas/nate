
let pipe fs =
  let f a x y = y (a y) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
x
VarG

*)

(* changed exprs
Var (Just (3,16)-(3,17)) "x"
*)

(* typed spans
(3,16)-(3,17)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> 'a
*)
