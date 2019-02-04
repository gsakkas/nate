
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | [] -> a
      | h::t ->
          ((((fst h) + (snd h)) / 10), ((((fst h) + (snd h)) mod 10) :: t)) in
    let base = (0, []) in
    let args = [((List.combine l1), l2)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,6)-(18,75)
EMPTY
EmptyG

(15,12)-(15,13)
EMPTY
EmptyG

(18,10)-(18,75)
EMPTY
EmptyG

(18,11)-(18,37)
EMPTY
EmptyG

(18,12)-(18,31)
EMPTY
EmptyG

(18,13)-(18,20)
EMPTY
EmptyG

(18,14)-(18,17)
EMPTY
EmptyG

(18,18)-(18,19)
EMPTY
EmptyG

(18,23)-(18,30)
EMPTY
EmptyG

(18,24)-(18,27)
EMPTY
EmptyG

(18,28)-(18,29)
EMPTY
EmptyG

(18,34)-(18,36)
EMPTY
EmptyG

(18,39)-(18,74)
EMPTY
EmptyG

(18,40)-(18,68)
EMPTY
EmptyG

(18,41)-(18,60)
EMPTY
EmptyG

(18,42)-(18,49)
EMPTY
EmptyG

(18,43)-(18,46)
EMPTY
EmptyG

(18,47)-(18,48)
EMPTY
EmptyG

(18,52)-(18,59)
EMPTY
EmptyG

(18,53)-(18,56)
EMPTY
EmptyG

(18,57)-(18,58)
EMPTY
EmptyG

(18,65)-(18,67)
EMPTY
EmptyG

(18,72)-(18,73)
EMPTY
EmptyG

(20,15)-(20,40)
EMPTY
EmptyG

(20,16)-(20,39)
EMPTY
EmptyG

(20,17)-(20,34)
List.combine l1 l2
AppG (fromList [VarG])

*)
