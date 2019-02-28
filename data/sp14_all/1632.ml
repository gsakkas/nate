
let rec wwhile (f,b) = match f with | (n,boo) -> f b;;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

*)

(* changed spans
(2,23)-(2,52)
match f b with
| (x , true) -> wwhile (f , x)
| (x , false) -> x
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (3,2)-(3,63)) (App (Just (3,8)-(3,11)) (Var (Just (3,8)-(3,9)) "f") [Var (Just (3,10)-(3,11)) "b"]) [(TuplePat (Just (3,20)-(3,26)) [VarPat (Just (3,20)-(3,21)) "x",LitPat (Just (3,22)-(3,26)) (LB True)],Nothing,App (Just (3,32)-(3,45)) (Var (Just (3,32)-(3,38)) "wwhile") [Tuple (Just (3,39)-(3,45)) [Var (Just (3,40)-(3,41)) "f",Var (Just (3,43)-(3,44)) "x"]]),(TuplePat (Just (3,49)-(3,56)) [VarPat (Just (3,49)-(3,50)) "x",LitPat (Just (3,51)-(3,56)) (LB False)],Nothing,Var (Just (3,62)-(3,63)) "x")]
*)

(* typed spans
(3,2)-(3,63)
*)

(* correct types
'a
*)

(* bad types
'a
*)
