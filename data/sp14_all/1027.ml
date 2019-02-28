
let pipe fs = let f a x l x = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x l = x (a l) in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,31)
x (a l)
AppG (fromList [AppG (fromList [EmptyG])])

(2,44)-(2,49)
fun p -> p
LamG VarG

*)

(* changed exprs
App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "l"]]
Lam (Just (3,36)-(3,41)) (VarPat (Just (3,36)-(3,37)) "p") (Var (Just (3,40)-(3,41)) "p") Nothing
*)

(* typed spans
(3,16)-(3,23)
(3,36)-(3,41)
*)

(* correct types
'a
'a -> 'a
*)

(* bad types
'a -> 'b
'a -> 'a
*)
