
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else ((listReverse n) mod 10) :: (listReverse (digitsOfInt (n / 10)));;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (listReverse (digitsOfInt (n / 10)));;

*)

(* changed spans
(8,8)-(8,23)
n
VarG

*)

(* changed exprs
Var (Just (6,26)-(6,27)) "n"
*)

(* typed spans
(6,26)-(6,27)
*)

(* correct types
int
*)

(* bad types
int
*)
