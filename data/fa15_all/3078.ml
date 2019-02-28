
let rec digitsOfInt n =
  let sumL = [] in if (n / 10) > 0 then (n mod 10) :: sumL;;


(* fix

let rec digitsOfIntHelper (num,numList) =
  if num < 10
  then num :: numList
  else digitsOfIntHelper ((num / 10), ((num mod 10) :: numList));;

let rec digitsOfInt n = if n < 10 then [n] else digitsOfIntHelper (n, []);;

*)

(* changed spans
(2,20)-(3,58)
fun (num , numList) ->
  if num < 10
  then num :: numList
  else digitsOfIntHelper (num / 10 , (num mod 10) :: numList)
LamG (IteG EmptyG EmptyG EmptyG)

(3,41)-(3,42)
fun n ->
  if n < 10
  then [n]
  else digitsOfIntHelper (n , [])
LamG (IteG EmptyG EmptyG EmptyG)

(3,19)-(3,58)
[n]
ListG VarG

*)

(* changed exprs
Lam (Just (2,27)-(5,64)) (TuplePat (Just (2,27)-(2,38)) [VarPat (Just (2,27)-(2,30)) "num",VarPat (Just (2,31)-(2,38)) "numList"]) (Ite (Just (3,2)-(5,64)) (Bop (Just (3,5)-(3,13)) Lt (Var (Just (3,5)-(3,8)) "num") (Lit (Just (3,11)-(3,13)) (LI 10))) (ConApp (Just (4,7)-(4,21)) "::" (Just (Tuple (Just (4,7)-(4,21)) [Var (Just (4,7)-(4,10)) "num",Var (Just (4,14)-(4,21)) "numList"])) Nothing) (App (Just (5,7)-(5,64)) (Var (Just (5,7)-(5,24)) "digitsOfIntHelper") [Tuple (Just (5,25)-(5,64)) [Bop (Just (5,26)-(5,36)) Div (Var (Just (5,27)-(5,30)) "num") (Lit (Just (5,33)-(5,35)) (LI 10)),ConApp (Just (5,38)-(5,63)) "::" (Just (Tuple (Just (5,39)-(5,62)) [Bop (Just (5,39)-(5,51)) Mod (Var (Just (5,40)-(5,43)) "num") (Lit (Just (5,48)-(5,50)) (LI 10)),Var (Just (5,55)-(5,62)) "numList"])) Nothing]])) Nothing
Lam (Just (7,20)-(7,73)) (VarPat (Just (7,20)-(7,21)) "n") (Ite (Just (7,24)-(7,73)) (Bop (Just (7,27)-(7,33)) Lt (Var (Just (7,27)-(7,28)) "n") (Lit (Just (7,31)-(7,33)) (LI 10))) (List (Just (7,39)-(7,42)) [Var (Just (7,40)-(7,41)) "n"] Nothing) (App (Just (7,48)-(7,73)) (Var (Just (7,48)-(7,65)) "digitsOfIntHelper") [Tuple (Just (7,66)-(7,73)) [Var (Just (7,67)-(7,68)) "n",List (Just (7,70)-(7,72)) [] Nothing]])) Nothing
List (Just (7,39)-(7,42)) [Var (Just (7,40)-(7,41)) "n"] Nothing
*)

(* typed spans
(2,27)-(5,64)
(7,20)-(7,73)
(7,39)-(7,42)
*)

(* correct types
(int * int list) -> int list
int -> int list
int list
*)

(* bad types
int -> unit
int
unit
*)
