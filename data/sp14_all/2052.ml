
let rec wwhile (f,b) = let (bs,cs) = f b in if cs then f bs else bs;;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,23)-(2,67)
let (b' , c') = f b in
if c'
then wwhile (f , b')
else b'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Let (Just (2,23)-(2,77)) NonRec [(TuplePat (Just (2,28)-(2,33)) [VarPat (Just (2,28)-(2,30)) "b'",VarPat (Just (2,31)-(2,33)) "c'"],App (Just (2,37)-(2,40)) (Var (Just (2,37)-(2,38)) "f") [Var (Just (2,39)-(2,40)) "b"])] (Ite (Just (2,44)-(2,77)) (Var (Just (2,47)-(2,49)) "c'") (App (Just (2,55)-(2,69)) (Var (Just (2,55)-(2,61)) "wwhile") [Tuple (Just (2,62)-(2,69)) [Var (Just (2,63)-(2,64)) "f",Var (Just (2,66)-(2,68)) "b'"]]) (Var (Just (2,75)-(2,77)) "b'"))
*)

(* typed spans
(2,23)-(2,77)
*)

(* correct types
'a
*)

(* bad types
'a
*)
