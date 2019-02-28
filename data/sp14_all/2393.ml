
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> [n]
       | true  -> (digitsOfInt (n / 10)) :: (digitsOfInt (n mod 10)));;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> [n]
       | true  -> (n / 10) :: (digitsOfInt (n mod 10)));;

*)

(* changed spans
(8,18)-(8,40)
n / 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (8,18)-(8,26)) Div (Var (Just (8,19)-(8,20)) "n") (Lit (Just (8,23)-(8,25)) (LI 10))
*)

(* typed spans
(8,18)-(8,26)
*)

(* correct types
int
*)

(* bad types
int
*)
