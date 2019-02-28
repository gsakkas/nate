
let pipe fs =
  let f a x n = n a (a x) in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,25)
x (a n)
AppG (fromList [AppG (fromList [EmptyG])])

(3,42)-(3,43)
0
LitG

*)

(* changed exprs
App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "n"]]
Lit (Just (3,40)-(3,41)) (LI 0)
*)

(* typed spans
(3,16)-(3,23)
(3,40)-(3,41)
*)

(* correct types
int
int
*)

(* bad types
'a
'a
*)
