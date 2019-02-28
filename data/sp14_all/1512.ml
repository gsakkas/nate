
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> l1 :: ((clone 0 ((List.length l1) - (List.length l2))) @ l2)
  | false  -> ((clone 0 ((List.length l2) - (List.length l1))) @ [l1]) :: l2;;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

*)

(* changed spans
(11,13)-(11,73)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(12,14)-(12,76)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (11,13)-(11,73)) [Var (Just (11,14)-(11,16)) "l1",App (Just (11,18)-(11,72)) (Var (Just (11,67)-(11,68)) "@") [App (Just (11,19)-(11,66)) (Var (Just (11,20)-(11,25)) "clone") [Lit (Just (11,26)-(11,27)) (LI 0),Bop (Just (11,28)-(11,65)) Minus (App (Just (11,29)-(11,45)) (Var (Just (11,30)-(11,41)) "List.length") [Var (Just (11,42)-(11,44)) "l1"]) (App (Just (11,48)-(11,64)) (Var (Just (11,49)-(11,60)) "List.length") [Var (Just (11,61)-(11,63)) "l2"])],Var (Just (11,69)-(11,71)) "l2"]]
Tuple (Just (12,14)-(12,74)) [App (Just (12,15)-(12,69)) (Var (Just (12,64)-(12,65)) "@") [App (Just (12,16)-(12,63)) (Var (Just (12,17)-(12,22)) "clone") [Lit (Just (12,23)-(12,24)) (LI 0),Bop (Just (12,25)-(12,62)) Minus (App (Just (12,26)-(12,42)) (Var (Just (12,27)-(12,38)) "List.length") [Var (Just (12,39)-(12,41)) "l2"]) (App (Just (12,45)-(12,61)) (Var (Just (12,46)-(12,57)) "List.length") [Var (Just (12,58)-(12,60)) "l1"])],Var (Just (12,66)-(12,68)) "l1"],Var (Just (12,71)-(12,73)) "l2"]
*)

(* typed spans
(11,13)-(11,73)
(12,14)-(12,74)
*)

(* correct types
(int list * int list)
(int list * int list)
*)

(* bad types
'a list list
int list
*)
