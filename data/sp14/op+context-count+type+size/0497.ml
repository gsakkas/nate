
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | hd::tl ->
        let seen' = if (List.mem tl [2]) = true then seen else hd :: seen in
        let rest' = tl in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | hd::tl ->
        let seen' = if (List.mem hd seen) = true then seen else hd :: seen in
        let rest' = tl in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,33)-(7,35)
(7,36)-(7,39)
(7,37)-(7,38)
(7,43)-(7,47)
*)

(* type error slice
(4,4)-(8,47)
(4,4)-(8,47)
(7,23)-(7,40)
(7,24)-(7,32)
(7,33)-(7,35)
(7,36)-(7,39)
(7,36)-(7,39)
(7,37)-(7,38)
*)
