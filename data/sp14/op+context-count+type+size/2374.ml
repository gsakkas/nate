
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        if not (List.mem seen h)
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
(7,9)-(8,76)
(7,12)-(7,15)
(7,12)-(7,32)
(7,17)-(7,25)
(7,17)-(7,32)
(7,26)-(7,30)
(7,31)-(7,32)
(8,14)-(8,76)
(8,39)-(8,76)
*)

(* type error slice
(7,17)-(7,25)
(7,17)-(7,32)
(7,26)-(7,30)
(7,31)-(7,32)
(8,26)-(8,27)
(8,26)-(8,35)
(8,26)-(8,35)
(8,31)-(8,35)
*)