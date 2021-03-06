
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
      | (carry,result) ->
          (match x with
           | (h1::t1,h2::t2) ->
               ((((h1 + h2) + carry) / 10), (((h1 + h2) mod 10) :: result))) in
    let base = (0, l1) in
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
(23,5)-(30,69)
[0 ; 0 ; 0 ; 0 ; 0]
ListG [LitG,LitG,LitG,LitG,LitG]

*)

(* type error slice
(5,4)-(14,64)
(5,13)-(14,62)
(5,16)-(14,62)
(6,3)-(14,62)
(7,3)-(14,62)
(8,3)-(14,62)
(10,7)-(11,62)
(11,7)-(11,62)
(11,20)-(11,25)
(11,20)-(11,29)
(11,33)-(11,62)
(11,34)-(11,36)
(11,38)-(11,61)
(11,39)-(11,50)
(11,51)-(11,57)
(14,7)-(14,62)
(14,20)-(14,25)
(14,20)-(14,29)
(14,34)-(14,57)
(14,35)-(14,46)
(14,47)-(14,53)
(14,54)-(14,56)
(22,3)-(31,35)
(22,12)-(30,69)
(23,5)-(30,69)
(23,11)-(28,77)
(23,13)-(28,77)
(24,7)-(28,77)
(24,13)-(24,14)
(26,11)-(28,77)
(26,18)-(26,19)
(28,45)-(28,75)
(28,46)-(28,64)
(28,68)-(28,74)
(29,5)-(30,69)
(29,16)-(29,23)
(29,20)-(29,22)
(30,5)-(30,69)
(30,16)-(30,18)
(30,36)-(30,50)
(30,36)-(30,62)
(30,51)-(30,52)
(30,53)-(30,57)
(30,58)-(30,62)
(31,14)-(31,35)
(31,15)-(31,18)
(31,19)-(31,34)
(31,20)-(31,27)
*)
