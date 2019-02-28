
let rec add current next =
  match current with | [] -> [next] | front::back -> front (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;


(* fix

let rec add current next =
  match current with | [] -> [next] | front::back -> front :: (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;

*)

(* changed spans
(3,53)-(3,74)
front :: (add back next)
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG])])))

*)

(* changed exprs
ConApp (Just (3,53)-(3,77)) "::" (Just (Tuple (Just (3,53)-(3,77)) [Var (Just (3,53)-(3,58)) "front",App (Just (3,62)-(3,77)) (Var (Just (3,63)-(3,66)) "add") [Var (Just (3,67)-(3,71)) "back",Var (Just (3,72)-(3,76)) "next"]])) Nothing
*)

(* typed spans
(3,53)-(3,77)
*)

(* correct types
int list
*)

(* bad types
int list
*)
