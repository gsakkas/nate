
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> digitsOfInt (n / 10) []);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,28)-(5,31)
[]
ListG EmptyG

(5,39)-(5,50)
(@)
VarG

(5,39)-(5,50)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(5,60)-(5,62)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (5,28)-(5,30)) [] Nothing
Var (Just (5,61)-(5,62)) "@"
App (Just (5,38)-(5,60)) (Var (Just (5,39)-(5,50)) "digitsOfInt") [Bop (Just (5,51)-(5,59)) Div (Var (Just (5,52)-(5,53)) "n") (Lit (Just (5,56)-(5,58)) (LI 10))]
List (Just (5,63)-(5,73)) [Bop (Just (5,64)-(5,72)) Mod (Var (Just (5,64)-(5,65)) "n") (Lit (Just (5,70)-(5,72)) (LI 10))] Nothing
*)

(* typed spans
(5,28)-(5,30)
(5,61)-(5,62)
(5,38)-(5,60)
(5,63)-(5,73)
*)

(* correct types
int list
int list -> int list -> int list
int list
int list
*)

(* bad types
int list
int -> 'a list -> int list
int -> 'a list -> int list
'a list
*)
