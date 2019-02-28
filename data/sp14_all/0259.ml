
let rec digitsOfInt n = match n with | [] -> [] | h::t -> if n < 0 then [];;


(* fix

let rec digitsOfInt n = match n with | _ when n < 0 -> [];;

*)

(* changed spans
(2,24)-(2,74)
match n with
| _ when n < 0 -> []
CaseG VarG (fromList [(Just (BopG EmptyG EmptyG),ListG EmptyG)])

*)

(* changed exprs
Case (Just (2,24)-(2,57)) (Var (Just (2,30)-(2,31)) "n") [(WildPat (Just (2,39)-(2,40)),Just (Bop (Just (2,46)-(2,51)) Lt (Var (Just (2,46)-(2,47)) "n") (Lit (Just (2,50)-(2,51)) (LI 0))),List (Just (2,55)-(2,57)) [] Nothing)]
*)

(* typed spans
(2,24)-(2,57)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
