
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let n2 = [n mod 10] @ ((digitsOfInt n) / 10) in listReverse n2);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let n2 = [n mod 10] @ (digitsOfInt (n / 10)) in listReverse n2);;

*)

(* changed spans
(8,30)-(8,52)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (8,30)-(8,52)) (Var (Just (8,31)-(8,42)) "digitsOfInt") [Bop (Just (8,43)-(8,51)) Div (Var (Just (8,44)-(8,45)) "n") (Lit (Just (8,48)-(8,50)) (LI 10))]
*)

(* typed spans
(8,30)-(8,52)
*)

(* correct types
int list
*)

(* bad types
int
*)
