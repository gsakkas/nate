
let rec clone x n = match n with | 0 -> [] | _ -> [clone x];;


(* fix

let rec clone x n = match n with | 0 -> [] | n -> [x] @ (clone x (n - 1));;

*)

(* changed spans
(2,20)-(2,59)
match n with
| 0 -> []
| n -> [x] @ clone x (n - 1)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (2,20)-(2,73)) (Var (Just (2,26)-(2,27)) "n") [(LitPat (Just (2,35)-(2,36)) (LI 0),Nothing,List (Just (2,40)-(2,42)) [] Nothing),(VarPat (Just (2,45)-(2,46)) "n",Nothing,App (Just (2,50)-(2,73)) (Var (Just (2,54)-(2,55)) "@") [List (Just (2,50)-(2,53)) [Var (Just (2,51)-(2,52)) "x"] Nothing,App (Just (2,56)-(2,73)) (Var (Just (2,57)-(2,62)) "clone") [Var (Just (2,63)-(2,64)) "x",Bop (Just (2,65)-(2,72)) Minus (Var (Just (2,66)-(2,67)) "n") (Lit (Just (2,70)-(2,71)) (LI 1))]])]
*)

(* typed spans
(2,20)-(2,73)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
