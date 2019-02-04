
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
               (((((h1 + h2) + lh1) / 10) :: lt1),
                 ((((h1 + h2) + lh1) mod 10) :: lt2))
           | ([],[]) ->
               (match x with
                | (h1,h2) -> ([(h1 + h2) / 10], [(h1 + h2) mod 10]))) in
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
(15,6)-(23,69)
EMPTY
EmptyG

(15,12)-(15,13)
EMPTY
EmptyG

(17,10)-(23,69)
EMPTY
EmptyG

(17,17)-(17,18)
EMPTY
EmptyG

(19,15)-(20,53)
EMPTY
EmptyG

(19,16)-(19,49)
EMPTY
EmptyG

(19,17)-(19,41)
EMPTY
EmptyG

(19,18)-(19,35)
EMPTY
EmptyG

(19,19)-(19,28)
EMPTY
EmptyG

(19,20)-(19,22)
EMPTY
EmptyG

(19,25)-(19,27)
EMPTY
EmptyG

(19,31)-(19,34)
EMPTY
EmptyG

(19,38)-(19,40)
EMPTY
EmptyG

(19,45)-(19,48)
EMPTY
EmptyG

(20,17)-(20,52)
EMPTY
EmptyG

(20,18)-(20,44)
EMPTY
EmptyG

(20,19)-(20,36)
EMPTY
EmptyG

(20,20)-(20,29)
EMPTY
EmptyG

(20,21)-(20,23)
EMPTY
EmptyG

(20,26)-(20,28)
EMPTY
EmptyG

(20,32)-(20,35)
EMPTY
EmptyG

(20,41)-(20,43)
EMPTY
EmptyG

(20,48)-(20,51)
EMPTY
EmptyG

(22,15)-(23,68)
match x with
| (v1 , v2) -> ([v1] , [v2])
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(23,31)-(23,40)
EMPTY
EmptyG

(23,31)-(23,45)
EMPTY
EmptyG

(23,32)-(23,34)
EMPTY
EmptyG

(23,37)-(23,39)
EMPTY
EmptyG

(23,43)-(23,45)
v1
VarG

(23,49)-(23,58)
EMPTY
EmptyG

(23,49)-(23,65)
EMPTY
EmptyG

(23,50)-(23,52)
EMPTY
EmptyG

(23,55)-(23,57)
EMPTY
EmptyG

(23,63)-(23,65)
v2
VarG

*)
