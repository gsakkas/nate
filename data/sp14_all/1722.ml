
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (listReverse digitsOfInt (n / 10));;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else (listReverse [n mod 10]) @ (digitsOfInt (n / 10));;

*)

(* changed spans
(6,25)-(6,35)
listReverse [n mod 10]
AppG (fromList [ListG EmptyG])

(6,38)-(6,72)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (6,25)-(6,49)) (Var (Just (6,26)-(6,37)) "listReverse") [List (Just (6,38)-(6,48)) [Bop (Just (6,39)-(6,47)) Mod (Var (Just (6,39)-(6,40)) "n") (Lit (Just (6,45)-(6,47)) (LI 10))] Nothing]
App (Just (6,52)-(6,74)) (Var (Just (6,53)-(6,64)) "digitsOfInt") [Bop (Just (6,65)-(6,73)) Div (Var (Just (6,66)-(6,67)) "n") (Lit (Just (6,70)-(6,72)) (LI 10))]
*)

(* typed spans
(6,25)-(6,49)
(6,52)-(6,74)
*)

(* correct types
int list
int list
*)

(* bad types
int list
int list
*)
