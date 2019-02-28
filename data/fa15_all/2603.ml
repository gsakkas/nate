
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | [] -> [] | h::t -> h @ [digitsOfInt t]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else (match n with | 0 -> []);;

*)

(* changed spans
(5,7)-(5,62)
match n with
| 0 -> []
CaseG VarG (fromList [(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (2,46)-(2,70)) (Var (Just (2,53)-(2,54)) "n") [(LitPat (Just (2,62)-(2,63)) (LI 0),Nothing,List (Just (2,67)-(2,69)) [] Nothing)]
*)

(* typed spans
(2,46)-(2,70)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
