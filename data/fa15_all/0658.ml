
let rec add current next =
  match current with | [] -> [next] | front::back -> front (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) [n mod 10];;


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

(6,52)-(6,62)
n mod 10
BopG VarG LitG

(6,52)-(6,62)
n
VarG

(6,52)-(6,62)
10
LitG

*)

(* changed exprs
ConApp (Just (3,53)-(3,77)) "::" (Just (Tuple (Just (3,53)-(3,77)) [Var (Just (3,53)-(3,58)) "front",App (Just (3,62)-(3,77)) (Var (Just (3,63)-(3,66)) "add") [Var (Just (3,67)-(3,71)) "back",Var (Just (3,72)-(3,76)) "next"]])) Nothing
Bop (Just (6,52)-(6,62)) Mod (Var (Just (6,53)-(6,54)) "n") (Lit (Just (6,59)-(6,61)) (LI 10))
Var (Just (6,53)-(6,54)) "n"
Lit (Just (6,59)-(6,61)) (LI 10)
*)

(* typed spans
(3,53)-(3,77)
(6,52)-(6,62)
(6,53)-(6,54)
(6,59)-(6,61)
*)

(* correct types
int list
int
int
int
*)

(* bad types
int list list
int list
int list
int list
*)
