
let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (n /. 10) :: return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (n / 10) :: return;;

*)

(* changed spans
(4,51)-(4,60)
n / 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (4,51)-(4,59)) Div (Var (Just (4,52)-(4,53)) "n") (Lit (Just (4,56)-(4,58)) (LI 10))
*)

(* typed spans
(4,51)-(4,59)
*)

(* correct types
int
*)

(* bad types
float
*)
