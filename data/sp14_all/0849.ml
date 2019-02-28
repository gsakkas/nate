
let rec digitsOfInt n = match n with | n -> 5 | 0 -> [];;


(* fix

let rec digitsOfInt n = match n with | n -> [n];;

*)

(* changed spans
(2,24)-(2,55)
match n with
| n -> [n]
CaseG VarG (fromList [(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (2,24)-(2,47)) (Var (Just (2,30)-(2,31)) "n") [(VarPat (Just (2,39)-(2,40)) "n",Nothing,List (Just (2,44)-(2,47)) [Var (Just (2,45)-(2,46)) "n"] Nothing)]
*)

(* typed spans
(2,24)-(2,47)
*)

(* correct types
'a list
*)

(* bad types
int
*)
