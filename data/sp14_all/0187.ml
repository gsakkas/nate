
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,2)-(3,60)
match l with
| [] -> []
| _ :: tl -> listReverse tl
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (2,24)-(2,73)) (Var (Just (2,30)-(2,31)) "l") [(ConPat (Just (2,39)-(2,41)) "[]" Nothing,Nothing,List (Just (2,45)-(2,47)) [] Nothing),(ConsPat (Just (2,50)-(2,55)) (WildPat (Just (2,50)-(2,51))) (VarPat (Just (2,53)-(2,55)) "tl"),Nothing,App (Just (2,59)-(2,73)) (Var (Just (2,59)-(2,70)) "listReverse") [Var (Just (2,71)-(2,73)) "tl"])]
*)

(* typed spans
(2,24)-(2,73)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
