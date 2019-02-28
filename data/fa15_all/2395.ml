
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead (listReverse x))
      then matchHeads (getTail (listReverse t))
      else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with | [] -> true | h::t -> if true then true else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(19,11)-(19,47)
true
LitG

(19,44)-(19,45)
true
LitG

*)

(* changed exprs
Lit (Just (8,41)-(8,45)) (LB True)
Lit (Just (8,51)-(8,55)) (LB True)
*)

(* typed spans
(8,41)-(8,45)
(8,51)-(8,55)
*)

(* correct types
bool
bool
*)

(* bad types
bool
'a list list
*)
