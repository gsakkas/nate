
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
      | [] -> (0, (if carry > 0 then carry :: num else num))
      | h::t ->
          let (l1',l2') = h in
          let addit = (l1' + l2') + carry in
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
(15,7)-(20,76)
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(13,5)-(23,52)
(13,11)-(20,76)
(13,13)-(20,76)
(15,7)-(20,76)
(15,13)-(15,14)
(22,5)-(23,52)
(22,16)-(22,28)
(22,16)-(22,34)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,41)-(23,45)
*)
