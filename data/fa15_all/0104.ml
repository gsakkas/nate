
let rec digitsOfInt n =
  let return = [] in if n < 0 then return else digitsOfInt - 1;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else digitsOfInt 1;;

*)

(* changed spans
(3,47)-(3,62)
digitsOfInt 1
AppG (fromList [LitG])

*)

(* changed exprs
App (Just (3,47)-(3,60)) (Var (Just (3,47)-(3,58)) "digitsOfInt") [Lit (Just (3,59)-(3,60)) (LI 1)]
*)

(* typed spans
(3,47)-(3,60)
*)

(* correct types
'a list
*)

(* bad types
int
*)
