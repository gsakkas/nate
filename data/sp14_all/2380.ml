
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n / 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,47)
n / 10
BopG VarG LitG

(3,51)-(3,61)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
Bop (Just (3,25)-(3,33)) Div (Var (Just (3,26)-(3,27)) "n") (Lit (Just (3,30)-(3,32)) (LI 10))
App (Just (3,37)-(3,59)) (Var (Just (3,38)-(3,49)) "digitsOfInt") [Bop (Just (3,50)-(3,58)) Div (Var (Just (3,51)-(3,52)) "n") (Lit (Just (3,55)-(3,57)) (LI 10))]
*)

(* typed spans
(3,25)-(3,33)
(3,37)-(3,59)
*)

(* correct types
int
int list
*)

(* bad types
'a
int
*)
