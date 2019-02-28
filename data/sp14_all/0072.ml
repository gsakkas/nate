
let pipe fs =
  let f a x c y z = z (a c) in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x c = x c in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,27)
x c
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (2,28)-(2,31)) (Var (Just (2,28)-(2,29)) "x") [Var (Just (2,30)-(2,31)) "c"]
*)

(* typed spans
(2,28)-(2,31)
*)

(* correct types
'a
*)

(* bad types
'a -> ('b -> 'c) -> 'c
*)
