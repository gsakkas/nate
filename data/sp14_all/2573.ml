
let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail -> head :: (listReverse tail) :: tail;;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail -> head :: (listReverse tail);;

*)

(* changed spans
(8,26)-(8,52)
EMPTY
EmptyG

(8,48)-(8,52)
EMPTY
EmptyG

*)
