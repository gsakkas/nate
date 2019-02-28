
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = if w = (listReverse (explode w)) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(10,22)-(10,23)
explode w
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (11,5)-(11,16)) (Var (Just (11,6)-(11,13)) "explode") [Var (Just (11,14)-(11,15)) "w"]
*)

(* typed spans
(11,5)-(11,16)
*)

(* correct types
char list
*)

(* bad types
string
*)
