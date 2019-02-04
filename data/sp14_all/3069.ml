
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec digitsOfInt n =
  if n = 0
  then [0]
  else
    (fun help  ->
       fun n  -> match n with | 0 -> [] | _ -> cat (help (n / 10)) (n mod 10));;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec help n = match n with | 0 -> [] | _ -> cat (help (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else help n;;

*)

(* changed spans
(5,2)-(9,78)
EMPTY
EmptyG

(5,5)-(5,6)
EMPTY
EmptyG

(5,5)-(5,10)
EMPTY
EmptyG

(5,9)-(5,10)
EMPTY
EmptyG

(6,7)-(6,10)
EMPTY
EmptyG

(6,8)-(6,9)
EMPTY
EmptyG

(8,4)-(9,78)
EMPTY
EmptyG

(9,7)-(9,77)
EMPTY
EmptyG

*)
