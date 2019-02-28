
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then [seen] else [seen @ h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,44)-(7,50)
EMPTY
EmptyG

(7,56)-(7,66)
EMPTY
EmptyG

(7,64)-(7,65)
[h]
ListG VarG

*)

(* typed spans
(7,61)-(7,64)
*)

(* typed spans
'a list
*)

(* typed spans
'a
*)
