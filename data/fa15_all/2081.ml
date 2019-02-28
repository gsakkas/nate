
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  match w with
  | [] -> true
  | h::t ->
      let separated = explode w in
      let reversed = listReverse separated in
      if separated == reversed then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  let separated = explode w in
  let reversed = listReverse separated in
  if separated == reversed then true else false;;

*)

(* changed spans
(11,2)-(16,51)
let separated = explode w in
let reversed =
  listReverse separated in
if separated = reversed
then true
else false
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (11,2)-(13,47)) NonRec [(VarPat (Just (11,6)-(11,15)) "separated",App (Just (11,18)-(11,27)) (Var (Just (11,18)-(11,25)) "explode") [Var (Just (11,26)-(11,27)) "w"])] (Let (Just (12,2)-(13,47)) NonRec [(VarPat (Just (12,6)-(12,14)) "reversed",App (Just (12,17)-(12,38)) (Var (Just (12,17)-(12,28)) "listReverse") [Var (Just (12,29)-(12,38)) "separated"])] (Ite (Just (13,2)-(13,47)) (Bop (Just (13,5)-(13,26)) Eq (Var (Just (13,5)-(13,14)) "separated") (Var (Just (13,18)-(13,26)) "reversed")) (Lit (Just (13,32)-(13,36)) (LB True)) (Lit (Just (13,42)-(13,47)) (LB False))))
*)

(* typed spans
(11,2)-(13,47)
*)

(* correct types
bool
*)

(* bad types
bool
*)
