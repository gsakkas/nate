
let rec digitsOfInt n =
  let return = [] in if n != 0 then (n mod 10) digitsOfInt 0 else return;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) :: return else return;;

*)

(* changed spans
(3,36)-(3,60)
(n mod 10) :: return
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG])))

*)

(* changed exprs
ConApp (Just (3,36)-(3,56)) "::" (Just (Tuple (Just (3,36)-(3,56)) [Bop (Just (3,36)-(3,46)) Mod (Var (Just (3,37)-(3,38)) "n") (Lit (Just (3,43)-(3,45)) (LI 10)),Var (Just (3,50)-(3,56)) "return"])) Nothing
*)

(* typed spans
(3,36)-(3,56)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
