
let rec listReverse l = match l with | [] -> [] | a::b -> listReverse [a] b;;


(* fix

let rec listReverse l = match l with | [] -> [] | a::b -> listReverse [a];;

*)

(* changed spans
(2,58)-(2,75)
listReverse [a]
AppG (fromList [ListG EmptyG Nothing])

(2,74)-(2,75)
EMPTY
EmptyG

*)
