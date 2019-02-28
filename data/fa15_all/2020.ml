
let rec wwhile (f,b) =
  let rec helper (b',c') =
    match c' with
    | false  -> b'
    | true  -> let b' = b' + 1 in let c' = f b' in helper (b', c') in
  helper ((f b), (f b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in match c' with | false  -> b';;

*)

(* changed spans
(3,2)-(7,23)
let (b' , c') = f b in
match c' with
| false -> b'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Let (Just (2,23)-(2,72)) NonRec [(TuplePat (Just (2,28)-(2,33)) [VarPat (Just (2,28)-(2,30)) "b'",VarPat (Just (2,31)-(2,33)) "c'"],App (Just (2,37)-(2,40)) (Var (Just (2,37)-(2,38)) "f") [Var (Just (2,39)-(2,40)) "b"])] (Case (Just (2,44)-(2,72)) (Var (Just (2,50)-(2,52)) "c'") [(LitPat (Just (2,60)-(2,65)) (LB False),Nothing,Var (Just (2,70)-(2,72)) "b'")])
*)

(* typed spans
(2,23)-(2,72)
*)

(* correct types
'a
*)

(* bad types
'a
*)
