
let pipe fs =
  let f a x a x = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,21)
x
VarG

*)

(* changed exprs
Var (Just (2,30)-(2,31)) "x"
*)

(* typed spans
(2,30)-(2,31)
*)

(* correct types
'a
*)

(* bad types
'a
*)
