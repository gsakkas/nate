
let pipe fs =
  let f a x k = a k x in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x k = x (a k) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,21)
x (a k)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "k"]]
*)

(* typed spans
(3,16)-(3,23)
*)

(* correct types
'a
*)

(* bad types
'a
*)
