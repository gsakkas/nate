
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
      match x with
      | ([],[]) -> (0, (if carry > 0 then carry :: num else num))
      | (l1,l2) ->
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
(15,6)-(19,75)
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(16,19)-(16,65)
EMPTY
EmptyG

(16,20)-(16,21)
EMPTY
EmptyG

(16,23)-(16,64)
EMPTY
EmptyG

(16,27)-(16,32)
EMPTY
EmptyG

(16,27)-(16,36)
EMPTY
EmptyG

(16,35)-(16,36)
EMPTY
EmptyG

(16,42)-(16,47)
EMPTY
EmptyG

(16,42)-(16,54)
EMPTY
EmptyG

(16,51)-(16,54)
EMPTY
EmptyG

(16,60)-(16,63)
EMPTY
EmptyG

(18,23)-(18,35)
EMPTY
EmptyG

(18,24)-(18,31)
EMPTY
EmptyG

(18,32)-(18,34)
EMPTY
EmptyG

(18,38)-(18,50)
EMPTY
EmptyG

(18,39)-(18,46)
EMPTY
EmptyG

(18,47)-(18,49)
l1'
VarG

(18,54)-(18,59)
l2'
VarG

*)
