
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  let h::t = l in match l with | [] -> [] | h::t -> listReverse t;;

*)

(* changed spans
(2,24)-(2,76)
let h :: t = l in
match l with
| [] -> []
| h :: t -> listReverse t
LetG NonRec (fromList [VarG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(2,58)-(2,76)
EMPTY
EmptyG

(2,74)-(2,75)
EMPTY
EmptyG

*)
