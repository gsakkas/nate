
let modulus ss = ss mod 10;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | x -> (digitsOfInt (n / 10)) @ [modulus x]);;

let lt10 q = q < 10;;

let rec additivePersistence n = if lt10 n then n else 55 :: (digitsOfInt n);;


(* fix

let incre i = i + 1;;

let lt10 q = q < 10;;

let rec additivePersistence n =
  if lt10 n then n else (match n with | n -> incre n);;

*)

(* changed spans
(4,20)-(7,65)
fun i -> i + 1
LamG (BopG EmptyG EmptyG)

(11,54)-(11,75)
match n with
| n -> incre n
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Lam (Just (2,10)-(2,19)) (VarPat (Just (2,10)-(2,11)) "i") (Bop (Just (2,14)-(2,19)) Plus (Var (Just (2,14)-(2,15)) "i") (Lit (Just (2,18)-(2,19)) (LI 1))) Nothing
Case (Just (7,24)-(7,53)) (Var (Just (7,31)-(7,32)) "n") [(VarPat (Just (7,40)-(7,41)) "n",Nothing,App (Just (7,45)-(7,52)) (Var (Just (7,45)-(7,50)) "incre") [Var (Just (7,51)-(7,52)) "n"])]
*)

(* typed spans
(2,10)-(2,19)
(7,24)-(7,53)
*)

(* correct types
int -> int
int
*)

(* bad types
int -> int list
int list
*)
