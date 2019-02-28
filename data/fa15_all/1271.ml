
let rec listReverse l =
  let newList = [] in
  match l with
  | [] -> []
  | head::[] -> head
  | head::tail -> (listReverse tail) :: head;;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(3,2)-(7,44)
match l with
| [] -> []
| head :: [] -> [head]
| head :: tail -> listReverse tail @ [head]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(6,45)) (Var (Just (3,8)-(3,9)) "l") [(ConPat (Just (4,4)-(4,6)) "[]" Nothing,Nothing,List (Just (4,10)-(4,12)) [] Nothing),(ConsPat (Just (5,4)-(5,12)) (VarPat (Just (5,4)-(5,8)) "head") (ConPat (Just (5,10)-(5,12)) "[]" Nothing),Nothing,List (Just (5,16)-(5,22)) [Var (Just (5,17)-(5,21)) "head"] Nothing),(ConsPat (Just (6,4)-(6,14)) (VarPat (Just (6,4)-(6,8)) "head") (VarPat (Just (6,10)-(6,14)) "tail"),Nothing,App (Just (6,18)-(6,45)) (Var (Just (6,37)-(6,38)) "@") [App (Just (6,18)-(6,36)) (Var (Just (6,19)-(6,30)) "listReverse") [Var (Just (6,31)-(6,35)) "tail"],List (Just (6,39)-(6,45)) [Var (Just (6,40)-(6,44)) "head"] Nothing])]
*)

(* typed spans
(3,2)-(6,45)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
