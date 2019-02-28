
let pipe fs =
  let f a x g = (g x) a in let base g = g in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base g = g in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,21)
x
VarG

(3,16)-(3,21)
a g
AppG (fromList [VarG])

(3,27)-(3,69)
g
VarG

*)

(* changed exprs
Var (Just (3,16)-(3,17)) "x"
App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "g"]
Var (Just (3,21)-(3,22)) "g"
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
