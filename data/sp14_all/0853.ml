
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 | n -> ((n mod 10) :: (digitsOfInt (n / 10))) :: ns;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,31)-(4,75)
0
LitG

(4,31)-(4,75)
ns
VarG

*)

(* changed exprs
Lit (Just (4,22)-(4,23)) (LI 0)
Var (Just (4,27)-(4,29)) "ns"
*)

(* typed spans
(4,22)-(4,23)
(4,27)-(4,29)
*)

(* correct types
int
int list
*)

(* bad types
int list list
int list list
*)
