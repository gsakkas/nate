
let rec digitsOfInt n =
  match n with | 0 -> [] | x::xs' -> ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n > 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,2)-(3,72)
if n > 0
then []
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Ite (Just (3,2)-(3,59)) (Bop (Just (3,5)-(3,10)) Gt (Var (Just (3,5)-(3,6)) "n") (Lit (Just (3,9)-(3,10)) (LI 0))) (List (Just (3,16)-(3,18)) [] Nothing) (App (Just (3,24)-(3,59)) (Var (Just (3,47)-(3,48)) "@") [App (Just (3,24)-(3,46)) (Var (Just (3,25)-(3,36)) "digitsOfInt") [Bop (Just (3,37)-(3,45)) Div (Var (Just (3,38)-(3,39)) "n") (Lit (Just (3,42)-(3,44)) (LI 10))],List (Just (3,49)-(3,59)) [Bop (Just (3,50)-(3,58)) Mod (Var (Just (3,50)-(3,51)) "n") (Lit (Just (3,56)-(3,58)) (LI 10))] Nothing])
*)

(* typed spans
(3,2)-(3,59)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
