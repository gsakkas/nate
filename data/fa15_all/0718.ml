
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        let rest' = if ((List.mem seen'), seen) then t else seen' @ seen in
        helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,21)
EMPTY
EmptyG

(8,8)-(9,29)
EMPTY
EmptyG

(8,23)-(8,47)
EMPTY
EmptyG

(8,24)-(8,40)
List.mem h seen
AppG (fromList [VarG])

(8,34)-(8,39)
h
VarG

(8,53)-(8,54)
EMPTY
EmptyG

(8,60)-(8,65)
EMPTY
EmptyG

(8,60)-(8,72)
EMPTY
EmptyG

(8,66)-(8,67)
EMPTY
EmptyG

(9,8)-(9,29)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)
