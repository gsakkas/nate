
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec revexp (x,y) = match x with | [] -> y | h::t -> revexp (t, (h ^ y));;

let palindrome w = if w = (revexp ((explode w), "")) then true else false;;


(* fix

let rec reverse (x,y) =
  match x with | [] -> y | h::t -> reverse (t, (h :: y));;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = match l with | [] -> [] | h::t -> reverse (l, []);;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(2,12)-(5,6)
fun (x , y) ->
  match x with
  | [] -> y
  | h :: t -> reverse (t , h :: y)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,16)-(7,75)
fun l ->
  match l with
  | [] -> []
  | h :: t -> reverse (l , [])
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,29)-(7,30)
EMPTY
EmptyG

(7,44)-(7,45)
l
VarG

(7,56)-(7,62)
reverse
VarG

(7,56)-(7,75)
[]
ListG EmptyG Nothing

(7,64)-(7,65)
EMPTY
EmptyG

(7,67)-(7,74)
EMPTY
EmptyG

(7,68)-(7,69)
EMPTY
EmptyG

(7,70)-(7,71)
EMPTY
EmptyG

(7,72)-(7,73)
l
VarG

(9,15)-(9,73)
[]
ListG EmptyG Nothing

(9,22)-(9,23)
explode w
AppG (fromList [VarG])

(9,27)-(9,33)
EMPTY
EmptyG

(9,34)-(9,51)
listReverse
VarG

(9,48)-(9,50)
EMPTY
EmptyG

*)
