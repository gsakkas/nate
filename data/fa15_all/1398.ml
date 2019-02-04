
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem (h, seen) with | true  -> [] | false  -> [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if true then [] else [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,10)-(8,69)
EMPTY
EmptyG

(8,16)-(8,24)
EMPTY
EmptyG

(8,16)-(8,34)
EMPTY
EmptyG

(8,25)-(8,34)
EMPTY
EmptyG

(8,26)-(8,27)
EMPTY
EmptyG

(8,29)-(8,33)
if true then [] else [h]
IteG LitG (ListG EmptyG Nothing) (ListG EmptyG Nothing)

(8,51)-(8,53)
true
LitG

*)
