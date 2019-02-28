
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (explode w) = (listReverse explode w);;


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
(10,33)-(10,56)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (10,33)-(10,58)) (Var (Just (10,34)-(10,45)) "listReverse") [App (Just (10,46)-(10,57)) (Var (Just (10,47)-(10,54)) "explode") [Var (Just (10,55)-(10,56)) "w"]]
*)

(* typed spans
(10,33)-(10,58)
*)

(* correct types
char list
*)

(* bad types
char list
*)
