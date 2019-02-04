
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec mulByDigit i l =
  let mul (i1,l1) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args =
      List.combine (List.rev (0 :: l1)) (List.rev (clone (List.length l) i)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (mul l);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let l1 = [9; 9; 9];;

let rec mulByDigit i l =
  let f a x =
    let (i,j) = x in
    let (s,t) = a in ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
  let base = (0, []) in
  let args =
    List.combine (List.rev (0 :: l1)) (List.rev (clone (List.length l) i)) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(4,19)-(5,69)
EMPTY
EmptyG

(5,2)-(5,69)
EMPTY
EmptyG

(5,8)-(5,9)
EMPTY
EmptyG

(5,23)-(5,25)
EMPTY
EmptyG

(5,36)-(5,69)
EMPTY
EmptyG

(5,39)-(5,40)
EMPTY
EmptyG

(5,39)-(5,44)
EMPTY
EmptyG

(5,43)-(5,44)
EMPTY
EmptyG

(5,50)-(5,60)
EMPTY
EmptyG

(5,50)-(5,62)
EMPTY
EmptyG

(5,61)-(5,62)
EMPTY
EmptyG

(5,68)-(5,69)
[9 ; 9 ; 9]
ListG LitG Nothing

(7,19)-(16,20)
9
LitG

(8,2)-(16,20)
EMPTY
EmptyG

(8,11)-(15,51)
EMPTY
EmptyG

(16,2)-(16,12)
EMPTY
EmptyG

(16,2)-(16,20)
EMPTY
EmptyG

(16,13)-(16,20)
EMPTY
EmptyG

(16,14)-(16,17)
EMPTY
EmptyG

(16,18)-(16,19)
EMPTY
EmptyG

*)
