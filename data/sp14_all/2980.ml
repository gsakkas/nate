
let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec digitsOfInt n =
  if n >= 10 then (n / (help n 1)) :: (digitsOfInt (n / 10)) else [n];;


(* fix

let rec helpFac a b = if (10 * a) > b then a else helpFac (10 * a) b;;

let rec digitsOfInt n =
  if n >= 10 then (n / (helpFac n 1)) :: (digitsOfInt (n / 10)) else [n];;

*)

(* changed spans
(2,13)-(2,66)
fun a ->
  fun b ->
    if (10 * a) > b
    then a
    else helpFac (10 * a) b
LamG (LamG EmptyG)

(5,24)-(5,28)
helpFac
VarG

*)

(* changed exprs
Lam (Just (2,16)-(2,68)) (VarPat (Just (2,16)-(2,17)) "a") (Lam (Just (2,18)-(2,68)) (VarPat (Just (2,18)-(2,19)) "b") (Ite (Just (2,22)-(2,68)) (Bop (Just (2,25)-(2,37)) Gt (Bop (Just (2,25)-(2,33)) Times (Lit (Just (2,26)-(2,28)) (LI 10)) (Var (Just (2,31)-(2,32)) "a")) (Var (Just (2,36)-(2,37)) "b")) (Var (Just (2,43)-(2,44)) "a") (App (Just (2,50)-(2,68)) (Var (Just (2,50)-(2,57)) "helpFac") [Bop (Just (2,58)-(2,66)) Times (Lit (Just (2,59)-(2,61)) (LI 10)) (Var (Just (2,64)-(2,65)) "a"),Var (Just (2,67)-(2,68)) "b"])) Nothing) Nothing
Var (Just (5,24)-(5,31)) "helpFac"
*)

(* typed spans
(2,16)-(2,68)
(5,24)-(5,31)
*)

(* correct types
int -> int -> int
int -> int -> int
*)

(* bad types
int -> int
int -> int
*)
