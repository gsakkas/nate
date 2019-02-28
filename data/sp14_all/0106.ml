
let pipe fs =
  let f a x b = (b x) a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,21)
x
VarG

(3,16)-(3,21)
a b
AppG (fromList [VarG])

(3,27)-(3,69)
b
VarG

*)

(* changed exprs
Var (Just (3,16)-(3,17)) "x"
App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "b"]
Var (Just (3,21)-(3,22)) "b"
*)

(* typed spans
(3,16)-(3,17)
(3,18)-(3,23)
(3,21)-(3,22)
*)

(* correct types
'a -> 'a
'a
'a
*)

(* bad types
'a -> 'b
'a -> 'b
'a
*)
