
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = seen in
        (if (List.mem h List.rev t) = false then h :: seen';
         (let rest' = t in helper (seen', rest'))) in
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
(7,20)-(7,24)
EMPTY
EmptyG

(8,8)-(9,50)
EMPTY
EmptyG

(8,9)-(8,59)
seen
VarG

(8,12)-(8,35)
EMPTY
EmptyG

(8,12)-(8,43)
EMPTY
EmptyG

(8,13)-(8,21)
EMPTY
EmptyG

(8,22)-(8,23)
EMPTY
EmptyG

(8,24)-(8,32)
EMPTY
EmptyG

(8,33)-(8,34)
EMPTY
EmptyG

(8,38)-(8,43)
EMPTY
EmptyG

(8,54)-(8,59)
EMPTY
EmptyG

*)

(* typed spans
't38 list
*)
