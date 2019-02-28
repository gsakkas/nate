
let padZero l1 l2 =
  let length_diff = (List.length l1) - (List.length l2) in
  if length_diff < 0
  then length_diff = ((List.length l1) - (List.length l2))
  else length_diff;;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

*)

(* changed spans
(2,12)-(6,18)
fun x ->
  fun n ->
    if n > 0
    then x :: (clone x (n - 1))
    else []
LamG (LamG EmptyG)

(3,2)-(6,18)
if List.length l1 < List.length l2
then (List.append (clone 0
                         (List.length l2 - List.length l1))
                  l1 , l2)
else (l1 , List.append (clone 0
                              (List.length l1 - List.length l2))
                       l2)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (2,14)-(2,64)) (VarPat (Just (2,14)-(2,15)) "x") (Lam (Just (2,16)-(2,64)) (VarPat (Just (2,16)-(2,17)) "n") (Ite (Just (2,20)-(2,64)) (Bop (Just (2,23)-(2,28)) Gt (Var (Just (2,23)-(2,24)) "n") (Lit (Just (2,27)-(2,28)) (LI 0))) (ConApp (Just (2,34)-(2,56)) "::" (Just (Tuple (Just (2,34)-(2,56)) [Var (Just (2,34)-(2,35)) "x",App (Just (2,39)-(2,56)) (Var (Just (2,40)-(2,45)) "clone") [Var (Just (2,46)-(2,47)) "x",Bop (Just (2,48)-(2,55)) Minus (Var (Just (2,49)-(2,50)) "n") (Lit (Just (2,53)-(2,54)) (LI 1))]])) Nothing) (List (Just (2,62)-(2,64)) [] Nothing)) Nothing) Nothing
Ite (Just (5,2)-(7,77)) (Bop (Just (5,5)-(5,40)) Lt (App (Just (5,5)-(5,21)) (Var (Just (5,6)-(5,17)) "List.length") [Var (Just (5,18)-(5,20)) "l1"]) (App (Just (5,24)-(5,40)) (Var (Just (5,25)-(5,36)) "List.length") [Var (Just (5,37)-(5,39)) "l2"])) (Tuple (Just (6,7)-(6,77)) [App (Just (6,8)-(6,72)) (Var (Just (6,9)-(6,20)) "List.append") [App (Just (6,21)-(6,68)) (Var (Just (6,22)-(6,27)) "clone") [Lit (Just (6,28)-(6,29)) (LI 0),Bop (Just (6,30)-(6,67)) Minus (App (Just (6,31)-(6,47)) (Var (Just (6,32)-(6,43)) "List.length") [Var (Just (6,44)-(6,46)) "l2"]) (App (Just (6,50)-(6,66)) (Var (Just (6,51)-(6,62)) "List.length") [Var (Just (6,63)-(6,65)) "l1"])],Var (Just (6,69)-(6,71)) "l1"],Var (Just (6,74)-(6,76)) "l2"]) (Tuple (Just (7,7)-(7,77)) [Var (Just (7,8)-(7,10)) "l1",App (Just (7,12)-(7,76)) (Var (Just (7,13)-(7,24)) "List.append") [App (Just (7,25)-(7,72)) (Var (Just (7,26)-(7,31)) "clone") [Lit (Just (7,32)-(7,33)) (LI 0),Bop (Just (7,34)-(7,71)) Minus (App (Just (7,35)-(7,51)) (Var (Just (7,36)-(7,47)) "List.length") [Var (Just (7,48)-(7,50)) "l1"]) (App (Just (7,54)-(7,70)) (Var (Just (7,55)-(7,66)) "List.length") [Var (Just (7,67)-(7,69)) "l2"])],Var (Just (7,73)-(7,75)) "l2"]])
*)

(* typed spans
(2,14)-(2,64)
(5,2)-(7,77)
*)

(* correct types
int -> int -> int list
(int list * int list)
*)

(* bad types
'a list -> 'b list -> int
int
*)
