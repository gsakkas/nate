
let pipe fs =
  let f a x y = a (y x) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,23)
fun x -> a x
LamG (AppG (fromList [EmptyG]))

(3,36)-(3,41)
fun y -> y
LamG VarG

*)

(* changed exprs
Lam (Just (2,24)-(2,31)) (VarPat (Just (2,24)-(2,25)) "x") (App (Just (2,28)-(2,31)) (Var (Just (2,28)-(2,29)) "a") [Var (Just (2,30)-(2,31)) "x"]) Nothing
Lam (Just (2,44)-(2,49)) (VarPat (Just (2,44)-(2,45)) "y") (Var (Just (2,48)-(2,49)) "y") Nothing
*)

(* typed spans
(2,24)-(2,31)
(2,44)-(2,49)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
('a -> 'b) -> 'c
'a -> 'a
*)
