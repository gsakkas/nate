
let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,32)-(3,54)
n mod 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (3,32)-(3,42)) Mod (Var (Just (3,33)-(3,34)) "n") (Lit (Just (3,39)-(3,41)) (LI 10))
*)

(* typed spans
(3,32)-(3,42)
*)

(* correct types
int
*)

(* bad types
'a
*)
