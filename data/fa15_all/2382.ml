
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead (listReverse x))
      then matchHeads (getTail (listReverse t))
      else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | h::t -> matchHeads (listReverse (explode w));;


(* fix

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
  match explode w with | [] -> true | h::t -> matchHeads [["b"]];;

*)

(* changed spans
(6,12)-(9,6)
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(25,23)-(25,48)
[["b"]]
ListG (ListG EmptyG)

*)

(* changed exprs
Lam (Just (6,20)-(7,57)) (VarPat (Just (6,20)-(6,21)) "l") (Case (Just (7,2)-(7,57)) (Var (Just (7,8)-(7,9)) "l") [(ConPat (Just (7,17)-(7,19)) "[]" Nothing,Nothing,List (Just (7,23)-(7,25)) [] Nothing),(ConsPat (Just (7,28)-(7,32)) (VarPat (Just (7,28)-(7,29)) "h") (VarPat (Just (7,31)-(7,32)) "t"),Nothing,App (Just (7,36)-(7,57)) (Var (Just (7,52)-(7,53)) "@") [App (Just (7,36)-(7,51)) (Var (Just (7,37)-(7,48)) "listReverse") [Var (Just (7,49)-(7,50)) "t"],List (Just (7,54)-(7,57)) [Var (Just (7,55)-(7,56)) "h"] Nothing])]) Nothing
List (Just (23,57)-(23,64)) [List (Just (23,58)-(23,63)) [Lit (Just (23,59)-(23,62)) (LS "b")] Nothing] Nothing
*)

(* typed spans
(6,20)-(7,57)
(23,57)-(23,64)
*)

(* correct types
string list list -> string list list
string list list
*)

(* bad types
string -> char list
'a list list
*)
