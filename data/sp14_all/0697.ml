
let pipe fs =
  let f a x x' = x' (a x) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = x (a x') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,19)
x
VarG

(3,23)-(3,24)
x'
VarG

*)

(* changed exprs
Var (Just (3,17)-(3,18)) "x"
Var (Just (3,22)-(3,24)) "x'"
*)

(* typed spans
(3,17)-(3,18)
(3,22)-(3,24)
*)

(* correct types
'a -> 'a
'a
*)

(* bad types
'a -> 'a
'a -> 'a
*)
