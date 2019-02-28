
let rec digitsOfInt n =
  if n < 0 then [] else (match n with | h::t -> h :: (digitsOfInt t));;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n_ -> (n_ mod 10) :: (digitsOfInt n_));;

*)

(* changed spans
(3,5)-(3,10)
n <= 0
BopG VarG LitG

(3,24)-(3,69)
match n with
| n_ -> (n_ mod 10) :: (digitsOfInt n_)
CaseG VarG (fromList [(Nothing,ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),BopG VarG LitG]))))])

*)

(* changed exprs
Bop (Just (3,5)-(3,11)) Le (Var (Just (3,5)-(3,6)) "n") (Lit (Just (3,10)-(3,11)) (LI 0))
Case (Just (5,7)-(5,61)) (Var (Just (5,14)-(5,15)) "n") [(VarPat (Just (5,23)-(5,25)) "n_",Nothing,ConApp (Just (5,29)-(5,60)) "::" (Just (Tuple (Just (5,29)-(5,60)) [Bop (Just (5,29)-(5,40)) Mod (Var (Just (5,30)-(5,32)) "n_") (Lit (Just (5,37)-(5,39)) (LI 10)),App (Just (5,44)-(5,60)) (Var (Just (5,45)-(5,56)) "digitsOfInt") [Var (Just (5,57)-(5,59)) "n_"]])) Nothing)]
*)

(* typed spans
(3,5)-(3,11)
(5,7)-(5,61)
*)

(* correct types
bool
int list
*)

(* bad types
bool
'a list
*)
