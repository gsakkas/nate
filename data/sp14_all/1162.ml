
let rec listReverse l =
  match l with | [] -> [] | a::b::[] -> (listReverse b) @ a;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

*)

(* changed spans
(3,2)-(3,59)
match l with
| [] -> []
| a :: b -> listReverse b @ [a]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(3,57)) (Var (Just (3,8)-(3,9)) "l") [(ConPat (Just (3,17)-(3,19)) "[]" Nothing,Nothing,List (Just (3,23)-(3,25)) [] Nothing),(ConsPat (Just (3,28)-(3,32)) (VarPat (Just (3,28)-(3,29)) "a") (VarPat (Just (3,31)-(3,32)) "b"),Nothing,App (Just (3,36)-(3,57)) (Var (Just (3,52)-(3,53)) "@") [App (Just (3,36)-(3,51)) (Var (Just (3,37)-(3,48)) "listReverse") [Var (Just (3,49)-(3,50)) "b"],List (Just (3,54)-(3,57)) [Var (Just (3,55)-(3,56)) "a"] Nothing])]
*)

(* typed spans
(3,2)-(3,57)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
