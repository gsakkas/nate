
let rec digitsOfInt n =
  if n > 0 then let x = n mod 10 in (digitsOfInt n) :: x else [];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) @ [x]);;

*)

(* changed spans
(3,5)-(3,10)
n < 0
BopG VarG LitG

(3,16)-(3,56)
[]
ListG EmptyG

(3,36)-(3,56)
digitsOfInt n @ [x]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
Bop (Just (3,5)-(3,10)) Lt (Var (Just (3,5)-(3,6)) "n") (Lit (Just (3,9)-(3,10)) (LI 0))
List (Just (3,16)-(3,18)) [] Nothing
App (Just (3,45)-(3,66)) (Var (Just (3,61)-(3,62)) "@") [App (Just (3,45)-(3,60)) (Var (Just (3,46)-(3,57)) "digitsOfInt") [Var (Just (3,58)-(3,59)) "n"],List (Just (3,63)-(3,66)) [Var (Just (3,64)-(3,65)) "x"] Nothing]
*)

(* typed spans
(3,5)-(3,10)
(3,16)-(3,18)
(3,45)-(3,66)
*)

(* correct types
bool
int list
int list
*)

(* bad types
bool
'a list
'a list
*)
