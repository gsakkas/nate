
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a,b) = x in
      match a with
      | hd::tl -> (((a + b) + hd) / 10) :: (((a + b) + hd) mod 10) :: tl in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | hd::tl -> ((((fst x) + (snd x)) + hd) / 10) ::
          ((((fst x) + (snd x)) + hd) mod 10) :: tl in
    let base = [] in
    let args = List.combine l1 l2 in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(20,72)
EMPTY
EmptyG

(18,18)-(18,19)
EMPTY
EmptyG

(20,21)-(20,22)
EMPTY
EmptyG

(20,25)-(20,26)
fst x
AppG (fromList [VarG])

(20,30)-(20,32)
snd x
AppG (fromList [VarG])

(20,46)-(20,47)
EMPTY
EmptyG

(20,50)-(20,51)
fst x
AppG (fromList [VarG])

(20,55)-(20,57)
snd x
AppG (fromList [VarG])

(22,15)-(22,23)
EMPTY
EmptyG

(22,15)-(22,44)
EMPTY
EmptyG

*)
