
let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then [] :: return else (n mod 10) :: return;
  (digitsOfInt 0) @ return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (digitsOfInt 0) @ return;;

*)

(* changed spans
(4,17)-(4,29)
return
VarG

*)

(* changed exprs
Var (Just (4,17)-(4,23)) "return"
*)

(* typed spans
(4,17)-(4,23)
*)

(* correct types
int list
*)

(* bad types
'a list list
*)
