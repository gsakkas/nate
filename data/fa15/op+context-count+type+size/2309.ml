
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (x,y) -> (x + y) :: a in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (w,z) ->
          (match x with
           | (x,y) -> ((((x + y) + w) / 10), ((((x + y) + w) mod 10) :: z))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,17)-(16,53)
(16,42)-(16,43)
(16,42)-(16,47)
(16,42)-(16,53)
(16,52)-(16,53)
(17,5)-(19,52)
(17,16)-(17,18)
(18,5)-(19,52)
(19,5)-(19,52)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
(19,36)-(19,40)
(19,41)-(19,45)
(19,49)-(19,52)
(20,3)-(20,13)
(20,3)-(20,33)
(20,15)-(20,18)
(20,20)-(20,27)
(20,20)-(20,33)
(20,28)-(20,30)
(20,31)-(20,33)
*)

(* type error slice
(16,5)-(19,52)
(16,11)-(16,53)
(16,42)-(16,53)
(16,52)-(16,53)
(19,5)-(19,52)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
*)
