
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h, seen) then helper ((h :: seen), t) in
        let rest' = helper (seen', t) in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          if List.mem h seen
          then helper (seen, t)
          else helper ((h :: seen), t) in
        let rest' = helper (seen', t) in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,70)
EMPTY
EmptyG

(7,23)-(7,41)
List.mem h seen
AppG (fromList [VarG])

(7,32)-(7,41)
EMPTY
EmptyG

(7,55)-(7,66)
helper (h :: seen , t)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
