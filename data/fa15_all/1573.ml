
let rec listReverse l =
  match l with | [] -> [] | (h::tail)::[] -> listReverse tail;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::tail -> (listReverse tail) @ [h];;

*)

(* changed spans
(3,2)-(3,61)
match l with
| [] -> []
| h :: tail -> listReverse tail @ [h]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(3,63)) (Var (Just (3,8)-(3,9)) "l") [(ConPat (Just (3,17)-(3,19)) "[]" Nothing,Nothing,List (Just (3,23)-(3,25)) [] Nothing),(ConsPat (Just (3,28)-(3,35)) (VarPat (Just (3,28)-(3,29)) "h") (VarPat (Just (3,31)-(3,35)) "tail"),Nothing,App (Just (3,39)-(3,63)) (Var (Just (3,58)-(3,59)) "@") [App (Just (3,39)-(3,57)) (Var (Just (3,40)-(3,51)) "listReverse") [Var (Just (3,52)-(3,56)) "tail"],List (Just (3,60)-(3,63)) [Var (Just (3,61)-(3,62)) "h"] Nothing])]
*)

(* typed spans
(3,2)-(3,63)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
