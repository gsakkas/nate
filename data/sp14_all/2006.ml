
let pipe fs = let f a x = x a in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs num =
  let f a x = x a in let base = num in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,74)
fun num ->
  (let f =
     fun a -> fun x -> x a in
   let base = num in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (2,12)-(3,63)) (VarPat (Just (2,12)-(2,15)) "num") (Let (Just (3,2)-(3,63)) NonRec [(VarPat (Just (3,6)-(3,7)) "f",Lam (Just (3,8)-(3,17)) (VarPat (Just (3,8)-(3,9)) "a") (Lam (Just (3,10)-(3,17)) (VarPat (Just (3,10)-(3,11)) "x") (App (Just (3,14)-(3,17)) (Var (Just (3,14)-(3,15)) "x") [Var (Just (3,16)-(3,17)) "a"]) Nothing) Nothing)] (Let (Just (3,21)-(3,63)) NonRec [(VarPat (Just (3,25)-(3,29)) "base",Var (Just (3,32)-(3,35)) "num")] (App (Just (3,39)-(3,63)) (Var (Just (3,39)-(3,53)) "List.fold_left") [Var (Just (3,54)-(3,55)) "f",Var (Just (3,56)-(3,60)) "base",Var (Just (3,61)-(3,63)) "fs"]))) Nothing
*)

(* typed spans
(2,12)-(3,63)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a
*)
