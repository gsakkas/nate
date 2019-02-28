
let pipe fs = let f a x a = a x in let base f = f in List.fold_left f base fs;;


(* fix

let f a x x a = a x;;

let pipe fs =
  let f a x g = f a x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,9)-(2,77)
fun a ->
  fun x -> fun x -> fun a -> a x
LamG (LamG EmptyG)

(2,35)-(2,77)
fun fs ->
  (let f =
     fun a ->
       fun x -> fun g -> f a x in
   let base = fun f -> f in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (2,6)-(2,19)) (VarPat (Just (2,6)-(2,7)) "a") (Lam (Just (2,8)-(2,19)) (VarPat (Just (2,8)-(2,9)) "x") (Lam (Just (2,10)-(2,19)) (VarPat (Just (2,10)-(2,11)) "x") (Lam (Just (2,12)-(2,19)) (VarPat (Just (2,12)-(2,13)) "a") (App (Just (2,16)-(2,19)) (Var (Just (2,16)-(2,17)) "a") [Var (Just (2,18)-(2,19)) "x"]) Nothing) Nothing) Nothing) Nothing
Lam (Just (4,9)-(5,67)) (VarPat (Just (4,9)-(4,11)) "fs") (Let (Just (5,2)-(5,67)) NonRec [(VarPat (Just (5,6)-(5,7)) "f",Lam (Just (5,8)-(5,21)) (VarPat (Just (5,8)-(5,9)) "a") (Lam (Just (5,10)-(5,21)) (VarPat (Just (5,10)-(5,11)) "x") (Lam (Just (5,12)-(5,21)) (VarPat (Just (5,12)-(5,13)) "g") (App (Just (5,16)-(5,21)) (Var (Just (5,16)-(5,17)) "f") [Var (Just (5,18)-(5,19)) "a",Var (Just (5,20)-(5,21)) "x"]) Nothing) Nothing) Nothing)] (Let (Just (5,25)-(5,67)) NonRec [(VarPat (Just (5,29)-(5,33)) "base",Lam (Just (5,34)-(5,39)) (VarPat (Just (5,34)-(5,35)) "f") (Var (Just (5,38)-(5,39)) "f") Nothing)] (App (Just (5,43)-(5,67)) (Var (Just (5,43)-(5,57)) "List.fold_left") [Var (Just (5,58)-(5,59)) "f",Var (Just (5,60)-(5,64)) "base",Var (Just (5,65)-(5,67)) "fs"]))) Nothing
*)

(* typed spans
(2,6)-(2,19)
(4,9)-(5,67)
*)

(* correct types
(('a -> ('a -> 'b) -> 'b) -> 'a -> ('a -> 'b) -> 'b) -> 'c -> 'a -> ('a -> 'b) -> 'b
'a list -> ('b -> ('b -> 'c) -> 'c) -> 'b -> ('b -> 'c) -> 'c
*)

(* bad types
'a -> 'b
'a
*)
