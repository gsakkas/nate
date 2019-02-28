
let stringOfList f l = let base = f in List.fold_left f base l;;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(2,23)-(2,62)
let fx =
  fun a -> fun b -> a ^ b in
let base = "" in
List.fold_left fx base l
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (3,2)-(3,65)) NonRec [(VarPat (Just (3,6)-(3,8)) "fx",Lam (Just (3,9)-(3,20)) (VarPat (Just (3,9)-(3,10)) "a") (Lam (Just (3,11)-(3,20)) (VarPat (Just (3,11)-(3,12)) "b") (App (Just (3,15)-(3,20)) (Var (Just (3,17)-(3,18)) "^") [Var (Just (3,15)-(3,16)) "a",Var (Just (3,19)-(3,20)) "b"]) Nothing) Nothing)] (Let (Just (3,24)-(3,65)) NonRec [(VarPat (Just (3,28)-(3,32)) "base",Lit (Just (3,35)-(3,37)) (LS ""))] (App (Just (3,41)-(3,65)) (Var (Just (3,41)-(3,55)) "List.fold_left") [Var (Just (3,56)-(3,58)) "fx",Var (Just (3,59)-(3,63)) "base",Var (Just (3,64)-(3,65)) "l"]))
*)

(* typed spans
(3,2)-(3,65)
*)

(* correct types
string
*)

(* bad types
'a
*)
