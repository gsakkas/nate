
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        if not (List.mem seen h)
        then let seen' = h :: rest in let rest' = t in helper (seen', rest') in
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

(7,11)-(7,32)
EMPTY
EmptyG

(7,15)-(7,32)
EMPTY
EmptyG

(7,16)-(7,24)
EMPTY
EmptyG

(7,25)-(7,29)
EMPTY
EmptyG

(7,30)-(7,31)
EMPTY
EmptyG

(8,30)-(8,34)
seen
VarG

*)
