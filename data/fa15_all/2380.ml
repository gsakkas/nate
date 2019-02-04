
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads (x,y) =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead y)
      then matchHeads (t, (getTail y))
      else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


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

(11,20)-(17,16)
fun x ->
  match x with
  | [] -> true
  | h :: t -> if getHead x = getHead (listReverse x)
              then matchHeads (getTail (listReverse t))
              else false
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(15,32)-(15,33)
EMPTY
EmptyG

(16,11)-(16,21)
matchHeads (getTail (listReverse t))
AppG (fromList [AppG (fromList [EmptyG])])

(16,22)-(16,38)
EMPTY
EmptyG

(16,23)-(16,24)
EMPTY
EmptyG

(16,35)-(16,36)
listReverse t
AppG (fromList [VarG])

(17,11)-(17,16)
t
VarG

(20,57)-(20,68)
EMPTY
EmptyG

(20,58)-(20,65)
EMPTY
EmptyG

(20,66)-(20,67)
[["b"]]
ListG (ListG EmptyG Nothing) Nothing

*)
