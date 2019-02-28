
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> [n]
       | true  -> (digitsOfInt (n / 10)) :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> [n]
       | true  -> (n / 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(8,18)-(8,40)
n / 10
BopG VarG LitG

(8,44)-(8,54)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
Bop (Just (8,18)-(8,26)) Div (Var (Just (8,19)-(8,20)) "n") (Lit (Just (8,23)-(8,25)) (LI 10))
App (Just (8,30)-(8,52)) (Var (Just (8,31)-(8,42)) "digitsOfInt") [Bop (Just (8,43)-(8,51)) Div (Var (Just (8,44)-(8,45)) "n") (Lit (Just (8,48)-(8,50)) (LI 10))]
*)

(* typed spans
(8,18)-(8,26)
(8,30)-(8,52)
*)

(* correct types
int
int list
*)

(* bad types
int
int
*)
