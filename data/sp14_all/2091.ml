
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = clone List.hd l1 ((List.length l1) - (List.length l2)) in
       (y, l2))
    else
      (let z = clone List.hd l2 ((List.length l2) - (List.length l1)) in
       (z, l1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = clone (List.hd l1) ((List.length l1) - (List.length l2)) in
       (y, l2))
    else
      (let z = clone (List.hd l2) ((List.length l2) - (List.length l1)) in
       (z, l1));;

*)

(* changed spans
(10,15)-(10,69)
clone (List.hd l1)
      (List.length l1 - List.length l2)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(13,15)-(13,69)
clone (List.hd l2)
      (List.length l2 - List.length l1)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (10,15)-(10,71)) (Var (Just (10,15)-(10,20)) "clone") [App (Just (10,21)-(10,33)) (Var (Just (10,22)-(10,29)) "List.hd") [Var (Just (10,30)-(10,32)) "l1"],Bop (Just (10,34)-(10,71)) Minus (App (Just (10,35)-(10,51)) (Var (Just (10,36)-(10,47)) "List.length") [Var (Just (10,48)-(10,50)) "l1"]) (App (Just (10,54)-(10,70)) (Var (Just (10,55)-(10,66)) "List.length") [Var (Just (10,67)-(10,69)) "l2"])]
App (Just (13,15)-(13,71)) (Var (Just (13,15)-(13,20)) "clone") [App (Just (13,21)-(13,33)) (Var (Just (13,22)-(13,29)) "List.hd") [Var (Just (13,30)-(13,32)) "l2"],Bop (Just (13,34)-(13,71)) Minus (App (Just (13,35)-(13,51)) (Var (Just (13,36)-(13,47)) "List.length") [Var (Just (13,48)-(13,50)) "l2"]) (App (Just (13,54)-(13,70)) (Var (Just (13,55)-(13,66)) "List.length") [Var (Just (13,67)-(13,69)) "l1"])]
*)

(* typed spans
(10,15)-(10,71)
(13,15)-(13,71)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list
'a list
*)
