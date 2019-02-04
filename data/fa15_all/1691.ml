
let rec sumList xs =
  match xs with | [] -> [] | h::t -> let h::t = xs in h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(3,24)-(3,26)
EMPTY
EmptyG

(3,37)-(3,69)
EMPTY
EmptyG

(3,48)-(3,50)
0
LitG

*)
