
let rec wwhile (f,b) = match b with | (e,boo) -> if boo = true then e b;;


(* fix

let rec wwhile (f,b) =
  let ans = f b in
  match ans with | (num,boo) -> if boo = true then wwhile (f, num) else num;;

*)

(* changed spans
(2,23)-(2,71)
let ans = f b in
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Let (Just (3,2)-(4,75)) NonRec [(VarPat (Just (3,6)-(3,9)) "ans",App (Just (3,12)-(3,15)) (Var (Just (3,12)-(3,13)) "f") [Var (Just (3,14)-(3,15)) "b"])] (Case (Just (4,2)-(4,75)) (Var (Just (4,8)-(4,11)) "ans") [(TuplePat (Just (4,20)-(4,27)) [VarPat (Just (4,20)-(4,23)) "num",VarPat (Just (4,24)-(4,27)) "boo"],Nothing,Ite (Just (4,32)-(4,75)) (Bop (Just (4,35)-(4,45)) Eq (Var (Just (4,35)-(4,38)) "boo") (Lit (Just (4,41)-(4,45)) (LB True))) (App (Just (4,51)-(4,66)) (Var (Just (4,51)-(4,57)) "wwhile") [Tuple (Just (4,58)-(4,66)) [Var (Just (4,59)-(4,60)) "f",Var (Just (4,62)-(4,65)) "num"]]) (Var (Just (4,72)-(4,75)) "num"))])
*)

(* typed spans
(3,2)-(4,75)
*)

(* correct types
'a
*)

(* bad types
unit
*)
