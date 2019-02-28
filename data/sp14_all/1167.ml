
let rec listReverse l =
  match l with | [] -> [] | a::b -> [listReverse b; [a]];;


(* fix

let rec listReverse l = match l with | [] -> [] | b::[] -> [b];;

*)

(* changed spans
(3,2)-(3,56)
match l with
| [] -> []
| b :: [] -> [b]
CaseG VarG (fromList [(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (2,24)-(2,62)) (Var (Just (2,30)-(2,31)) "l") [(ConPat (Just (2,39)-(2,41)) "[]" Nothing,Nothing,List (Just (2,45)-(2,47)) [] Nothing),(ConsPat (Just (2,50)-(2,55)) (VarPat (Just (2,50)-(2,51)) "b") (ConPat (Just (2,53)-(2,55)) "[]" Nothing),Nothing,List (Just (2,59)-(2,62)) [Var (Just (2,60)-(2,61)) "b"] Nothing)]
*)

(* typed spans
(2,24)-(2,62)
*)

(* correct types
'a list
*)

(* bad types
'a list list
*)
