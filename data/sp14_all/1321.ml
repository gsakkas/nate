
let pipe fs = let f a x = fs a in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,75)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (2,12)-(2,75)) (VarPat (Just (2,12)-(2,13)) "y") (Let (Just (2,16)-(2,75)) NonRec [(VarPat (Just (2,20)-(2,21)) "f",Lam (Just (2,22)-(2,31)) (VarPat (Just (2,22)-(2,23)) "a") (Lam (Just (2,24)-(2,31)) (VarPat (Just (2,24)-(2,25)) "x") (App (Just (2,28)-(2,31)) (Var (Just (2,28)-(2,29)) "x") [Var (Just (2,30)-(2,31)) "a"]) Nothing) Nothing)] (Let (Just (2,35)-(2,75)) NonRec [(VarPat (Just (2,39)-(2,43)) "base",Var (Just (2,46)-(2,47)) "y")] (App (Just (2,51)-(2,75)) (Var (Just (2,51)-(2,65)) "List.fold_left") [Var (Just (2,66)-(2,67)) "f",Var (Just (2,68)-(2,72)) "base",Var (Just (2,73)-(2,75)) "fs"]))) Nothing
*)

(* typed spans
(2,12)-(2,75)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a
*)
