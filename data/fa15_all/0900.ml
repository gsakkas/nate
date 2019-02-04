
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = if String.length = 0 then true else explode w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | x::xs' -> (listReverse xs') @ [x];;

let palindrome w =
  let wList = explode w in
  let revList = listReverse wList in match revList with | wList -> true;;

*)

(* changed spans
(7,15)-(7,64)
fun l ->
  match l with
  | [] -> []
  | x :: xs' -> listReverse xs' @ [x]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,19)-(7,64)
EMPTY
EmptyG

(7,22)-(7,35)
EMPTY
EmptyG

(7,22)-(7,39)
EMPTY
EmptyG

(7,38)-(7,39)
EMPTY
EmptyG

(7,45)-(7,49)
let wList = explode w in
let revList =
  listReverse wList in
match revList with
| wList -> true
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)
