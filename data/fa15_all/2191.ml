
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem (h, seen)) = true then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,43)
List.mem h seen
AppG (fromList [VarG])

(7,23)-(7,50)
EMPTY
EmptyG

(7,33)-(7,42)
EMPTY
EmptyG

(7,46)-(7,50)
EMPTY
EmptyG

*)
