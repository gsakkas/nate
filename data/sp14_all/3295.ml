
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
          (match a with | (list1,list2) -> ((list1 @ v1), (list2 @ v2))) in
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
          (match a with | (list1,list2) -> ((v1 :: list1), (v2 :: list2))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,44)-(17,56)
v1 :: list1
ConAppG (Just (TupleG (fromList [VarG])))

(17,67)-(17,69)
v2 :: list2
ConAppG (Just (TupleG (fromList [VarG])))

(18,4)-(20,51)
list2
VarG

*)

(* changed exprs
ConApp (Just (17,44)-(17,57)) "::" (Just (Tuple (Just (17,45)-(17,56)) [Var (Just (17,45)-(17,47)) "v1",Var (Just (17,51)-(17,56)) "list1"])) Nothing
ConApp (Just (17,59)-(17,72)) "::" (Just (Tuple (Just (17,60)-(17,71)) [Var (Just (17,60)-(17,62)) "v2",Var (Just (17,66)-(17,71)) "list2"])) Nothing
Var (Just (17,66)-(17,71)) "list2"
*)

(* typed spans
(17,44)-(17,57)
(17,59)-(17,72)
(17,66)-(17,71)
*)

(* correct types
int list
int list
int list
*)

(* bad types
'a list
'a list
'a list
*)
