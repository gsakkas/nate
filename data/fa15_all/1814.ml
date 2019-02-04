
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = h :: seen in
        if (List.mem h r) = false
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(9,8)-(10,76)
EMPTY
EmptyG

(9,11)-(9,25)
EMPTY
EmptyG

(9,11)-(9,33)
EMPTY
EmptyG

(9,12)-(9,20)
EMPTY
EmptyG

(9,21)-(9,22)
EMPTY
EmptyG

(9,23)-(9,24)
EMPTY
EmptyG

(9,28)-(9,33)
EMPTY
EmptyG

(10,13)-(10,76)
EMPTY
EmptyG

(10,25)-(10,26)
EMPTY
EmptyG

(10,25)-(10,34)
EMPTY
EmptyG

(10,30)-(10,34)
EMPTY
EmptyG

*)
