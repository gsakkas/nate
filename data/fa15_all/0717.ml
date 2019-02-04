
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        let rest' = if List.mem (seen', seen) then t else seen' @ seen in
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

(8,23)-(8,45)
List.mem h seen
AppG (fromList [VarG])

(8,32)-(8,45)
EMPTY
EmptyG

(8,33)-(8,38)
h
VarG

(8,51)-(8,52)
EMPTY
EmptyG

(8,58)-(8,63)
EMPTY
EmptyG

(8,58)-(8,70)
EMPTY
EmptyG

(8,64)-(8,65)
EMPTY
EmptyG

(9,8)-(9,29)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)
