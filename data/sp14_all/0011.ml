
let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match a with | ah::at -> (match x with | xh::xt -> ah + xh) in
    let base = l1 in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) = [0; 0; 0; 0; 0] in removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,4)-(25,68)
EMPTY
EmptyG

(23,10)-(23,75)
EMPTY
EmptyG

(23,12)-(23,75)
EMPTY
EmptyG

(23,16)-(23,75)
EMPTY
EmptyG

(23,22)-(23,23)
EMPTY
EmptyG

(23,41)-(23,75)
EMPTY
EmptyG

(23,48)-(23,49)
EMPTY
EmptyG

(23,67)-(23,69)
EMPTY
EmptyG

(23,67)-(23,74)
EMPTY
EmptyG

(23,72)-(23,74)
EMPTY
EmptyG

(24,4)-(25,68)
EMPTY
EmptyG

(24,15)-(24,17)
EMPTY
EmptyG

(25,4)-(25,68)
EMPTY
EmptyG

(25,15)-(25,17)
EMPTY
EmptyG

(25,21)-(25,68)
EMPTY
EmptyG

(25,35)-(25,49)
EMPTY
EmptyG

(25,35)-(25,61)
EMPTY
EmptyG

(25,50)-(25,51)
EMPTY
EmptyG

(25,52)-(25,56)
EMPTY
EmptyG

(25,57)-(25,61)
EMPTY
EmptyG

(25,65)-(25,68)
[0 ; 0 ; 0 ; 0 ; 0]
ListG LitG Nothing

(26,2)-(26,34)
0
LitG

*)
