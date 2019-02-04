
let rec listReverse l = match l with | [] -> 0 | h::t -> [h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,45)-(2,46)
[]
ListG EmptyG Nothing

(2,57)-(2,60)
listReverse t @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

*)
