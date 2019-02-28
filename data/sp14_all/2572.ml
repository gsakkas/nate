
let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail::third::fourth -> [fourth; third; tail; head];;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail::third::fourth::fifth -> [fourth; third; tail; head];;

*)

(* changed spans
(5,2)-(8,60)
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third :: fourth :: fifth -> [fourth ; third ; tail ; head]
CaseG VarG (fromList [(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (5,2)-(8,67)) (Var (Just (5,8)-(5,9)) "l") [(ConPat (Just (6,4)-(6,6)) "[]" Nothing,Nothing,List (Just (6,10)-(6,12)) [] Nothing),(ConsPat (Just (7,4)-(7,9)) (VarPat (Just (7,4)-(7,5)) "x") (ConPat (Just (7,7)-(7,9)) "[]" Nothing),Nothing,List (Just (7,13)-(7,16)) [Var (Just (7,14)-(7,15)) "x"] Nothing),(ConsPat (Just (8,4)-(8,36)) (VarPat (Just (8,4)-(8,8)) "head") (ConsPat (Just (8,10)-(8,36)) (VarPat (Just (8,10)-(8,14)) "tail") (ConsPat (Just (8,16)-(8,36)) (VarPat (Just (8,16)-(8,21)) "third") (ConsPat (Just (8,23)-(8,36)) (VarPat (Just (8,23)-(8,29)) "fourth") (VarPat (Just (8,31)-(8,36)) "fifth")))),Nothing,List (Just (8,40)-(8,67)) [Var (Just (8,41)-(8,47)) "fourth",Var (Just (8,49)-(8,54)) "third",Var (Just (8,56)-(8,60)) "tail",Var (Just (8,62)-(8,66)) "head"] Nothing)]
*)

(* typed spans
(5,2)-(8,67)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
