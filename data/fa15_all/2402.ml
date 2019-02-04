
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  match explode w with | [] -> true | h::t -> listReverse (explode w);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads w =
  match w with
  | [] -> true
  | h::t -> if h = (List.hd (listReverse w)) then true else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(2,12)-(5,6)
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,20)-(8,57)
fun w ->
  match w with
  | [] -> true
  | h :: t -> if h = List.hd (listReverse w)
              then true
              else false
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(8,8)-(8,9)
EMPTY
EmptyG

(8,23)-(8,25)
EMPTY
EmptyG

(8,36)-(8,51)
if h = List.hd (listReverse w)
then true
else false
IteG (BopG EmptyG EmptyG) LitG LitG

(8,36)-(8,57)
EMPTY
EmptyG

(8,37)-(8,48)
listReverse w
AppG (fromList [VarG])

(8,49)-(8,50)
EMPTY
EmptyG

(8,52)-(8,53)
w
VarG

(8,54)-(8,57)
EMPTY
EmptyG

(8,55)-(8,56)
w
VarG

(10,15)-(11,69)
false
LitG

(11,46)-(11,57)
matchHeads
VarG

*)
