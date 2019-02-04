
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        if List.mem h seen
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  helper ([], l);;

*)

(* changed spans
(7,8)-(8,76)
EMPTY
EmptyG

(7,11)-(7,19)
EMPTY
EmptyG

(7,11)-(7,26)
EMPTY
EmptyG

(7,20)-(7,21)
EMPTY
EmptyG

(7,22)-(7,26)
EMPTY
EmptyG

(9,2)-(9,10)
EMPTY
EmptyG

(9,11)-(9,27)
EMPTY
EmptyG

*)
