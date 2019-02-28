
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem seen h) then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,44)
List.mem h seen = false
BopG (AppG (fromList [EmptyG])) LitG

(7,37)-(7,41)
EMPTY
EmptyG

(7,50)-(7,60)
false
LitG

*)

(* typed spans
(7,23)-(7,48)
(7,43)-(7,48)
*)

(* typed spans
bool
bool
*)

(* typed spans
bool
'a list
*)
