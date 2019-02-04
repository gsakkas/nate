
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        if List.mem h r
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,8)-(9,76)
EMPTY
EmptyG

(8,11)-(8,19)
EMPTY
EmptyG

(8,11)-(8,23)
EMPTY
EmptyG

(8,20)-(8,21)
EMPTY
EmptyG

(8,22)-(8,23)
EMPTY
EmptyG

(9,25)-(9,26)
EMPTY
EmptyG

(9,25)-(9,34)
EMPTY
EmptyG

*)
