
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2)) List.combine (padZero [9; 9] [1; 0; 0; 2]);;


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
(14,16)-(14,24)
EMPTY
EmptyG

(14,16)-(14,44)
EMPTY
EmptyG

(14,25)-(14,44)
match a with
| (list1 , list2) -> match list1 with
                     | [] -> match x with
                             | (h1 , h2) -> ((h1 + h2) :: list1 , list2)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(15,4)-(17,51)
match list1 with
| [] -> match x with
        | (h1 , h2) -> ((h1 + h2) :: list1 , list2)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(15,15)-(15,23)
EMPTY
EmptyG

(15,15)-(15,43)
EMPTY
EmptyG

(15,24)-(15,43)
([] , [])
TupleG (fromList [ListG EmptyG Nothing])

(16,4)-(17,51)
[]
ListG EmptyG Nothing

(16,15)-(16,23)
EMPTY
EmptyG

(16,15)-(16,43)
EMPTY
EmptyG

(16,24)-(16,43)
List.combine l1 l2
AppG (fromList [VarG])

(17,4)-(17,51)
l2
VarG

(18,2)-(18,77)
removeZero (add (padZero l1
                         l2))
AppG (fromList [AppG (fromList [EmptyG])])

(18,35)-(18,47)
EMPTY
EmptyG

(18,48)-(18,77)
EMPTY
EmptyG

(18,49)-(18,56)
EMPTY
EmptyG

(18,57)-(18,63)
EMPTY
EmptyG

(18,58)-(18,59)
EMPTY
EmptyG

(18,61)-(18,62)
EMPTY
EmptyG

(18,64)-(18,76)
EMPTY
EmptyG

(18,65)-(18,66)
EMPTY
EmptyG

(18,68)-(18,69)
EMPTY
EmptyG

(18,71)-(18,72)
EMPTY
EmptyG

(18,74)-(18,75)
EMPTY
EmptyG

*)
