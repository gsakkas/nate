
let getHead h = match h with | [] -> [] | h::t -> h;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t -> if (getHead x) = (getHead (listReverse x)) then true else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with | [] -> true | h::t -> if true then true else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(2,12)-(2,51)
EMPTY
EmptyG

(2,16)-(2,51)
EMPTY
EmptyG

(2,22)-(2,23)
EMPTY
EmptyG

(2,37)-(2,39)
EMPTY
EmptyG

(2,50)-(2,51)
EMPTY
EmptyG

(4,20)-(5,57)
EMPTY
EmptyG

(5,2)-(5,57)
EMPTY
EmptyG

(5,8)-(5,9)
EMPTY
EmptyG

(5,23)-(5,25)
EMPTY
EmptyG

(5,36)-(5,51)
EMPTY
EmptyG

(5,36)-(5,57)
EMPTY
EmptyG

(5,37)-(5,48)
EMPTY
EmptyG

(5,49)-(5,50)
EMPTY
EmptyG

(5,52)-(5,53)
EMPTY
EmptyG

(5,54)-(5,57)
EMPTY
EmptyG

(5,55)-(5,56)
EMPTY
EmptyG

(15,15)-(15,26)
EMPTY
EmptyG

(15,15)-(15,54)
EMPTY
EmptyG

(15,16)-(15,23)
EMPTY
EmptyG

(15,24)-(15,25)
EMPTY
EmptyG

(15,29)-(15,54)
EMPTY
EmptyG

(15,30)-(15,37)
EMPTY
EmptyG

(15,38)-(15,53)
EMPTY
EmptyG

(15,39)-(15,50)
EMPTY
EmptyG

(15,51)-(15,52)
EMPTY
EmptyG

(15,70)-(15,75)
true
LitG

*)
