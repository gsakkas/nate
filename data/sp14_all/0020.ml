
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
      | (0,[]) -> (0, [])
      | (carry,h1::t1) ->
          (match x with
           | h2::t2 ->
               ((((h1 + h2) + carry) / 10), (((h1 + h2) mod 10) :: t1))) in
    let base = (0, []) in
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
(23,4)-(31,68)
EMPTY
EmptyG

(23,10)-(29,72)
EMPTY
EmptyG

(23,12)-(29,72)
EMPTY
EmptyG

(24,6)-(29,72)
EMPTY
EmptyG

(24,12)-(24,13)
EMPTY
EmptyG

(25,18)-(25,25)
[0 ; 0 ; 0 ; 0 ; 0]
ListG LitG Nothing

(25,22)-(25,24)
EMPTY
EmptyG

(27,10)-(29,72)
EMPTY
EmptyG

(27,17)-(27,18)
EMPTY
EmptyG

(29,15)-(29,71)
EMPTY
EmptyG

(29,16)-(29,42)
EMPTY
EmptyG

(29,17)-(29,36)
EMPTY
EmptyG

(29,18)-(29,27)
EMPTY
EmptyG

(29,19)-(29,21)
EMPTY
EmptyG

(29,24)-(29,26)
EMPTY
EmptyG

(29,30)-(29,35)
EMPTY
EmptyG

(29,39)-(29,41)
EMPTY
EmptyG

(29,44)-(29,70)
EMPTY
EmptyG

(29,45)-(29,63)
EMPTY
EmptyG

(29,46)-(29,55)
EMPTY
EmptyG

(29,47)-(29,49)
EMPTY
EmptyG

(29,52)-(29,54)
EMPTY
EmptyG

(29,60)-(29,62)
EMPTY
EmptyG

(29,67)-(29,69)
EMPTY
EmptyG

(30,4)-(31,68)
EMPTY
EmptyG

(30,15)-(30,22)
EMPTY
EmptyG

(30,19)-(30,21)
EMPTY
EmptyG

(31,4)-(31,68)
EMPTY
EmptyG

(31,15)-(31,17)
EMPTY
EmptyG

(31,21)-(31,68)
EMPTY
EmptyG

(31,35)-(31,49)
EMPTY
EmptyG

(31,35)-(31,61)
EMPTY
EmptyG

(31,50)-(31,51)
EMPTY
EmptyG

(31,52)-(31,56)
EMPTY
EmptyG

(31,57)-(31,61)
EMPTY
EmptyG

(31,65)-(31,68)
0
LitG

(32,2)-(32,34)
0
LitG

*)
