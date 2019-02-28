
let pipe fs = let f a x = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base n = 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,73)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = fun n -> 0 in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (2,12)-(2,77)) (VarPat (Just (2,12)-(2,13)) "n") (Let (Just (2,16)-(2,77)) NonRec [(VarPat (Just (2,20)-(2,21)) "f",Lam (Just (2,22)-(2,31)) (VarPat (Just (2,22)-(2,23)) "a") (Lam (Just (2,24)-(2,31)) (VarPat (Just (2,24)-(2,25)) "x") (App (Just (2,28)-(2,31)) (Var (Just (2,28)-(2,29)) "x") [Var (Just (2,30)-(2,31)) "a"]) Nothing) Nothing)] (Let (Just (2,35)-(2,77)) NonRec [(VarPat (Just (2,39)-(2,43)) "base",Lam (Just (2,44)-(2,49)) (VarPat (Just (2,44)-(2,45)) "n") (Lit (Just (2,48)-(2,49)) (LI 0)) Nothing)] (App (Just (2,53)-(2,77)) (Var (Just (2,53)-(2,67)) "List.fold_left") [Var (Just (2,68)-(2,69)) "f",Var (Just (2,70)-(2,74)) "base",Var (Just (2,75)-(2,77)) "fs"]))) Nothing
*)

(* typed spans
(2,12)-(2,77)
*)

(* correct types
'a -> 'b -> int
*)

(* bad types
'a
*)
