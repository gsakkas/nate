
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a,b) = List.hd x in ([(List.hd a) + 1], [(List.hd b) + 2]) in
    let base = ([], []) in
    let args = [(l1, l2)] in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ([x + 1], [x + 2]) in
    let base = ([], []) in
    let args = l1 in let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(20,69)
EMPTY
EmptyG

(20,18)-(20,25)
EMPTY
EmptyG

(20,18)-(20,27)
EMPTY
EmptyG

(20,26)-(20,27)
EMPTY
EmptyG

(20,33)-(20,44)
EMPTY
EmptyG

(20,34)-(20,41)
EMPTY
EmptyG

(20,42)-(20,43)
x
VarG

(20,52)-(20,63)
EMPTY
EmptyG

(20,53)-(20,60)
EMPTY
EmptyG

(20,61)-(20,62)
x
VarG

(22,15)-(22,25)
EMPTY
EmptyG

(22,16)-(22,24)
EMPTY
EmptyG

(22,21)-(22,23)
EMPTY
EmptyG

*)
