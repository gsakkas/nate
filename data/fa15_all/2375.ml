
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let getHeads y = match listReverse y with | [] -> [] | h::t -> [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match explode x with
  | h::t ->
      if (getHeads (explode x)) = []
      then true
      else if [h] = (getHeads t) then true else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let getHeads y = match listReverse y with | [] -> [] | h::t -> [h];;

let loseTail z = match listReverse z with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with
  | h::t ->
      if (getHeads x) = []
      then true
      else if [h] = (getHeads t) then matchHeads (loseTail t) else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(7,12)-(10,6)
fun z ->
  match listReverse z with
  | [] -> []
  | h :: t -> t
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(13,8)-(13,17)
x
VarG

(15,19)-(15,30)
x
VarG

(17,38)-(17,42)
matchHeads (loseTail t)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (7,13)-(7,64)) (VarPat (Just (7,13)-(7,14)) "z") (Case (Just (7,17)-(7,64)) (App (Just (7,23)-(7,36)) (Var (Just (7,23)-(7,34)) "listReverse") [Var (Just (7,35)-(7,36)) "z"]) [(ConPat (Just (7,44)-(7,46)) "[]" Nothing,Nothing,List (Just (7,50)-(7,52)) [] Nothing),(ConsPat (Just (7,55)-(7,59)) (VarPat (Just (7,55)-(7,56)) "h") (VarPat (Just (7,58)-(7,59)) "t"),Nothing,Var (Just (7,63)-(7,64)) "t")]) Nothing
Var (Just (15,8)-(15,9)) "x"
Var (Just (17,19)-(17,20)) "x"
App (Just (19,38)-(19,61)) (Var (Just (19,38)-(19,48)) "matchHeads") [App (Just (19,49)-(19,61)) (Var (Just (19,50)-(19,58)) "loseTail") [Var (Just (19,59)-(19,60)) "t"]]
*)

(* typed spans
(7,13)-(7,64)
(15,8)-(15,9)
(17,19)-(17,20)
(19,38)-(19,61)
*)

(* correct types
char list -> char list
char list
char list
bool
*)

(* bad types
string -> char list
char list
char list
bool
*)
