
let stringOfList f l = List.map (f, l);;


(* fix

let stringOfList f l = match l with | x::[] -> "[" ^ (x ^ "]");;

*)

(* changed spans
(2,23)-(2,38)
match l with
| x :: [] -> "[" ^ (x ^ "]")
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (2,23)-(2,62)) (Var (Just (2,29)-(2,30)) "l") [(ConsPat (Just (2,38)-(2,43)) (VarPat (Just (2,38)-(2,39)) "x") (ConPat (Just (2,41)-(2,43)) "[]" Nothing),Nothing,App (Just (2,47)-(2,62)) (Var (Just (2,51)-(2,52)) "^") [Lit (Just (2,47)-(2,50)) (LS "["),App (Just (2,53)-(2,62)) (Var (Just (2,56)-(2,57)) "^") [Var (Just (2,54)-(2,55)) "x",Lit (Just (2,58)-(2,61)) (LS "]")]])]
*)

(* typed spans
(2,23)-(2,62)
*)

(* correct types
string
*)

(* bad types
'a
*)
