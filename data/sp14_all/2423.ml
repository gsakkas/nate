
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: [prod / 10] :: (mulByDigit i t)
      else (prod mod 10) :: t;;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: (prod / 10) :: (mulByDigit i t)
      else (prod mod 10) :: t;;

*)

(* changed spans
(8,28)-(8,39)
prod / 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (8,28)-(8,39)) Div (Var (Just (8,29)-(8,33)) "prod") (Lit (Just (8,36)-(8,38)) (LI 10))
*)

(* typed spans
(8,28)-(8,39)
*)

(* correct types
int
*)

(* bad types
int list
*)
