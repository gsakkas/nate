
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec matchHeads x y =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead y) then matchHeads t (getTail y) else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | h::t -> matchHeads ["b"; "o"; "b"] (listReverse (explode w));;


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

(14,21)-(18,75)
EMPTY
EmptyG

(18,32)-(18,33)
EMPTY
EmptyG

(18,40)-(18,50)
matchHeads (getTail (listReverse t))
AppG (fromList [AppG (fromList [EmptyG])])

(18,40)-(18,64)
listReverse x
AppG (fromList [VarG])

(18,51)-(18,52)
EMPTY
EmptyG

(18,62)-(18,63)
listReverse t
AppG (fromList [VarG])

(18,70)-(18,75)
t
VarG

(23,12)-(23,64)
matchHeads [["b"]]
AppG (fromList [ListG EmptyG Nothing])

(23,23)-(23,38)
EMPTY
EmptyG

(23,24)-(23,27)
EMPTY
EmptyG

(23,29)-(23,32)
[["b"]]
ListG (ListG EmptyG Nothing) Nothing

(23,34)-(23,37)
["b"]
ListG LitG Nothing

(23,39)-(23,64)
EMPTY
EmptyG

(23,40)-(23,51)
EMPTY
EmptyG

(23,52)-(23,63)
EMPTY
EmptyG

(23,53)-(23,60)
EMPTY
EmptyG

(23,61)-(23,62)
EMPTY
EmptyG

*)
