
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
(12,20)-(12,24)
h :: seen
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(12,20)-(12,28)
EMPTY
EmptyG

(12,25)-(12,26)
EMPTY
EmptyG

(13,8)-(13,58)
seen
VarG

(13,20)-(13,33)
filter t h
AppG (fromList [VarG])

(13,27)-(13,33)
EMPTY
EmptyG

*)
