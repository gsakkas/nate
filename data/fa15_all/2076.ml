
let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) :: x else n;;


(* fix

let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) @ [x] else [n];;

*)

(* changed spans
(3,36)-(3,63)
digitsOfInt (n / 10) @ [x]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

(3,69)-(3,70)
[n]
ListG VarG

*)

(* changed exprs
App (Just (3,36)-(3,64)) (Var (Just (3,59)-(3,60)) "@") [App (Just (3,36)-(3,58)) (Var (Just (3,37)-(3,48)) "digitsOfInt") [Bop (Just (3,49)-(3,57)) Div (Var (Just (3,50)-(3,51)) "n") (Lit (Just (3,54)-(3,56)) (LI 10))],List (Just (3,61)-(3,64)) [Var (Just (3,62)-(3,63)) "x"] Nothing]
List (Just (3,70)-(3,73)) [Var (Just (3,71)-(3,72)) "n"] Nothing
*)

(* typed spans
(3,36)-(3,64)
(3,70)-(3,73)
*)

(* correct types
int list
int list
*)

(* bad types
int list
int
*)
