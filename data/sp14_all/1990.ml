
let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listCompare l k =
  if ((List.hd l) = []) && ((List.hd k) = [])
  then true
  else
    if (List.hd l) = (List.hd k)
    then listCompare (List.tl l) (List.tl k)
    else false;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> myAppend (listReverse t) h;;

let palindrome w = listCompare (explode w) (listReverse (explode w));;


(* fix

let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> myAppend (listReverse t) h;;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(9,22)-(15,14)
EMPTY
EmptyG

(10,2)-(15,14)
EMPTY
EmptyG

(10,5)-(10,23)
EMPTY
EmptyG

(10,5)-(10,45)
EMPTY
EmptyG

(10,6)-(10,17)
EMPTY
EmptyG

(10,7)-(10,14)
EMPTY
EmptyG

(10,15)-(10,16)
EMPTY
EmptyG

(10,20)-(10,22)
EMPTY
EmptyG

(10,27)-(10,45)
EMPTY
EmptyG

(10,28)-(10,39)
EMPTY
EmptyG

(10,29)-(10,36)
EMPTY
EmptyG

(10,37)-(10,38)
EMPTY
EmptyG

(10,42)-(10,44)
EMPTY
EmptyG

(11,7)-(11,11)
EMPTY
EmptyG

(13,4)-(15,14)
EMPTY
EmptyG

(13,7)-(13,18)
EMPTY
EmptyG

(13,7)-(13,32)
EMPTY
EmptyG

(13,8)-(13,15)
EMPTY
EmptyG

(13,16)-(13,17)
EMPTY
EmptyG

(13,21)-(13,32)
EMPTY
EmptyG

(13,22)-(13,29)
EMPTY
EmptyG

(13,30)-(13,31)
EMPTY
EmptyG

(14,9)-(14,20)
EMPTY
EmptyG

(14,9)-(14,44)
EMPTY
EmptyG

(14,21)-(14,32)
EMPTY
EmptyG

(14,22)-(14,29)
EMPTY
EmptyG

(14,30)-(14,31)
EMPTY
EmptyG

(14,33)-(14,44)
EMPTY
EmptyG

(14,34)-(14,41)
EMPTY
EmptyG

(14,42)-(14,43)
EMPTY
EmptyG

(15,9)-(15,14)
EMPTY
EmptyG

(17,20)-(18,62)
EMPTY
EmptyG

(20,19)-(20,30)
explode w = listReverse (explode w)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(20,19)-(20,68)
EMPTY
EmptyG

*)
