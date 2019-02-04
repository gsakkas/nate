
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | ([],[]) ->
          let (carry,num) = a in
          (0, (if carry > 0 then carry :: num else num))
      | (l1,l2) ->
          let (carry,num) = a in
          let addit = ((List.hd l1) + (List.hd l2)) + carry in
          ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,6)-(21,75)
EMPTY
EmptyG

(14,12)-(14,13)
EMPTY
EmptyG

(17,10)-(17,56)
EMPTY
EmptyG

(17,11)-(17,12)
EMPTY
EmptyG

(17,14)-(17,55)
EMPTY
EmptyG

(17,18)-(17,23)
EMPTY
EmptyG

(17,18)-(17,27)
EMPTY
EmptyG

(17,26)-(17,27)
EMPTY
EmptyG

(17,33)-(17,38)
EMPTY
EmptyG

(17,33)-(17,45)
EMPTY
EmptyG

(17,42)-(17,45)
EMPTY
EmptyG

(17,51)-(17,54)
EMPTY
EmptyG

(19,10)-(21,75)
EMPTY
EmptyG

(19,28)-(19,29)
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,10)-(21,75)
x
VarG

(20,23)-(20,35)
EMPTY
EmptyG

(20,24)-(20,31)
EMPTY
EmptyG

(20,32)-(20,34)
EMPTY
EmptyG

(20,38)-(20,50)
EMPTY
EmptyG

(20,39)-(20,46)
EMPTY
EmptyG

(20,47)-(20,49)
l1'
VarG

(20,54)-(20,59)
l2'
VarG

*)
