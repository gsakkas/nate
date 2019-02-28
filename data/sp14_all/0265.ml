
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n mod 10); []];;


(* fix

let rec digitsOfInt n =
  let myList = [] in
  if n <= 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,24)-(2,75)
let myList = [] in
if n <= 0
then []
else if n < 10
     then [n]
     else digitsOfInt (n / 10) @ [n mod 10]
LetG NonRec (fromList [ListG EmptyG]) (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Let (Just (3,2)-(6,66)) NonRec [(VarPat (Just (3,6)-(3,12)) "myList",List (Just (3,15)-(3,17)) [] Nothing)] (Ite (Just (4,2)-(6,66)) (Bop (Just (4,5)-(4,11)) Le (Var (Just (4,5)-(4,6)) "n") (Lit (Just (4,10)-(4,11)) (LI 0))) (List (Just (5,7)-(5,9)) [] Nothing) (Ite (Just (6,7)-(6,66)) (Bop (Just (6,10)-(6,16)) Lt (Var (Just (6,10)-(6,11)) "n") (Lit (Just (6,14)-(6,16)) (LI 10))) (List (Just (6,22)-(6,25)) [Var (Just (6,23)-(6,24)) "n"] Nothing) (App (Just (6,31)-(6,66)) (Var (Just (6,54)-(6,55)) "@") [App (Just (6,31)-(6,53)) (Var (Just (6,32)-(6,43)) "digitsOfInt") [Bop (Just (6,44)-(6,52)) Div (Var (Just (6,45)-(6,46)) "n") (Lit (Just (6,49)-(6,51)) (LI 10))],List (Just (6,56)-(6,66)) [Bop (Just (6,57)-(6,65)) Mod (Var (Just (6,57)-(6,58)) "n") (Lit (Just (6,63)-(6,65)) (LI 10))] Nothing])))
*)

(* typed spans
(3,2)-(6,66)
*)

(* correct types
int list
*)

(* bad types
'a list list
*)
