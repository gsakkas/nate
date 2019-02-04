
let rec concat w = match w with | [] -> "" | h::t -> h ^ (concat t);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (concat (listReverse (explode w))) == w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (listReverse (explode w)) == (explode w);;

*)

(* changed spans
(2,15)-(2,67)
EMPTY
EmptyG

(2,19)-(2,67)
EMPTY
EmptyG

(2,25)-(2,26)
EMPTY
EmptyG

(2,40)-(2,42)
EMPTY
EmptyG

(2,53)-(2,54)
EMPTY
EmptyG

(2,53)-(2,67)
EMPTY
EmptyG

(2,55)-(2,56)
EMPTY
EmptyG

(2,57)-(2,67)
EMPTY
EmptyG

(2,58)-(2,64)
EMPTY
EmptyG

(2,65)-(2,66)
EMPTY
EmptyG

(12,20)-(12,26)
EMPTY
EmptyG

(12,27)-(12,52)
EMPTY
EmptyG

(12,57)-(12,58)
explode w
AppG (fromList [VarG])

*)
