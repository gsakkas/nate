
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if n >= 10
  then let n = digitsOfInt n
       and f = sumList n in digitalRoot n
  else n;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec helper n = let n = digitsOfInt n in sumList n;;

let rec digitalRoot n = if n < 10 then n else helper n;;

*)

(* changed spans
(11,2)-(14,8)
let n = digitsOfInt n in
sumList n
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(13,40)-(13,41)
fun n ->
  if n < 10 then n else helper n
LamG (IteG EmptyG EmptyG EmptyG)

(14,7)-(14,8)
10
LitG

*)

(* changed exprs
Let (Just (10,19)-(10,53)) NonRec [(VarPat (Just (10,23)-(10,24)) "n",App (Just (10,27)-(10,40)) (Var (Just (10,27)-(10,38)) "digitsOfInt") [Var (Just (10,39)-(10,40)) "n"])] (App (Just (10,44)-(10,53)) (Var (Just (10,44)-(10,51)) "sumList") [Var (Just (10,52)-(10,53)) "n"])
Lam (Just (12,20)-(12,54)) (VarPat (Just (12,20)-(12,21)) "n") (Ite (Just (12,24)-(12,54)) (Bop (Just (12,27)-(12,33)) Lt (Var (Just (12,27)-(12,28)) "n") (Lit (Just (12,31)-(12,33)) (LI 10))) (Var (Just (12,39)-(12,40)) "n") (App (Just (12,46)-(12,54)) (Var (Just (12,46)-(12,52)) "helper") [Var (Just (12,53)-(12,54)) "n"])) Nothing
Lit (Just (12,31)-(12,33)) (LI 10)
*)

(* typed spans
(10,19)-(10,53)
(12,20)-(12,54)
(12,31)-(12,33)
*)

(* correct types
int
int -> int
int
*)

(* bad types
int
int list
int
*)
