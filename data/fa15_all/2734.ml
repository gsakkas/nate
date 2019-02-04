
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | [] -> []
      | h::t -> if (h + x) > 10 then [h + (x mod 10)] @ a else [h + x] @ a in
    let base = [] in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let rec addHelper (t,u) =
  match List.rev t with
  | [] -> []
  | h::t ->
      (match List.rev u with
       | [] -> []
       | h'::t' ->
           if (h + h') > 10
           then (addHelper (t, t')) @ [(1 + h') + h]
           else (addHelper (t, t')) @ [h' + h]);;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = addHelper (a, x) in
    let base = [] in let args = [] in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(4,12)-(9,43)
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(17,6)-(19,74)
EMPTY
EmptyG

(17,12)-(17,13)
EMPTY
EmptyG

(18,14)-(18,16)
EMPTY
EmptyG

(19,16)-(19,74)
EMPTY
EmptyG

(19,19)-(19,26)
EMPTY
EmptyG

(19,19)-(19,31)
EMPTY
EmptyG

(19,20)-(19,21)
EMPTY
EmptyG

(19,24)-(19,25)
EMPTY
EmptyG

(19,29)-(19,31)
EMPTY
EmptyG

(19,37)-(19,53)
EMPTY
EmptyG

(19,37)-(19,57)
EMPTY
EmptyG

(19,38)-(19,39)
EMPTY
EmptyG

(19,38)-(19,52)
EMPTY
EmptyG

(19,42)-(19,52)
EMPTY
EmptyG

(19,43)-(19,44)
EMPTY
EmptyG

(19,49)-(19,51)
addHelper (a , x)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,54)-(19,55)
EMPTY
EmptyG

(19,56)-(19,57)
(a , x)
TupleG (fromList [VarG])

(19,63)-(19,70)
EMPTY
EmptyG

(19,63)-(19,74)
EMPTY
EmptyG

(19,64)-(19,65)
EMPTY
EmptyG

(19,64)-(19,69)
EMPTY
EmptyG

(19,71)-(19,72)
EMPTY
EmptyG

(19,73)-(19,74)
EMPTY
EmptyG

(21,15)-(21,17)
EMPTY
EmptyG

(21,21)-(21,68)
[]
ListG EmptyG Nothing

(21,65)-(21,68)
EMPTY
EmptyG

*)
