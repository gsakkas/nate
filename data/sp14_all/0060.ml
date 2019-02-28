
let pipe fs =
  let f a x y z = z y in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x fn = x (fun a  -> a) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
fun fn -> x (fun a -> a)
LamG (AppG (fromList [EmptyG]))

(3,43)-(3,67)
let base = fun b -> b in
List.fold_left f base fs
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (3,12)-(3,32)) (VarPat (Just (3,12)-(3,14)) "fn") (App (Just (3,17)-(3,32)) (Var (Just (3,17)-(3,18)) "x") [Lam (Just (3,19)-(3,32)) (VarPat (Just (3,24)-(3,25)) "a") (Var (Just (3,30)-(3,31)) "a") Nothing]) Nothing
Let (Just (4,2)-(4,44)) NonRec [(VarPat (Just (4,6)-(4,10)) "base",Lam (Just (4,11)-(4,16)) (VarPat (Just (4,11)-(4,12)) "b") (Var (Just (4,15)-(4,16)) "b") Nothing)] (App (Just (4,20)-(4,44)) (Var (Just (4,20)-(4,34)) "List.fold_left") [Var (Just (4,35)-(4,36)) "f",Var (Just (4,37)-(4,41)) "base",Var (Just (4,42)-(4,44)) "fs"])
*)

(* typed spans
(3,12)-(3,32)
(4,2)-(4,44)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
'a -> ('a -> 'b) -> 'b
'a
*)
