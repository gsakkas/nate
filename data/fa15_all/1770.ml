
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
(5,15)-(5,16)
EMPTY
EmptyG

(5,26)-(5,36)
a
VarG

(12,20)-(12,21)
EMPTY
EmptyG

(13,8)-(13,64)
EMPTY
EmptyG

(13,25)-(13,39)
seen
VarG

(13,26)-(13,32)
let rest' = filter t h in
helper (seen' , rest')
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(13,33)-(13,38)
EMPTY
EmptyG

*)
