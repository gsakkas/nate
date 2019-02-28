
let rec clone x n = failwith "to be implemented";;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

*)

(* changed spans
(2,20)-(2,48)
if n > 0
then x :: (clone x (n - 1))
else []
IteG (BopG EmptyG EmptyG) (ConAppG (Just EmptyG)) (ListG EmptyG)

(5,2)-(6,77)
(List.append (clone 0
                    (List.length l2 - List.length l1))
             l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Ite (Just (2,20)-(2,64)) (Bop (Just (2,23)-(2,28)) Gt (Var (Just (2,23)-(2,24)) "n") (Lit (Just (2,27)-(2,28)) (LI 0))) (ConApp (Just (2,34)-(2,56)) "::" (Just (Tuple (Just (2,34)-(2,56)) [Var (Just (2,34)-(2,35)) "x",App (Just (2,39)-(2,56)) (Var (Just (2,40)-(2,45)) "clone") [Var (Just (2,46)-(2,47)) "x",Bop (Just (2,48)-(2,55)) Minus (Var (Just (2,49)-(2,50)) "n") (Lit (Just (2,53)-(2,54)) (LI 1))]])) Nothing) (List (Just (2,62)-(2,64)) [] Nothing)
Tuple (Just (7,7)-(7,77)) [App (Just (7,8)-(7,72)) (Var (Just (7,9)-(7,20)) "List.append") [App (Just (7,21)-(7,68)) (Var (Just (7,22)-(7,27)) "clone") [Lit (Just (7,28)-(7,29)) (LI 0),Bop (Just (7,30)-(7,67)) Minus (App (Just (7,31)-(7,47)) (Var (Just (7,32)-(7,43)) "List.length") [Var (Just (7,44)-(7,46)) "l2"]) (App (Just (7,50)-(7,66)) (Var (Just (7,51)-(7,62)) "List.length") [Var (Just (7,63)-(7,65)) "l1"])],Var (Just (7,69)-(7,71)) "l1"],Var (Just (7,74)-(7,76)) "l2"]
*)

(* typed spans
(2,20)-(2,64)
(7,7)-(7,77)
*)

(* correct types
int list
(int list * int list)
*)

(* bad types
'a list
unit
*)
