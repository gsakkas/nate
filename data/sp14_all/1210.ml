
let rec wwhile (f,b) =
  match b with | (f',b') -> if b' then wwhile (f, f') else f';;


(* fix

let rec wwhile (f,b) =
  match f b with | (f',x') -> if x' then wwhile (f, f') else f';;

*)

(* changed spans
(3,2)-(3,61)
match f b with
| (f' , x') -> if x'
               then wwhile (f , f')
               else f'
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(3,63)) (App (Just (3,8)-(3,11)) (Var (Just (3,8)-(3,9)) "f") [Var (Just (3,10)-(3,11)) "b"]) [(TuplePat (Just (3,20)-(3,25)) [VarPat (Just (3,20)-(3,22)) "f'",VarPat (Just (3,23)-(3,25)) "x'"],Nothing,Ite (Just (3,30)-(3,63)) (Var (Just (3,33)-(3,35)) "x'") (App (Just (3,41)-(3,55)) (Var (Just (3,41)-(3,47)) "wwhile") [Tuple (Just (3,48)-(3,55)) [Var (Just (3,49)-(3,50)) "f",Var (Just (3,52)-(3,54)) "f'"]]) (Var (Just (3,61)-(3,63)) "f'"))]
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
