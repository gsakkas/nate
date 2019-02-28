
let rec digitsOfInt n = let myList = [] in if n <= 0 then [];;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(2,43)-(2,60)
(n mod 10) :: myList
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG])))

*)

(* changed exprs
ConApp (Just (3,44)-(3,64)) "::" (Just (Tuple (Just (3,44)-(3,64)) [Bop (Just (3,44)-(3,54)) Mod (Var (Just (3,45)-(3,46)) "n") (Lit (Just (3,51)-(3,53)) (LI 10)),Var (Just (3,58)-(3,64)) "myList"])) Nothing
*)

(* typed spans
(3,44)-(3,64)
*)

(* correct types
int list
*)

(* bad types
unit
*)
