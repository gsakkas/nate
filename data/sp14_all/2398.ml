
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt (n / 10))
       | true  -> [digitsOfInt (n / 10); n mod 10]);;


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
(8,18)-(8,50)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG])))

*)

(* changed exprs
ConApp (Just (8,18)-(8,54)) "::" (Just (Tuple (Just (8,18)-(8,54)) [Bop (Just (8,18)-(8,28)) Mod (Var (Just (8,19)-(8,20)) "n") (Lit (Just (8,25)-(8,27)) (LI 10)),App (Just (8,32)-(8,54)) (Var (Just (8,33)-(8,44)) "digitsOfInt") [Bop (Just (8,45)-(8,53)) Div (Var (Just (8,46)-(8,47)) "n") (Lit (Just (8,50)-(8,52)) (LI 10))]])) Nothing
*)

(* typed spans
(8,18)-(8,54)
*)

(* correct types
int list
*)

(* bad types
int list list
*)
