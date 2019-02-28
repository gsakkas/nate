
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  let h::t = l in match l with | [] -> [] | h::t -> listReverse t;;

*)

(* changed spans
(2,24)-(2,76)
let h :: t = l in
match l with
| [] -> []
| h :: t -> listReverse t
LetG NonRec (fromList [VarG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Let (Just (3,2)-(3,65)) NonRec [(ConsPat (Just (3,6)-(3,10)) (VarPat (Just (3,6)-(3,7)) "h") (VarPat (Just (3,9)-(3,10)) "t"),Var (Just (3,13)-(3,14)) "l")] (Case (Just (3,18)-(3,65)) (Var (Just (3,24)-(3,25)) "l") [(ConPat (Just (3,33)-(3,35)) "[]" Nothing,Nothing,List (Just (3,39)-(3,41)) [] Nothing),(ConsPat (Just (3,44)-(3,48)) (VarPat (Just (3,44)-(3,45)) "h") (VarPat (Just (3,47)-(3,48)) "t"),Nothing,App (Just (3,52)-(3,65)) (Var (Just (3,52)-(3,63)) "listReverse") [Var (Just (3,64)-(3,65)) "t"])])
*)

(* typed spans
(3,2)-(3,65)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
