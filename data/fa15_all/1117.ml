
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

(20,21)-(20,22)
fst x
AppG (fromList [VarG])

(20,30)-(20,32)
snd x
AppG (fromList [VarG])

(20,46)-(20,47)
fst x
AppG (fromList [VarG])

(20,55)-(20,57)
snd x
AppG (fromList [VarG])

(22,15)-(22,44)
EMPTY
EmptyG

*)

(* typed spans
(19,21)-(19,28)
(19,31)-(19,38)
(20,13)-(20,20)
(20,23)-(20,30)
*)

(* typed spans
int
int
int
int
*)

(* typed spans
int
int
int
int
*)
