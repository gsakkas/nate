
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (h1,h2) -> ((h1 + h2), a) in
    let base = [] in
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
      match a with
      | (list1,list2) ->
          (match list1 with
           | [] -> (match x with | (h1,h2) -> (((h1 + h2) :: list1), list2))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,16)-(14,56)
match a with
| (list1 , list2) -> match list1 with
                     | [] -> match x with
                             | (h1 , h2) -> ((h1 + h2) :: list1 , list2)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(15,15)-(15,17)
([] , [])
TupleG (fromList [ListG EmptyG])

(16,4)-(17,51)
[]
ListG EmptyG

*)

(* changed exprs
Case (Just (15,6)-(18,77)) (Var (Just (15,12)-(15,13)) "a") [(TuplePat (Just (16,9)-(16,20)) [VarPat (Just (16,9)-(16,14)) "list1",VarPat (Just (16,15)-(16,20)) "list2"],Nothing,Case (Just (17,10)-(18,77)) (Var (Just (17,17)-(17,22)) "list1") [(ConPat (Just (18,13)-(18,15)) "[]" Nothing,Nothing,Case (Just (18,19)-(18,76)) (Var (Just (18,26)-(18,27)) "x") [(TuplePat (Just (18,36)-(18,41)) [VarPat (Just (18,36)-(18,38)) "h1",VarPat (Just (18,39)-(18,41)) "h2"],Nothing,Tuple (Just (18,46)-(18,75)) [ConApp (Just (18,47)-(18,67)) "::" (Just (Tuple (Just (18,48)-(18,66)) [Bop (Just (18,48)-(18,57)) Plus (Var (Just (18,49)-(18,51)) "h1") (Var (Just (18,54)-(18,56)) "h2"),Var (Just (18,61)-(18,66)) "list1"])) Nothing,Var (Just (18,69)-(18,74)) "list2"])])])]
Tuple (Just (19,15)-(19,23)) [List (Just (19,16)-(19,18)) [] Nothing,List (Just (19,20)-(19,22)) [] Nothing]
List (Just (19,20)-(19,22)) [] Nothing
*)

(* typed spans
(15,6)-(18,77)
(19,15)-(19,23)
(19,20)-(19,22)
*)

(* correct types
(int list * int list)
(int list * int list)
int list
*)

(* bad types
(int * 'a)
'a list
int list
*)
