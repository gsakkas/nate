
let rec listReverse l =
  let newList = [] in
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> [listReverse tail; head];;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(3,2)-(7,42)
EMPTY
EmptyG

(3,16)-(3,18)
EMPTY
EmptyG

(7,18)-(7,42)
listReverse tail @ [head]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(7,19)-(7,35)
(@)
VarG

(7,37)-(7,41)
[head]
ListG VarG Nothing

*)
