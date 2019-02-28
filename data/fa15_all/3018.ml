
let pipe fs =
  let f a x a x = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,21)
x a
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (2,28)-(2,31)) (Var (Just (2,28)-(2,29)) "x") [Var (Just (2,30)-(2,31)) "a"]
*)

(* typed spans
(2,28)-(2,31)
*)

(* correct types
'a
*)

(* bad types
('a -> 'b) -> 'b
*)
