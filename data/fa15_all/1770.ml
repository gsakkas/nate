
let rec filter l a =
  match l with
  | [] -> []
  | h::t -> if a = h then filter t a else h :: (filter t a);;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        let rest' = h :: (filter (t h)) in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let rec filter l a =
  match l with
  | [] -> []
  | h::t -> if h = a then filter t a else h :: (filter t a);;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h :: seen in
        let rest' = filter t h in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(5,19)-(5,20)
a
VarG

(13,8)-(13,64)
h :: seen
ConAppG (Just (TupleG (fromList [VarG])))

(13,8)-(13,64)
h
VarG

(13,8)-(13,64)
seen
VarG

(13,25)-(13,39)
let rest' = filter t h in
helper (seen' , rest')
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(13,33)-(13,38)
t
VarG

(13,33)-(13,38)
h
VarG

*)

(* changed exprs
Var (Just (5,19)-(5,20)) "a"
ConApp (Just (12,20)-(12,29)) "::" (Just (Tuple (Just (12,20)-(12,29)) [Var (Just (12,20)-(12,21)) "h",Var (Just (12,25)-(12,29)) "seen"])) Nothing
Var (Just (12,20)-(12,21)) "h"
Var (Just (12,25)-(12,29)) "seen"
Let (Just (13,8)-(13,55)) NonRec [(VarPat (Just (13,12)-(13,17)) "rest'",App (Just (13,20)-(13,30)) (Var (Just (13,20)-(13,26)) "filter") [Var (Just (13,27)-(13,28)) "t",Var (Just (13,29)-(13,30)) "h"])] (App (Just (13,34)-(13,55)) (Var (Just (13,34)-(13,40)) "helper") [Tuple (Just (13,41)-(13,55)) [Var (Just (13,42)-(13,47)) "seen'",Var (Just (13,49)-(13,54)) "rest'"]])
Var (Just (13,27)-(13,28)) "t"
Var (Just (13,29)-(13,30)) "h"
*)

(* typed spans
(5,19)-(5,20)
(12,20)-(12,29)
(12,20)-(12,21)
(12,25)-(12,29)
(13,8)-(13,55)
(13,27)-(13,28)
(13,29)-(13,30)
*)

(* correct types
'a
'a list
'a
'a list
'a list
'a list
'a
*)

(* bad types
'a
'a list
'a list
'a list
'a -> 'a list
'a list
'a list
*)
