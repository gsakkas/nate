
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then seen else seen :: h in
        let rest' = t in helper (seen', rest') in
  helper ([], l);;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,51)-(7,55)
EMPTY
EmptyG

(8,8)-(8,46)
seen
VarG

(9,2)-(9,8)
helper ([] , l)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* typed spans
(7,56)-(7,60)
(9,11)-(9,27)
*)

(* typed spans
'a list
'a list
*)

(* typed spans
'a
('a list * 'a list list) -> 'a
*)
