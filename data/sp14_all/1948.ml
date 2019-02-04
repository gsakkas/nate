
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        if not List.mem h seen
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
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
(7,8)-(8,76)
EMPTY
EmptyG

(7,11)-(7,14)
EMPTY
EmptyG

(7,11)-(7,30)
EMPTY
EmptyG

(7,15)-(7,23)
EMPTY
EmptyG

(7,24)-(7,25)
EMPTY
EmptyG

(7,26)-(7,30)
EMPTY
EmptyG

*)
