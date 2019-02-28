
let pipe fs = let f a x j x = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x j = x (a j) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,31)
x (a j)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "j"]]
*)

(* typed spans
(3,16)-(3,23)
*)

(* correct types
'a
*)

(* bad types
'a -> 'b
*)
