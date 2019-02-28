
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | _ -> (digitsOfInt (n / 10)) :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,7)-(5,65)
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (5,7)-(5,74)) (Var (Just (5,14)-(5,15)) "n") [(LitPat (Just (5,23)-(5,24)) (LI 0),Nothing,List (Just (5,28)-(5,30)) [] Nothing),(WildPat (Just (5,33)-(5,34)),Nothing,App (Just (5,38)-(5,73)) (Var (Just (5,61)-(5,62)) "@") [App (Just (5,38)-(5,60)) (Var (Just (5,39)-(5,50)) "digitsOfInt") [Bop (Just (5,51)-(5,59)) Div (Var (Just (5,52)-(5,53)) "n") (Lit (Just (5,56)-(5,58)) (LI 10))],List (Just (5,63)-(5,73)) [Bop (Just (5,64)-(5,72)) Mod (Var (Just (5,64)-(5,65)) "n") (Lit (Just (5,70)-(5,72)) (LI 10))] Nothing])]
*)

(* typed spans
(5,7)-(5,74)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
