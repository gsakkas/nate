
let rec wwhile (f,b) =
  let x y = (f, b) in if b = true then wwhile (f, x) else x;;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

*)

(* changed spans
(3,2)-(3,59)
let res = f b in
match res with
| (x , y) when y = true -> wwhile (f , x)
| (x , y) -> x
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (CaseG EmptyG (fromList [(Nothing,EmptyG),(Just EmptyG,EmptyG)]))

*)

(* changed exprs
Let (Just (3,2)-(4,68)) NonRec [(VarPat (Just (3,6)-(3,9)) "res",App (Just (3,12)-(3,15)) (Var (Just (3,12)-(3,13)) "f") [Var (Just (3,14)-(3,15)) "b"])] (Case (Just (4,2)-(4,68)) (Var (Just (4,8)-(4,11)) "res") [(TuplePat (Just (4,20)-(4,23)) [VarPat (Just (4,20)-(4,21)) "x",VarPat (Just (4,22)-(4,23)) "y"],Just (Bop (Just (4,30)-(4,38)) Eq (Var (Just (4,30)-(4,31)) "y") (Lit (Just (4,34)-(4,38)) (LB True))),App (Just (4,42)-(4,55)) (Var (Just (4,42)-(4,48)) "wwhile") [Tuple (Just (4,49)-(4,55)) [Var (Just (4,50)-(4,51)) "f",Var (Just (4,53)-(4,54)) "x"]]),(TuplePat (Just (4,59)-(4,62)) [VarPat (Just (4,59)-(4,60)) "x",VarPat (Just (4,61)-(4,62)) "y"],Nothing,Var (Just (4,67)-(4,68)) "x")])
*)

(* typed spans
(3,2)-(4,68)
*)

(* correct types
'a
*)

(* bad types
'a -> ('b * bool)
*)
