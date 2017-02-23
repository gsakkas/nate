
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
(7,8)-(8,76)
(7,11)-(7,14)
(7,11)-(7,32)
(7,15)-(7,32)
(7,16)-(7,24)
(7,25)-(7,29)
(7,30)-(7,31)
(8,13)-(8,76)
(8,38)-(8,76)
(9,2)-(9,10)
*)

(* type error slice
(7,15)-(7,32)
(7,16)-(7,24)
(7,25)-(7,29)
(7,30)-(7,31)
(8,25)-(8,26)
(8,25)-(8,34)
(8,25)-(8,34)
(8,30)-(8,34)
*)

(* all spans
(2,21)-(9,27)
(3,2)-(9,27)
(3,18)-(8,76)
(4,4)-(8,76)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(8,76)
(7,11)-(7,32)
(7,11)-(7,14)
(7,15)-(7,32)
(7,16)-(7,24)
(7,25)-(7,29)
(7,30)-(7,31)
(8,13)-(8,76)
(8,25)-(8,34)
(8,25)-(8,26)
(8,30)-(8,34)
(8,38)-(8,76)
(8,50)-(8,51)
(8,55)-(8,76)
(8,55)-(8,61)
(8,62)-(8,76)
(8,63)-(8,68)
(8,70)-(8,75)
(7,8)-(8,76)
(9,2)-(9,27)
(9,2)-(9,10)
(9,11)-(9,27)
(9,12)-(9,18)
(9,19)-(9,26)
(9,20)-(9,22)
(9,24)-(9,25)
*)
