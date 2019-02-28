
let rec wwhile (f,b) = wwhile ((f b), b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  let (b',c') = temp in if c' = true then wwhile (f, b') else b';;

*)

(* changed spans
(2,23)-(2,40)
let temp = f b in
let (b' , c') = temp in
if c' = true
then wwhile (f , b')
else b'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (3,2)-(4,64)) NonRec [(VarPat (Just (3,6)-(3,10)) "temp",App (Just (3,13)-(3,16)) (Var (Just (3,13)-(3,14)) "f") [Var (Just (3,15)-(3,16)) "b"])] (Let (Just (4,2)-(4,64)) NonRec [(TuplePat (Just (4,7)-(4,12)) [VarPat (Just (4,7)-(4,9)) "b'",VarPat (Just (4,10)-(4,12)) "c'"],Var (Just (4,16)-(4,20)) "temp")] (Ite (Just (4,24)-(4,64)) (Bop (Just (4,27)-(4,36)) Eq (Var (Just (4,27)-(4,29)) "c'") (Lit (Just (4,32)-(4,36)) (LB True))) (App (Just (4,42)-(4,56)) (Var (Just (4,42)-(4,48)) "wwhile") [Tuple (Just (4,49)-(4,56)) [Var (Just (4,50)-(4,51)) "f",Var (Just (4,53)-(4,55)) "b'"]]) (Var (Just (4,62)-(4,64)) "b'")))
*)

(* typed spans
(3,2)-(4,64)
*)

(* correct types
'a
*)

(* bad types
'a
*)
