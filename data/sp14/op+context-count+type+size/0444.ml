
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add l1 l2 =
    let f a x =
      match x with
      | (w,y)::t -> ((w + y) / 10) :: ((w + y) mod 10) :: a
      | _ -> a in
    let base = [] in
    let args = List.rev ((List.combine l1 l2) :: (0, 0)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,11)-(24,52)
(17,14)-(24,52)
(19,7)-(21,15)
(19,13)-(19,14)
(20,23)-(20,34)
(20,23)-(20,60)
(20,27)-(20,28)
(20,45)-(20,46)
(20,59)-(20,60)
(21,14)-(21,15)
(22,5)-(24,52)
(22,16)-(22,18)
(23,5)-(24,52)
(23,27)-(23,55)
(23,51)-(23,52)
(23,51)-(23,55)
(23,54)-(23,55)
(24,5)-(24,52)
(25,20)-(25,27)
(25,28)-(25,30)
(25,31)-(25,33)
*)

(* type error slice
(18,5)-(24,52)
(18,11)-(21,15)
(20,41)-(20,60)
(20,59)-(20,60)
(23,27)-(23,55)
(23,51)-(23,55)
(24,5)-(24,52)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
*)