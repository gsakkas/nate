
let rec digitsOfInt n =
  let return = [] in
  if n == 0 then return else (n mod 10) :: return; (digitsOfInt 0) :: return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n == 0 then return else (n mod 10) :: return; (digitsOfInt 0) @ return;;

*)

(* changed spans
(4,51)-(4,76)
digitsOfInt 0 @ return
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (4,51)-(4,75)) (Var (Just (4,67)-(4,68)) "@") [App (Just (4,51)-(4,66)) (Var (Just (4,52)-(4,63)) "digitsOfInt") [Lit (Just (4,64)-(4,65)) (LI 0)],Var (Just (4,69)-(4,75)) "return"]
*)

(* typed spans
(4,51)-(4,75)
*)

(* correct types
int list
*)

(* bad types
int list
*)
