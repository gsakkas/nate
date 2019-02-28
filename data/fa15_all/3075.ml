
let rec digitsOfInt n =
  let numL = [] in if n > 0 then ((digitsOfInt n) mod 10) :: numL else numL;;


(* fix

let rec digitsOfInt n =
  let numL = [] in if n > 0 then (n mod 10) :: (digitsOfInt n) else numL;;

*)

(* changed spans
(3,34)-(3,49)
n
VarG

(3,34)-(3,49)
10
LitG

*)

(* changed exprs
Var (Just (3,34)-(3,35)) "n"
Lit (Just (3,40)-(3,42)) (LI 10)
*)

(* typed spans
(3,34)-(3,35)
(3,40)-(3,42)
*)

(* correct types
int
int
*)

(* bad types
int
int
*)
