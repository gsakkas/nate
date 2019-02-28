
let pipe fs = let f a x = a x in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = let func y = x (a y) in func in
  let base = let func y = y in func in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
let func = fun y -> x (a y) in
func
LetG NonRec (fromList [LamG EmptyG]) VarG

(2,44)-(2,46)
let func = fun y -> y in func
LetG NonRec (fromList [LamG EmptyG]) VarG

*)

(* changed exprs
Let (Just (3,14)-(3,42)) NonRec [(VarPat (Just (3,18)-(3,22)) "func",Lam (Just (3,23)-(3,34)) (VarPat (Just (3,23)-(3,24)) "y") (App (Just (3,27)-(3,34)) (Var (Just (3,27)-(3,28)) "x") [App (Just (3,29)-(3,34)) (Var (Just (3,30)-(3,31)) "a") [Var (Just (3,32)-(3,33)) "y"]]) Nothing)] (Var (Just (3,38)-(3,42)) "func")
Let (Just (4,13)-(4,35)) NonRec [(VarPat (Just (4,17)-(4,21)) "func",Lam (Just (4,22)-(4,27)) (VarPat (Just (4,22)-(4,23)) "y") (Var (Just (4,26)-(4,27)) "y") Nothing)] (Var (Just (4,31)-(4,35)) "func")
*)

(* typed spans
(3,14)-(3,42)
(4,13)-(4,35)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
'a
'a
*)
