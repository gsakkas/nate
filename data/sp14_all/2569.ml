
let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail::t::s -> s :: t :: tail :: head;;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with | [] -> [] | x::[] -> [x] | head::tail::third -> [head; tail];;

*)

(* changed spans
(5,2)-(8,46)
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third -> [head ; tail]
CaseG VarG (fromList [(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (5,2)-(5,76)) (Var (Just (5,8)-(5,9)) "l") [(ConPat (Just (5,17)-(5,19)) "[]" Nothing,Nothing,List (Just (5,23)-(5,25)) [] Nothing),(ConsPat (Just (5,28)-(5,33)) (VarPat (Just (5,28)-(5,29)) "x") (ConPat (Just (5,31)-(5,33)) "[]" Nothing),Nothing,List (Just (5,37)-(5,40)) [Var (Just (5,38)-(5,39)) "x"] Nothing),(ConsPat (Just (5,43)-(5,60)) (VarPat (Just (5,43)-(5,47)) "head") (ConsPat (Just (5,49)-(5,60)) (VarPat (Just (5,49)-(5,53)) "tail") (VarPat (Just (5,55)-(5,60)) "third")),Nothing,List (Just (5,64)-(5,76)) [Var (Just (5,65)-(5,69)) "head",Var (Just (5,71)-(5,75)) "tail"] Nothing)]
*)

(* typed spans
(5,2)-(5,76)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
