
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt (n / 10))
       | true  -> 1 :: 2);;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt (n / 10))
       | true  -> (n mod 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(8,23)-(8,24)
n mod 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (8,18)-(8,28)) Mod (Var (Just (8,19)-(8,20)) "n") (Lit (Just (8,25)-(8,27)) (LI 10))
*)

(* typed spans
(8,18)-(8,28)
*)

(* correct types
int
*)

(* bad types
int
*)
