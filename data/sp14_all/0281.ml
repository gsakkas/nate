
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (listReverse digitsOfInt (n / 10));;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (listReverse (digitsOfInt (n / 10)));;

*)

(* changed spans
(6,39)-(6,73)
listReverse (digitsOfInt (n / 10))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (6,39)-(6,75)) (Var (Just (6,40)-(6,51)) "listReverse") [App (Just (6,52)-(6,74)) (Var (Just (6,53)-(6,64)) "digitsOfInt") [Bop (Just (6,65)-(6,73)) Div (Var (Just (6,66)-(6,67)) "n") (Lit (Just (6,70)-(6,72)) (LI 10))]]
*)

(* typed spans
(6,39)-(6,75)
*)

(* correct types
int list
*)

(* bad types
int list
*)
