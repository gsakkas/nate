
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
    let f a x =
      match a with
      | (h1::t1,_) ->
          (match x with | [] -> (t1, [h1]) | h3::t3 -> (t1, (h1 :: h3 :: t3))) in
    let base = (l1, []) in
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
(23,4)-(28,68)
EMPTY
EmptyG

(23,10)-(26,78)
EMPTY
EmptyG

(23,12)-(26,78)
EMPTY
EmptyG

(24,6)-(26,78)
EMPTY
EmptyG

(24,12)-(24,13)
EMPTY
EmptyG

(26,10)-(26,78)
EMPTY
EmptyG

(26,17)-(26,18)
EMPTY
EmptyG

(26,32)-(26,42)
EMPTY
EmptyG

(26,33)-(26,35)
EMPTY
EmptyG

(26,37)-(26,41)
EMPTY
EmptyG

(26,38)-(26,40)
EMPTY
EmptyG

(26,55)-(26,77)
EMPTY
EmptyG

(26,56)-(26,58)
EMPTY
EmptyG

(26,60)-(26,76)
EMPTY
EmptyG

(26,61)-(26,63)
EMPTY
EmptyG

(26,67)-(26,69)
EMPTY
EmptyG

(26,67)-(26,75)
EMPTY
EmptyG

(26,73)-(26,75)
EMPTY
EmptyG

(27,4)-(28,68)
EMPTY
EmptyG

(27,15)-(27,23)
EMPTY
EmptyG

(27,16)-(27,18)
EMPTY
EmptyG

(27,20)-(27,22)
EMPTY
EmptyG

(28,4)-(28,68)
EMPTY
EmptyG

(28,15)-(28,17)
EMPTY
EmptyG

(28,21)-(28,68)
EMPTY
EmptyG

(28,35)-(28,49)
EMPTY
EmptyG

(28,35)-(28,61)
EMPTY
EmptyG

(28,50)-(28,51)
EMPTY
EmptyG

(28,52)-(28,56)
EMPTY
EmptyG

(28,57)-(28,61)
EMPTY
EmptyG

(28,65)-(28,68)
[0 ; 0 ; 0 ; 0 ; 0]
ListG LitG Nothing

(29,2)-(29,34)
0
LitG

*)
