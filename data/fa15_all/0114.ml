
let rec digitsOfInt n =
  let return = [] in
  if n <> 0
  then ((n mod 10) :: return; (digitsOfInt 0) :: return)
  else return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n <> 0 then ((n mod 10) :: return; (digitsOfInt 0) @ return) else return;;

*)

(* changed spans
(5,30)-(5,55)
digitsOfInt 0 @ return
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (4,40)-(4,64)) (Var (Just (4,56)-(4,57)) "@") [App (Just (4,40)-(4,55)) (Var (Just (4,41)-(4,52)) "digitsOfInt") [Lit (Just (4,53)-(4,54)) (LI 0)],Var (Just (4,58)-(4,64)) "return"]
*)

(* typed spans
(4,40)-(4,64)
*)

(* correct types
int list
*)

(* bad types
int list
*)
