
let rec digitsOfInt n =
  let return = [] in
  if n <> 0 then (n mod 10) :: (return digitsOfInt 0) else return;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) :: return else return;;

*)

(* changed spans
(4,31)-(4,53)
return
VarG

*)

(* changed exprs
Var (Just (3,50)-(3,56)) "return"
*)

(* typed spans
(3,50)-(3,56)
*)

(* correct types
int list
*)

(* bad types
int list
*)
