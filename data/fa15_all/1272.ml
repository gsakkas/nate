
let rec listReverse l =
  let newList = [] in
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) :: head;;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(3,2)-(7,44)
EMPTY
EmptyG

(3,16)-(3,18)
EMPTY
EmptyG

(7,18)-(7,36)
(@)
VarG

(7,18)-(7,44)
listReverse tail @ [head]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

(7,40)-(7,44)
[head]
ListG VarG

*)

(* typed spans
't11 list -> 't11 list -> 't11 list
't11 list
't11 list
*)
