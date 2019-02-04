
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
      | (lh1::lt1,lh2::lt2) ->
          (match x with
           | (h1,h2) ->
               (match h1 with
                | x::y ->
                    (match h2 with
                     | a::b ->
                         (((((x + a) + lh1) / 10) :: lt1),
                           ((((x + a) + lh1) mod 10) :: lt2))))) in
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
    let f a x = match x with | (v1,v2) -> ([v1], [v2]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,6)-(24,64)
EMPTY
EmptyG

(15,12)-(15,13)
EMPTY
EmptyG

(17,10)-(24,64)
match x with
| (v1 , v2) -> ([v1] , [v2])
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(19,15)-(24,63)
EMPTY
EmptyG

(19,22)-(19,24)
EMPTY
EmptyG

(21,20)-(24,62)
EMPTY
EmptyG

(21,27)-(21,29)
EMPTY
EmptyG

(23,26)-(23,57)
EMPTY
EmptyG

(23,27)-(23,49)
EMPTY
EmptyG

(23,28)-(23,43)
EMPTY
EmptyG

(23,29)-(23,36)
EMPTY
EmptyG

(23,30)-(23,31)
EMPTY
EmptyG

(23,34)-(23,35)
EMPTY
EmptyG

(23,39)-(23,42)
EMPTY
EmptyG

(23,46)-(23,48)
EMPTY
EmptyG

(23,53)-(23,56)
EMPTY
EmptyG

(24,27)-(24,60)
EMPTY
EmptyG

(24,28)-(24,52)
EMPTY
EmptyG

(24,29)-(24,44)
EMPTY
EmptyG

(24,30)-(24,37)
EMPTY
EmptyG

(24,31)-(24,32)
EMPTY
EmptyG

(24,35)-(24,36)
EMPTY
EmptyG

(24,40)-(24,43)
EMPTY
EmptyG

(24,49)-(24,51)
EMPTY
EmptyG

(24,56)-(24,59)
[v1]
ListG VarG Nothing

(25,4)-(27,51)
[v2]
ListG VarG Nothing

*)
