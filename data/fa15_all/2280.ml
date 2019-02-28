
let pipe fs =
  let f a x x' = x' a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = x x' in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,19)
x
VarG

*)

(* changed exprs
Var (Just (3,17)-(3,18)) "x"
*)

(* typed spans
(3,17)-(3,18)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> 'b
*)
