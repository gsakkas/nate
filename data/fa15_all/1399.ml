
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h, seen) then [] else [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if true then [] else [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,31)
EMPTY
EmptyG

(7,23)-(7,41)
EMPTY
EmptyG

(7,32)-(7,41)
EMPTY
EmptyG

(7,33)-(7,34)
EMPTY
EmptyG

(7,36)-(7,40)
true
LitG

*)
