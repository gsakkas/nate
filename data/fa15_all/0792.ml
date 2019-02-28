
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n = if n <= 0 then [n] else append digitsOfInt (n / 10);;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(4,55)-(4,66)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (5,33)-(5,55)) (Var (Just (5,34)-(5,45)) "digitsOfInt") [Bop (Just (5,46)-(5,54)) Div (Var (Just (5,47)-(5,48)) "n") (Lit (Just (5,51)-(5,53)) (LI 10))]
*)

(* typed spans
(5,33)-(5,55)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
