
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append digitsOfInt (n / 10) [n mod 10];;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,26)-(5,64)
append (digitsOfInt (n / 10))
       [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (5,26)-(5,66)) (Var (Just (5,26)-(5,32)) "append") [App (Just (5,33)-(5,55)) (Var (Just (5,34)-(5,45)) "digitsOfInt") [Bop (Just (5,46)-(5,54)) Div (Var (Just (5,47)-(5,48)) "n") (Lit (Just (5,51)-(5,53)) (LI 10))],List (Just (5,56)-(5,66)) [Bop (Just (5,57)-(5,65)) Mod (Var (Just (5,57)-(5,58)) "n") (Lit (Just (5,63)-(5,65)) (LI 10))] Nothing]
*)

(* typed spans
(5,26)-(5,66)
*)

(* correct types
int list
*)

(* bad types
int list
*)
