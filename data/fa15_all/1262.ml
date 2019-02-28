
let pipe fs =
  let f a x b x a = x a b in let base i = i in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base i = i in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,25)
x (a b)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "b"]]
*)

(* typed spans
(3,16)-(3,23)
*)

(* correct types
'a
*)

(* bad types
('a -> 'b -> 'c) -> 'a -> 'c
*)
