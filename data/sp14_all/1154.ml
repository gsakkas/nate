
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let a = n / 10 in
     let b = n mod 10 in let c = [a; b] in if a > 9 then (digitsOfInt a) :: c);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let a = n / 10 in
     let b = n mod 10 in
     let c = [a; b] in if a < 10 then c else digitsOfInt (a / 10));;

*)

(* changed spans
(7,46)-(7,51)
a < 10
BopG VarG LitG

(7,57)-(7,72)
c
VarG

(7,70)-(7,71)
a / 10
BopG VarG LitG

(7,43)-(7,77)
10
LitG

*)

(* changed exprs
Bop (Just (8,26)-(8,32)) Lt (Var (Just (8,26)-(8,27)) "a") (Lit (Just (8,30)-(8,32)) (LI 10))
Var (Just (8,38)-(8,39)) "c"
Bop (Just (8,57)-(8,65)) Div (Var (Just (8,58)-(8,59)) "a") (Lit (Just (8,62)-(8,64)) (LI 10))
Lit (Just (8,62)-(8,64)) (LI 10)
*)

(* typed spans
(8,26)-(8,32)
(8,38)-(8,39)
(8,57)-(8,65)
(8,62)-(8,64)
*)

(* correct types
bool
int list
int
int
*)

(* bad types
bool
int
int
unit
*)
