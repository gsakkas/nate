
let rec sumList xs = if (xs :: 1) = 1 then 0;;


(* fix

let rec sum list = match list with | [] -> 0 | head::tail -> head;;

let rec sumList xs = sum xs;;

*)

(* changed spans
(2,16)-(2,44)
fun list ->
  match list with
  | [] -> 0
  | head :: tail -> head
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(2,21)-(2,44)
sum xs
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (2,12)-(2,65)) (VarPat (Just (2,12)-(2,16)) "list") (Case (Just (2,19)-(2,65)) (Var (Just (2,25)-(2,29)) "list") [(ConPat (Just (2,37)-(2,39)) "[]" Nothing,Nothing,Lit (Just (2,43)-(2,44)) (LI 0)),(ConsPat (Just (2,47)-(2,57)) (VarPat (Just (2,47)-(2,51)) "head") (VarPat (Just (2,53)-(2,57)) "tail"),Nothing,Var (Just (2,61)-(2,65)) "head")]) Nothing
App (Just (4,21)-(4,27)) (Var (Just (4,21)-(4,24)) "sum") [Var (Just (4,25)-(4,27)) "xs"]
*)

(* typed spans
(2,12)-(2,65)
(4,21)-(4,27)
*)

(* correct types
int list -> int
int
*)

(* bad types
'a -> unit
unit
*)
