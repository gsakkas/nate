
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::tail -> (listReverse tail) @ [h];;

let palindrome w = explode (listReverse w);;


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
(10,19)-(10,42)
if explode w = listReverse (explode w)
then true
else false
IteG (BopG EmptyG EmptyG) LitG LitG

*)

(* changed exprs
Ite (Just (11,2)-(11,65)) (Bop (Just (11,5)-(11,44)) Eq (App (Just (11,5)-(11,16)) (Var (Just (11,6)-(11,13)) "explode") [Var (Just (11,14)-(11,15)) "w"]) (App (Just (11,19)-(11,44)) (Var (Just (11,20)-(11,31)) "listReverse") [App (Just (11,32)-(11,43)) (Var (Just (11,33)-(11,40)) "explode") [Var (Just (11,41)-(11,42)) "w"]])) (Lit (Just (11,50)-(11,54)) (LB True)) (Lit (Just (11,60)-(11,65)) (LB False))
*)

(* typed spans
(11,2)-(11,65)
*)

(* correct types
bool
*)

(* bad types
'a
*)
