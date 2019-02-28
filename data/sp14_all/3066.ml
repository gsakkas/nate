
let rec digitsOfInt n = match n with | 0 -> [] | n -> [digitsOfInt n];;


(* fix

let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,24)-(2,69)
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(3,67)) (Var (Just (3,8)-(3,9)) "n") [(LitPat (Just (3,17)-(3,18)) (LI 0),Nothing,List (Just (3,22)-(3,24)) [] Nothing),(WildPat (Just (3,27)-(3,28)),Nothing,App (Just (3,32)-(3,67)) (Var (Just (3,55)-(3,56)) "@") [App (Just (3,32)-(3,54)) (Var (Just (3,33)-(3,44)) "digitsOfInt") [Bop (Just (3,45)-(3,53)) Div (Var (Just (3,46)-(3,47)) "n") (Lit (Just (3,50)-(3,52)) (LI 10))],List (Just (3,57)-(3,67)) [Bop (Just (3,58)-(3,66)) Mod (Var (Just (3,58)-(3,59)) "n") (Lit (Just (3,64)-(3,66)) (LI 10))] Nothing])]
*)

(* typed spans
(3,2)-(3,67)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
