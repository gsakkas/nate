
let rec listReverse l = function | [] -> l | h::t -> listReverse (h :: l);;


(* fix

let rec listReverse l = match l with | [] -> l | (_::tail::[])::[] -> l;;

*)

(* changed spans
(2,24)-(2,73)
match l with
| [] -> l
| (_ :: tail :: []) :: [] -> l
CaseG VarG (fromList [(Nothing,VarG)])

*)

(* changed exprs
Case (Just (2,24)-(2,71)) (Var (Just (2,30)-(2,31)) "l") [(ConPat (Just (2,39)-(2,41)) "[]" Nothing,Nothing,Var (Just (2,45)-(2,46)) "l"),(ConsPat (Just (2,50)-(2,66)) (ConsPat (Just (2,50)-(2,61)) (WildPat (Just (2,50)-(2,51))) (ConsPat (Just (2,53)-(2,61)) (VarPat (Just (2,53)-(2,57)) "tail") (ConPat (Just (2,59)-(2,61)) "[]" Nothing))) (ConPat (Just (2,64)-(2,66)) "[]" Nothing),Nothing,Var (Just (2,70)-(2,71)) "l")]
*)

(* typed spans
(2,24)-(2,71)
*)

(* correct types
'a list list
*)

(* bad types
'a list -> 'a list
*)
