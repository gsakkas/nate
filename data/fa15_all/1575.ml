
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::tail -> (listReverse tail) @ [h];;

let palindrome w = if (explode w) = (listReverse w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::tail -> (listReverse tail) @ [h];;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(10,49)-(10,50)
explode w
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (11,32)-(11,43)) (Var (Just (11,33)-(11,40)) "explode") [Var (Just (11,41)-(11,42)) "w"]
*)

(* typed spans
(11,32)-(11,43)
*)

(* correct types
char list
*)

(* bad types
string
*)
