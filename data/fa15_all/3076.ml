
let rec digitsOfInt n =
  let numL = [] in if n > 0 then (n mod 10) :: (numL digitsOfInt n) else numL;;


(* fix

let rec digitsOfInt n =
  let numL = [] in if n > 0 then (n mod 10) :: (digitsOfInt n) else numL;;

*)

(* changed spans
(3,47)-(3,67)
digitsOfInt n
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,47)-(3,62)) (Var (Just (3,48)-(3,59)) "digitsOfInt") [Var (Just (3,60)-(3,61)) "n"]
*)

(* typed spans
(3,47)-(3,62)
*)

(* correct types
int list
*)

(* bad types
int list
*)
