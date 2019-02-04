
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let getHeads y = match listReverse y with | [] -> [] | h::t -> [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match explode x with
  | h::t ->
      if (getHeads (explode x)) = []
      then true
      else if [h] = (getHeads t) then true else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let getHeads y = match listReverse y with | [] -> [] | h::t -> [h];;

let loseTail z = match listReverse z with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with
  | h::t ->
      if (getHeads x) = []
      then true
      else if [h] = (getHeads t) then matchHeads (loseTail t) else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(7,12)-(10,6)
fun z ->
  match listReverse z with
  | [] -> []
  | h :: t -> t
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(13,8)-(13,15)
EMPTY
EmptyG

(13,8)-(13,17)
EMPTY
EmptyG

(15,19)-(15,30)
EMPTY
EmptyG

(15,20)-(15,27)
EMPTY
EmptyG

(17,38)-(17,42)
matchHeads (loseTail t)
AppG (fromList [AppG (fromList [EmptyG])])

(17,48)-(17,53)
loseTail t
AppG (fromList [VarG])

*)
