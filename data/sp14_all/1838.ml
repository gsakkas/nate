
let rec digitsOfInt n =
  let rec helper x =
    match x with | 0 -> [] | n -> (n mod 10) @ (helper (n / 10)) in
  helper n;;


(* fix

let rec digitsOfInt n =
  let rec helper x =
    match x with | 0 -> [] | n -> (n mod 10) :: (helper (n / 10)) in
  helper n;;

*)

(* changed spans
(4,34)-(4,64)
(n mod 10) :: (helper (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG])))

*)

(* changed exprs
ConApp (Just (4,34)-(4,65)) "::" (Just (Tuple (Just (4,34)-(4,65)) [Bop (Just (4,34)-(4,44)) Mod (Var (Just (4,35)-(4,36)) "n") (Lit (Just (4,41)-(4,43)) (LI 10)),App (Just (4,48)-(4,65)) (Var (Just (4,49)-(4,55)) "helper") [Bop (Just (4,56)-(4,64)) Div (Var (Just (4,57)-(4,58)) "n") (Lit (Just (4,61)-(4,63)) (LI 10))]])) Nothing
*)

(* typed spans
(4,34)-(4,65)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
