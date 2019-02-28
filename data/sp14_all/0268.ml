
let rec digitsOfInt n =
  let myList = [] in
  if n <= 0 then [] else [digitsOfInt (n mod 10); digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  let myList = [] in
  if n <= 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(4,25)-(4,71)
if n < 10
then [n]
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Ite (Just (6,7)-(6,66)) (Bop (Just (6,10)-(6,16)) Lt (Var (Just (6,10)-(6,11)) "n") (Lit (Just (6,14)-(6,16)) (LI 10))) (List (Just (6,22)-(6,25)) [Var (Just (6,23)-(6,24)) "n"] Nothing) (App (Just (6,31)-(6,66)) (Var (Just (6,54)-(6,55)) "@") [App (Just (6,31)-(6,53)) (Var (Just (6,32)-(6,43)) "digitsOfInt") [Bop (Just (6,44)-(6,52)) Div (Var (Just (6,45)-(6,46)) "n") (Lit (Just (6,49)-(6,51)) (LI 10))],List (Just (6,56)-(6,66)) [Bop (Just (6,57)-(6,65)) Mod (Var (Just (6,57)-(6,58)) "n") (Lit (Just (6,63)-(6,65)) (LI 10))] Nothing])
*)

(* typed spans
(6,7)-(6,66)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
