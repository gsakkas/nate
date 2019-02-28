
let pipe fs = let f a x x a = x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,30)-(2,31)
x a
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,18)-(3,21)) (Var (Just (3,18)-(3,19)) "x") [Var (Just (3,20)-(3,21)) "a"]
*)

(* typed spans
(3,18)-(3,21)
*)

(* correct types
'a
*)

(* bad types
'a
*)
