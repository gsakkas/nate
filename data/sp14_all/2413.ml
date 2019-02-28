
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: ((prod / 10) + (mulByDigit i t)) :: t
      else prod :: t;;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: (prod / 10) :: (mulByDigit i t)
      else prod :: t;;

*)

(* changed spans
(8,28)-(8,60)
prod / 10
BopG VarG LitG

(8,28)-(8,60)
mulByDigit i t
AppG (fromList [VarG])

(8,28)-(8,60)
mulByDigit
VarG

(8,28)-(8,60)
i
VarG

(8,28)-(8,60)
t
VarG

*)

(* changed exprs
Bop (Just (8,28)-(8,39)) Div (Var (Just (8,29)-(8,33)) "prod") (Lit (Just (8,36)-(8,38)) (LI 10))
App (Just (8,43)-(8,59)) (Var (Just (8,44)-(8,54)) "mulByDigit") [Var (Just (8,55)-(8,56)) "i",Var (Just (8,57)-(8,58)) "t"]
Var (Just (8,44)-(8,54)) "mulByDigit"
Var (Just (8,55)-(8,56)) "i"
Var (Just (8,57)-(8,58)) "t"
*)

(* typed spans
(8,28)-(8,39)
(8,43)-(8,59)
(8,44)-(8,54)
(8,55)-(8,56)
(8,57)-(8,58)
*)

(* correct types
int
int list
int -> int list -> int list
int
int list
*)

(* bad types
int
int
int
int
int
*)
