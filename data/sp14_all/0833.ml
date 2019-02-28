
let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' | b' -> b' in
  acc b;;


(* fix

let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' in
  acc b;;

*)

(* changed spans
(5,4)-(5,68)
match res with
| (b' , c') -> if c'
               then acc b'
               else b'
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (5,4)-(5,57)) (Var (Just (5,10)-(5,13)) "res") [(TuplePat (Just (5,22)-(5,27)) [VarPat (Just (5,22)-(5,24)) "b'",VarPat (Just (5,25)-(5,27)) "c'"],Nothing,Ite (Just (5,32)-(5,57)) (Var (Just (5,35)-(5,37)) "c'") (App (Just (5,43)-(5,49)) (Var (Just (5,43)-(5,46)) "acc") [Var (Just (5,47)-(5,49)) "b'"]) (Var (Just (5,55)-(5,57)) "b'"))]
*)

(* typed spans
(5,4)-(5,57)
*)

(* correct types
'a
*)

(* bad types
'a
*)
