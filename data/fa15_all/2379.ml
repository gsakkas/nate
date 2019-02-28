
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec matchHeads (x,y) =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead y)
      then matchHeads (t, (getTail y))
      else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | h::t -> matchHeads (listReverse (explode w)) (listReverse (explode w));;


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

(14,20)-(20,16)
fun x ->
  match x with
  | [] -> true
  | h :: t -> if getHead x = getHead (listReverse x)
              then matchHeads (getTail (listReverse t))
              else false
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(25,12)-(25,74)
matchHeads [["b"]]
AppG (fromList [ListG EmptyG])

(25,12)-(25,74)
matchHeads
VarG

*)

(* changed exprs
Lam (Just (6,20)-(7,57)) (VarPat (Just (6,20)-(6,21)) "l") (Case (Just (7,2)-(7,57)) (Var (Just (7,8)-(7,9)) "l") [(ConPat (Just (7,17)-(7,19)) "[]" Nothing,Nothing,List (Just (7,23)-(7,25)) [] Nothing),(ConsPat (Just (7,28)-(7,32)) (VarPat (Just (7,28)-(7,29)) "h") (VarPat (Just (7,31)-(7,32)) "t"),Nothing,App (Just (7,36)-(7,57)) (Var (Just (7,52)-(7,53)) "@") [App (Just (7,36)-(7,51)) (Var (Just (7,37)-(7,48)) "listReverse") [Var (Just (7,49)-(7,50)) "t"],List (Just (7,54)-(7,57)) [Var (Just (7,55)-(7,56)) "h"] Nothing])]) Nothing
Lam (Just (14,19)-(20,16)) (VarPat (Just (14,19)-(14,20)) "x") (Case (Just (15,2)-(20,16)) (Var (Just (15,8)-(15,9)) "x") [(ConPat (Just (16,4)-(16,6)) "[]" Nothing,Nothing,Lit (Just (16,10)-(16,14)) (LB True)),(ConsPat (Just (17,4)-(17,8)) (VarPat (Just (17,4)-(17,5)) "h") (VarPat (Just (17,7)-(17,8)) "t"),Nothing,Ite (Just (18,6)-(20,16)) (Bop (Just (18,9)-(18,48)) Eq (App (Just (18,9)-(18,20)) (Var (Just (18,10)-(18,17)) "getHead") [Var (Just (18,18)-(18,19)) "x"]) (App (Just (18,23)-(18,48)) (Var (Just (18,24)-(18,31)) "getHead") [App (Just (18,32)-(18,47)) (Var (Just (18,33)-(18,44)) "listReverse") [Var (Just (18,45)-(18,46)) "x"]])) (App (Just (19,11)-(19,47)) (Var (Just (19,11)-(19,21)) "matchHeads") [App (Just (19,22)-(19,47)) (Var (Just (19,23)-(19,30)) "getTail") [App (Just (19,31)-(19,46)) (Var (Just (19,32)-(19,43)) "listReverse") [Var (Just (19,44)-(19,45)) "t"]]]) (Lit (Just (20,11)-(20,16)) (LB False)))]) Nothing
App (Just (23,46)-(23,64)) (Var (Just (23,46)-(23,56)) "matchHeads") [List (Just (23,57)-(23,64)) [List (Just (23,58)-(23,63)) [Lit (Just (23,59)-(23,62)) (LS "b")] Nothing] Nothing]
Var (Just (23,46)-(23,56)) "matchHeads"
*)

(* typed spans
(6,20)-(7,57)
(14,19)-(20,16)
(23,46)-(23,64)
(23,46)-(23,56)
*)

(* correct types
string list list -> string list list
string list list -> bool
bool
string list list -> bool
*)

(* bad types
string -> char list
('a list list * 'a list list) -> bool
bool
bool
*)
