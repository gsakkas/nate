
let pipe fs =
  let f a x = function | g -> g (a x) in
  let base = function | x -> x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> a (x g) in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,32)-(3,37)
a
VarG

(3,32)-(3,37)
x g
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (3,30)-(3,31)) "a"
App (Just (3,32)-(3,37)) (Var (Just (3,33)-(3,34)) "x") [Var (Just (3,35)-(3,36)) "g"]
*)

(* typed spans
(3,30)-(3,31)
(3,32)-(3,37)
*)

(* correct types
'a -> 'a
'a
*)

(* bad types
'a
'a
*)
