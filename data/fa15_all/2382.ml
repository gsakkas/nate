
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead (listReverse x))
      then matchHeads (getTail (listReverse t))
      else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | h::t -> matchHeads (listReverse (explode w));;


(* fix

let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead (listReverse x))
      then matchHeads (getTail (listReverse t))
      else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads [["b"]];;

*)

(* changed spans
(6,12)-(9,6)
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(11,20)-(12,57)
EMPTY
EmptyG

(12,2)-(12,57)
EMPTY
EmptyG

(12,8)-(12,9)
EMPTY
EmptyG

(12,23)-(12,25)
EMPTY
EmptyG

(12,36)-(12,51)
EMPTY
EmptyG

(12,36)-(12,57)
EMPTY
EmptyG

(12,37)-(12,48)
EMPTY
EmptyG

(12,49)-(12,50)
EMPTY
EmptyG

(12,52)-(12,53)
EMPTY
EmptyG

(12,54)-(12,57)
EMPTY
EmptyG

(12,55)-(12,56)
EMPTY
EmptyG

(25,23)-(25,48)
EMPTY
EmptyG

(25,24)-(25,35)
EMPTY
EmptyG

(25,36)-(25,47)
EMPTY
EmptyG

(25,37)-(25,44)
EMPTY
EmptyG

(25,45)-(25,46)
[["b"]]
ListG (ListG EmptyG Nothing) Nothing

*)
