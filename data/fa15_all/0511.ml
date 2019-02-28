
let pipe fs =
  let f a x n = n (a x) in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
x
VarG

(3,27)-(3,69)
n
VarG

(3,27)-(3,69)
let base = fun f -> 0 in
List.fold_left f base fs
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Var (Just (3,16)-(3,17)) "x"
Var (Just (3,21)-(3,22)) "n"
Let (Just (3,27)-(3,69)) NonRec [(VarPat (Just (3,31)-(3,35)) "base",Lam (Just (3,36)-(3,41)) (VarPat (Just (3,36)-(3,37)) "f") (Lit (Just (3,40)-(3,41)) (LI 0)) Nothing)] (App (Just (3,45)-(3,69)) (Var (Just (3,45)-(3,59)) "List.fold_left") [Var (Just (3,60)-(3,61)) "f",Var (Just (3,62)-(3,66)) "base",Var (Just (3,67)-(3,69)) "fs"])
*)

(* typed spans
(3,16)-(3,17)
(3,21)-(3,22)
(3,27)-(3,69)
*)

(* correct types
int -> int
'a
'a -> int
*)

(* bad types
'a -> 'a
'a
'a
*)
