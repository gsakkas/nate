
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if (listReverse explode w) = (explode w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if (listReverse (explode w)) = (explode w) then true else false;;

*)

(* changed spans
(11,5)-(11,28)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (11,5)-(11,30)) (Var (Just (11,6)-(11,17)) "listReverse") [App (Just (11,18)-(11,29)) (Var (Just (11,19)-(11,26)) "explode") [Var (Just (11,27)-(11,28)) "w"]]
*)

(* typed spans
(11,5)-(11,30)
*)

(* correct types
char list
*)

(* bad types
char list
*)
