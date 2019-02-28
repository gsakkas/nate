
let pipe fs =
  match fs with
  | [] -> 0
  | f::fs' -> let f a x = x a in let base = fs' in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(5,75)
let f =
  fun a ->
    fun x -> fun p -> x (a p) in
let base = fun b -> b in
List.fold_left f base fs
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (3,2)-(3,69)) NonRec [(VarPat (Just (3,6)-(3,7)) "f",Lam (Just (3,8)-(3,23)) (VarPat (Just (3,8)-(3,9)) "a") (Lam (Just (3,10)-(3,23)) (VarPat (Just (3,10)-(3,11)) "x") (Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "p") (App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "p"]]) Nothing) Nothing) Nothing)] (Let (Just (3,27)-(3,69)) NonRec [(VarPat (Just (3,31)-(3,35)) "base",Lam (Just (3,36)-(3,41)) (VarPat (Just (3,36)-(3,37)) "b") (Var (Just (3,40)-(3,41)) "b") Nothing)] (App (Just (3,45)-(3,69)) (Var (Just (3,45)-(3,59)) "List.fold_left") [Var (Just (3,60)-(3,61)) "f",Var (Just (3,62)-(3,66)) "base",Var (Just (3,67)-(3,69)) "fs"]))
*)

(* typed spans
(3,2)-(3,69)
*)

(* correct types
'a -> 'a
*)

(* bad types
int
*)
