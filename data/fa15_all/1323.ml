
let sqsum xs =
  let f a x = match x with | [] -> a | x::t -> x * x in
  let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = match x with | 0 -> a | x -> x * x in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,52)
match x with
| 0 -> a
| x -> x * x
CaseG VarG (fromList [(Nothing,VarG),(Nothing,BopG EmptyG EmptyG)])

(4,13)-(4,15)
0
LitG

*)

(* changed exprs
Case (Just (3,14)-(3,48)) (Var (Just (3,20)-(3,21)) "x") [(LitPat (Just (3,29)-(3,30)) (LI 0),Nothing,Var (Just (3,34)-(3,35)) "a"),(VarPat (Just (3,38)-(3,39)) "x",Nothing,Bop (Just (3,43)-(3,48)) Times (Var (Just (3,43)-(3,44)) "x") (Var (Just (3,47)-(3,48)) "x"))]
Lit (Just (4,13)-(4,14)) (LI 0)
*)

(* typed spans
(3,14)-(3,48)
(4,13)-(4,14)
*)

(* correct types
int
int
*)

(* bad types
int
'a list
*)
