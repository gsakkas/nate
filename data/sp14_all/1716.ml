
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) @ [(digitsOfInt n) / 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,35)
[n mod 10]
ListG (BopG EmptyG EmptyG)

(3,38)-(3,60)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(3,38)-(3,60)
digitsOfInt
VarG

(3,38)-(3,60)
n / 10
BopG VarG LitG

*)

(* changed exprs
List (Just (3,25)-(3,35)) [Bop (Just (3,26)-(3,34)) Mod (Var (Just (3,26)-(3,27)) "n") (Lit (Just (3,32)-(3,34)) (LI 10))] Nothing
App (Just (3,38)-(3,60)) (Var (Just (3,39)-(3,50)) "digitsOfInt") [Bop (Just (3,51)-(3,59)) Div (Var (Just (3,52)-(3,53)) "n") (Lit (Just (3,56)-(3,58)) (LI 10))]
Var (Just (3,39)-(3,50)) "digitsOfInt"
Bop (Just (3,51)-(3,59)) Div (Var (Just (3,52)-(3,53)) "n") (Lit (Just (3,56)-(3,58)) (LI 10))
*)

(* typed spans
(3,25)-(3,35)
(3,38)-(3,60)
(3,39)-(3,50)
(3,51)-(3,59)
*)

(* correct types
int list
int list
int -> int list
int
*)

(* bad types
int
int list
int list
int list
*)
