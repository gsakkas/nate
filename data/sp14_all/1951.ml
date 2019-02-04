
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h :: seen in
        let rest' = t in helper (seen', rest') in
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
(7,20)-(7,53)
EMPTY
EmptyG

(7,23)-(7,31)
EMPTY
EmptyG

(7,23)-(7,38)
EMPTY
EmptyG

(7,32)-(7,33)
EMPTY
EmptyG

(7,34)-(7,38)
EMPTY
EmptyG

*)
