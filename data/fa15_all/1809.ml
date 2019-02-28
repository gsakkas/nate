
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let rest' = List.rev t in
        let seen' = seen in
        if (List.mem h rest') = false then h :: (seen' helper (seen', rest')) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,8)-(9,77)
EMPTY
EmptyG

(8,20)-(8,24)
EMPTY
EmptyG

(9,8)-(9,77)
EMPTY
EmptyG

(9,48)-(9,77)
seen
VarG

(9,55)-(9,61)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)

(* typed spans
(6,31)-(6,35)
(6,39)-(6,77)
*)

(* typed spans
'a list
'a list
*)

(* typed spans
'a list
(unit * 'a list) -> unit
*)
