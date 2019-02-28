
let rec wwhile (f,b) =
  let x = f b in match x with | h::t -> if t then wwhile (f, h) else h;;


(* fix

let rec wwhile (f,b) =
  let x = f b in
  match x with | (x,y) -> if y = false then x else wwhile (f, x);;

*)

(* changed spans
(3,17)-(3,70)
match x with
| (x , y) -> if y = false
             then x
             else wwhile (f , x)
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (4,2)-(4,64)) (Var (Just (4,8)-(4,9)) "x") [(TuplePat (Just (4,18)-(4,21)) [VarPat (Just (4,18)-(4,19)) "x",VarPat (Just (4,20)-(4,21)) "y"],Nothing,Ite (Just (4,26)-(4,64)) (Bop (Just (4,29)-(4,38)) Eq (Var (Just (4,29)-(4,30)) "y") (Lit (Just (4,33)-(4,38)) (LB False))) (Var (Just (4,44)-(4,45)) "x") (App (Just (4,51)-(4,64)) (Var (Just (4,51)-(4,57)) "wwhile") [Tuple (Just (4,58)-(4,64)) [Var (Just (4,59)-(4,60)) "f",Var (Just (4,62)-(4,63)) "x"]]))]
*)

(* typed spans
(4,2)-(4,64)
*)

(* correct types
'a
*)

(* bad types
'a
*)
