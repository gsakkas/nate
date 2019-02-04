
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec matchHeads (x,y) =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead y)
      then matchHeads (t, (getTail y))
      else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | h::t -> matchHeads (listReverse (explode w)) (listReverse (explode w));;


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

(14,20)-(20,16)
fun x ->
  match x with
  | [] -> true
  | h :: t -> if getHead x = getHead (listReverse x)
              then matchHeads (getTail (listReverse t))
              else false
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(18,32)-(18,33)
EMPTY
EmptyG

(19,11)-(19,21)
matchHeads (getTail (listReverse t))
AppG (fromList [AppG (fromList [EmptyG])])

(19,22)-(19,38)
EMPTY
EmptyG

(19,23)-(19,24)
EMPTY
EmptyG

(19,35)-(19,36)
listReverse t
AppG (fromList [VarG])

(20,11)-(20,16)
t
VarG

(25,12)-(25,22)
EMPTY
EmptyG

(25,12)-(25,74)
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
EMPTY
EmptyG

(25,49)-(25,74)
EMPTY
EmptyG

(25,50)-(25,61)
EMPTY
EmptyG

(25,62)-(25,73)
EMPTY
EmptyG

(25,63)-(25,70)
EMPTY
EmptyG

(25,71)-(25,72)
matchHeads
VarG

*)
