
let pipe fs =
  let f a x g = (a x) g in let base g = g in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base g = g in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,21)
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
'a -> 'b
*)
