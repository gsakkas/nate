
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (v1,v2) -> ((v1 :: a), (v2 :: a)) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (h1::t1,h2::t2) -> ((v1 :: h1 :: t1), (v2 :: h2 :: t2))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,42)-(14,64)
match a with
| (h1 :: t1 , h2 :: t2) -> (v1 :: (h1 :: t1) , v2 :: (h2 :: t2))
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (17,10)-(18,69)) (Var (Just (17,17)-(17,18)) "a") [(TuplePat (Just (18,14)-(18,27)) [ConsPat (Just (18,14)-(18,20)) (VarPat (Just (18,14)-(18,16)) "h1") (VarPat (Just (18,18)-(18,20)) "t1"),ConsPat (Just (18,21)-(18,27)) (VarPat (Just (18,21)-(18,23)) "h2") (VarPat (Just (18,25)-(18,27)) "t2")],Nothing,Tuple (Just (18,32)-(18,68)) [ConApp (Just (18,33)-(18,49)) "::" (Just (Tuple (Just (18,34)-(18,48)) [Var (Just (18,34)-(18,36)) "v1",ConApp (Just (18,40)-(18,48)) "::" (Just (Tuple (Just (18,40)-(18,48)) [Var (Just (18,40)-(18,42)) "h1",Var (Just (18,46)-(18,48)) "t1"])) Nothing])) Nothing,ConApp (Just (18,51)-(18,67)) "::" (Just (Tuple (Just (18,52)-(18,66)) [Var (Just (18,52)-(18,54)) "v2",ConApp (Just (18,58)-(18,66)) "::" (Just (Tuple (Just (18,58)-(18,66)) [Var (Just (18,58)-(18,60)) "h2",Var (Just (18,64)-(18,66)) "t2"])) Nothing])) Nothing])]
*)

(* typed spans
(17,10)-(18,69)
*)

(* correct types
(int list * int list)
*)

(* bad types
('a list * 'a list)
*)
