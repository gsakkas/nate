
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt n)
       | true  -> (digitsOfInt n) mod 10);;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt n)
       | true  -> digitsOfInt (n mod 10));;

*)

(* changed spans
(8,18)-(8,40)
digitsOfInt (n mod 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (8,18)-(8,40)) (Var (Just (8,18)-(8,29)) "digitsOfInt") [Bop (Just (8,30)-(8,40)) Mod (Var (Just (8,31)-(8,32)) "n") (Lit (Just (8,37)-(8,39)) (LI 10))]
*)

(* typed spans
(8,18)-(8,40)
*)

(* correct types
int list
*)

(* bad types
int
*)
