
let rec append l r = match l with | [] -> [r] | h::t -> h :: (append t r);;

let rec digitsOfInt n = if n <= 0 then [n] else append digitsOfInt (n / 10);;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(2,42)-(2,45)
r
VarG

(4,48)-(4,54)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(4,72)-(4,74)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
Var (Just (2,42)-(2,43)) "r"
App (Just (5,33)-(5,55)) (Var (Just (5,34)-(5,45)) "digitsOfInt") [Bop (Just (5,46)-(5,54)) Div (Var (Just (5,47)-(5,48)) "n") (Lit (Just (5,51)-(5,53)) (LI 10))]
List (Just (5,56)-(5,66)) [Bop (Just (5,57)-(5,65)) Mod (Var (Just (5,57)-(5,58)) "n") (Lit (Just (5,63)-(5,65)) (LI 10))] Nothing
*)

(* typed spans
(2,42)-(2,43)
(5,33)-(5,55)
(5,56)-(5,66)
*)

(* correct types
int list
int list
int list
*)

(* bad types
int list
int list -> int -> int list
int
*)
