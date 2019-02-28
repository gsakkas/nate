
let pipe fs = let f a x x = x a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(2,35)-(2,77)
let base = fun x -> x in
List.fold_left f base fs
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "y") (App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "y"]]) Nothing
Let (Just (3,27)-(3,69)) NonRec [(VarPat (Just (3,31)-(3,35)) "base",Lam (Just (3,36)-(3,41)) (VarPat (Just (3,36)-(3,37)) "x") (Var (Just (3,40)-(3,41)) "x") Nothing)] (App (Just (3,45)-(3,69)) (Var (Just (3,45)-(3,59)) "List.fold_left") [Var (Just (3,60)-(3,61)) "f",Var (Just (3,62)-(3,66)) "base",Var (Just (3,67)-(3,69)) "fs"])
*)

(* typed spans
(3,12)-(3,23)
(3,27)-(3,69)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
('a -> 'b) -> 'b
'a
*)
