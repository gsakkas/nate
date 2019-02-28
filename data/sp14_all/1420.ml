
let rec digitsOfInt n =
  match n with
  | [] -> []
  | 0 -> [0]
  | _ -> (digitsOfInt (n / 10)) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(3,2)-(6,44)
if n < 0
then []
else (match n with
      | 0 -> [0]
      | _ -> digitsOfInt (n / 10) @ [n mod 10])
IteG (BopG EmptyG EmptyG) (ListG EmptyG) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Ite (Just (3,2)-(5,75)) (Bop (Just (3,5)-(3,10)) Lt (Var (Just (3,5)-(3,6)) "n") (Lit (Just (3,9)-(3,10)) (LI 0))) (List (Just (4,7)-(4,9)) [] Nothing) (Case (Just (5,7)-(5,75)) (Var (Just (5,14)-(5,15)) "n") [(LitPat (Just (5,23)-(5,24)) (LI 0),Nothing,List (Just (5,28)-(5,31)) [Lit (Just (5,29)-(5,30)) (LI 0)] Nothing),(WildPat (Just (5,34)-(5,35)),Nothing,App (Just (5,39)-(5,74)) (Var (Just (5,62)-(5,63)) "@") [App (Just (5,39)-(5,61)) (Var (Just (5,40)-(5,51)) "digitsOfInt") [Bop (Just (5,52)-(5,60)) Div (Var (Just (5,53)-(5,54)) "n") (Lit (Just (5,57)-(5,59)) (LI 10))],List (Just (5,64)-(5,74)) [Bop (Just (5,65)-(5,73)) Mod (Var (Just (5,65)-(5,66)) "n") (Lit (Just (5,71)-(5,73)) (LI 10))] Nothing])])
*)

(* typed spans
(3,2)-(5,75)
*)

(* correct types
int list
*)

(* bad types
int list
*)
