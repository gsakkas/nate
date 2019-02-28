
let pipe fs =
  let f a x x' x a = x (a x') in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = x (a x') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,29)
x (a x')
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (3,17)-(3,25)) (Var (Just (3,17)-(3,18)) "x") [App (Just (3,19)-(3,25)) (Var (Just (3,20)-(3,21)) "a") [Var (Just (3,22)-(3,24)) "x'"]]
*)

(* typed spans
(3,17)-(3,25)
*)

(* correct types
'a
*)

(* bad types
('a -> 'b) -> ('c -> 'a) -> 'b
*)
