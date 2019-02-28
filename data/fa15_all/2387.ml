
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
  match explode w with | [] -> true | h::t -> matchHeads explode w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match x with | [] -> true | h::t -> false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(18,6)-(20,16)
false
LitG

(23,46)-(23,66)
matchHeads (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lit (Just (7,59)-(7,64)) (LB False)
App (Just (10,46)-(10,68)) (Var (Just (10,46)-(10,56)) "matchHeads") [App (Just (10,57)-(10,68)) (Var (Just (10,58)-(10,65)) "explode") [Var (Just (10,66)-(10,67)) "w"]]
*)

(* typed spans
(7,59)-(7,64)
(10,46)-(10,68)
*)

(* correct types
bool
bool
*)

(* bad types
bool
bool
*)
