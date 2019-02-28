
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 | n -> (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,22)-(4,23)
0 :: ns
ConAppG (Just (TupleG (fromList [VarG,LitG])))

*)

(* changed exprs
ConApp (Just (4,22)-(4,29)) "::" (Just (Tuple (Just (4,22)-(4,29)) [Lit (Just (4,22)-(4,23)) (LI 0),Var (Just (4,27)-(4,29)) "ns"])) Nothing
*)

(* typed spans
(4,22)-(4,29)
*)

(* correct types
int list
*)

(* bad types
int
*)
