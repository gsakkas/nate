
let rec wwhile (f,b) =
  match f with
  | (x,y) -> let (x,y) = f b in if y = true then wwhile (f, x) else x;;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in if y = true then wwhile (f, x) else x;;

*)

(* changed spans
(3,2)-(4,69)
let (x , y) = f b in
if y = true
then wwhile (f , x)
else x
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Let (Just (3,2)-(3,58)) NonRec [(TuplePat (Just (3,7)-(3,10)) [VarPat (Just (3,7)-(3,8)) "x",VarPat (Just (3,9)-(3,10)) "y"],App (Just (3,14)-(3,17)) (Var (Just (3,14)-(3,15)) "f") [Var (Just (3,16)-(3,17)) "b"])] (Ite (Just (3,21)-(3,58)) (Bop (Just (3,24)-(3,32)) Eq (Var (Just (3,24)-(3,25)) "y") (Lit (Just (3,28)-(3,32)) (LB True))) (App (Just (3,38)-(3,51)) (Var (Just (3,38)-(3,44)) "wwhile") [Tuple (Just (3,45)-(3,51)) [Var (Just (3,46)-(3,47)) "f",Var (Just (3,49)-(3,50)) "x"]]) (Var (Just (3,57)-(3,58)) "x"))
*)

(* typed spans
(3,2)-(3,58)
*)

(* correct types
'a
*)

(* bad types
'a
*)
