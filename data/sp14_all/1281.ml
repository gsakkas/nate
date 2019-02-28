
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,51)-(3,61)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (3,51)-(3,61)) [Bop (Just (3,52)-(3,60)) Mod (Var (Just (3,52)-(3,53)) "n") (Lit (Just (3,58)-(3,60)) (LI 10))] Nothing
*)

(* typed spans
(3,51)-(3,61)
*)

(* correct types
int list
*)

(* bad types
int
*)
