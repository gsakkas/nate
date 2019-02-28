
let rec wwhile (f,b) =
  let x = wwhile (f, b) in
  let h::t = x in match t with | false  -> h | true  -> wwhile (f, h);;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

*)

(* changed spans
(3,2)-(4,69)
let (x , y) = f b in
match y with
| false -> x
| true -> wwhile (f , x)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Let (Just (3,2)-(3,72)) NonRec [(TuplePat (Just (3,7)-(3,10)) [VarPat (Just (3,7)-(3,8)) "x",VarPat (Just (3,9)-(3,10)) "y"],App (Just (3,14)-(3,17)) (Var (Just (3,14)-(3,15)) "f") [Var (Just (3,16)-(3,17)) "b"])] (Case (Just (3,21)-(3,72)) (Var (Just (3,27)-(3,28)) "y") [(LitPat (Just (3,36)-(3,41)) (LB False),Nothing,Var (Just (3,46)-(3,47)) "x"),(LitPat (Just (3,50)-(3,54)) (LB True),Nothing,App (Just (3,59)-(3,72)) (Var (Just (3,59)-(3,65)) "wwhile") [Tuple (Just (3,66)-(3,72)) [Var (Just (3,67)-(3,68)) "f",Var (Just (3,70)-(3,71)) "x"]])])
*)

(* typed spans
(3,2)-(3,72)
*)

(* correct types
'a
*)

(* bad types
'a
*)
