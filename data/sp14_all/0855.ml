
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,37)-(4,59)
n mod 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (4,37)-(4,47)) Mod (Var (Just (4,38)-(4,39)) "n") (Lit (Just (4,44)-(4,46)) (LI 10))
*)

(* typed spans
(4,37)-(4,47)
*)

(* correct types
int
*)

(* bad types
int
*)
