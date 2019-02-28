
let rec clone x n = match n with | 0 -> [] | h::t -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,20)-(2,75)
if n < 1
then []
else x :: (clone x (n - 1))
IteG (BopG EmptyG EmptyG) (ListG EmptyG) (ConAppG (Just EmptyG))

*)

(* changed exprs
Ite (Just (2,20)-(2,64)) (Bop (Just (2,23)-(2,28)) Lt (Var (Just (2,23)-(2,24)) "n") (Lit (Just (2,27)-(2,28)) (LI 1))) (List (Just (2,34)-(2,36)) [] Nothing) (ConApp (Just (2,42)-(2,64)) "::" (Just (Tuple (Just (2,42)-(2,64)) [Var (Just (2,42)-(2,43)) "x",App (Just (2,47)-(2,64)) (Var (Just (2,48)-(2,53)) "clone") [Var (Just (2,54)-(2,55)) "x",Bop (Just (2,56)-(2,63)) Minus (Var (Just (2,57)-(2,58)) "n") (Lit (Just (2,61)-(2,62)) (LI 1))]])) Nothing)
*)

(* typed spans
(2,20)-(2,64)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
