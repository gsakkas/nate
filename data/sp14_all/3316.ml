
let rec mulByDigit i l = match l with | [] -> [] | h::t -> h * i;;


(* fix

let rec mulByDigit i l = match l with | [] -> [] | h::m::t -> t;;

*)

(* changed spans
(2,25)-(2,64)
match l with
| [] -> []
| h :: m :: t -> t
CaseG VarG (fromList [(Nothing,VarG),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (2,25)-(2,63)) (Var (Just (2,31)-(2,32)) "l") [(ConPat (Just (2,40)-(2,42)) "[]" Nothing,Nothing,List (Just (2,46)-(2,48)) [] Nothing),(ConsPat (Just (2,51)-(2,58)) (VarPat (Just (2,51)-(2,52)) "h") (ConsPat (Just (2,54)-(2,58)) (VarPat (Just (2,54)-(2,55)) "m") (VarPat (Just (2,57)-(2,58)) "t")),Nothing,Var (Just (2,62)-(2,63)) "t")]
*)

(* typed spans
(2,25)-(2,63)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
