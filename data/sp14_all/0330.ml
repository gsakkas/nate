
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  wwhile ((if b = (f b) then (b, false) else (b, true)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile (helper, b);;

*)

(* changed spans
(6,2)-(6,59)
let helper =
  fun x ->
    if b = f b
    then (b , false)
    else (b , true) in
wwhile (helper , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (6,2)-(7,20)) NonRec [(VarPat (Just (6,6)-(6,12)) "helper",Lam (Just (6,13)-(6,60)) (VarPat (Just (6,13)-(6,14)) "x") (Ite (Just (6,17)-(6,60)) (Bop (Just (6,20)-(6,29)) Eq (Var (Just (6,20)-(6,21)) "b") (App (Just (6,24)-(6,29)) (Var (Just (6,25)-(6,26)) "f") [Var (Just (6,27)-(6,28)) "b"])) (Tuple (Just (6,35)-(6,45)) [Var (Just (6,36)-(6,37)) "b",Lit (Just (6,39)-(6,44)) (LB False)]) (Tuple (Just (6,51)-(6,60)) [Var (Just (6,52)-(6,53)) "b",Lit (Just (6,55)-(6,59)) (LB True)])) Nothing)] (App (Just (7,2)-(7,20)) (Var (Just (7,2)-(7,8)) "wwhile") [Tuple (Just (7,9)-(7,20)) [Var (Just (7,10)-(7,16)) "helper",Var (Just (7,18)-(7,19)) "b"]])
*)

(* typed spans
(6,2)-(7,20)
*)

(* correct types
'a
*)

(* bad types
'a
*)
