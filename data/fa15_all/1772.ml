
let rec filter l a =
  match l with
  | [] -> []
  | h::t -> if h = a then filter t a else h :: (filter t a);;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = seen @ h in
        let rest' = filter (t, h) in helper (seen', rest') in
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
(12,20)-(12,28)
h :: seen
ConAppG (Just (TupleG (fromList [VarG])))

(13,20)-(13,33)
filter t h
AppG (fromList [VarG])

*)

(* changed exprs
ConApp (Just (12,20)-(12,29)) "::" (Just (Tuple (Just (12,20)-(12,29)) [Var (Just (12,20)-(12,21)) "h",Var (Just (12,25)-(12,29)) "seen"])) Nothing
App (Just (13,20)-(13,30)) (Var (Just (13,20)-(13,26)) "filter") [Var (Just (13,27)-(13,28)) "t",Var (Just (13,29)-(13,30)) "h"]
*)

(* typed spans
(12,20)-(12,29)
(13,20)-(13,30)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list
'a list list
*)
