
let rec add current next =
  match current with | [] -> [next] | front::back -> front (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else digitsOfInt (n / 10) add [n mod 10];;


(* fix

let rec add current next =
  match current with | [] -> [next] | front::back -> front :: (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;

*)

(* changed spans
(3,53)-(3,74)
front :: (add back next)
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG])])))

(6,25)-(6,60)
add (digitsOfInt (n / 10))
    (n mod 10)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
ConApp (Just (3,53)-(3,77)) "::" (Just (Tuple (Just (3,53)-(3,77)) [Var (Just (3,53)-(3,58)) "front",App (Just (3,62)-(3,77)) (Var (Just (3,63)-(3,66)) "add") [Var (Just (3,67)-(3,71)) "back",Var (Just (3,72)-(3,76)) "next"]])) Nothing
App (Just (6,25)-(6,62)) (Var (Just (6,25)-(6,28)) "add") [App (Just (6,29)-(6,51)) (Var (Just (6,30)-(6,41)) "digitsOfInt") [Bop (Just (6,42)-(6,50)) Div (Var (Just (6,43)-(6,44)) "n") (Lit (Just (6,47)-(6,49)) (LI 10))],Bop (Just (6,52)-(6,62)) Mod (Var (Just (6,53)-(6,54)) "n") (Lit (Just (6,59)-(6,61)) (LI 10))]
*)

(* typed spans
(3,53)-(3,77)
(6,25)-(6,62)
*)

(* correct types
int list
int list
*)

(* bad types
'a list
'a list
*)
