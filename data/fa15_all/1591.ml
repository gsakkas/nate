
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (explode w) = (listReverse w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(10,46)-(10,47)
explode w
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (10,46)-(10,57)) (Var (Just (10,47)-(10,54)) "explode") [Var (Just (10,55)-(10,56)) "w"]
*)

(* typed spans
(10,46)-(10,57)
*)

(* correct types
char list
*)

(* bad types
string
*)
