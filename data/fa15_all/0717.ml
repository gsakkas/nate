
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

(8,23)-(8,45)
List.mem h seen
AppG (fromList [VarG])

(8,32)-(8,45)
h
VarG

(8,51)-(8,52)
EMPTY
EmptyG

(9,8)-(9,29)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)

(* typed spans
(7,23)-(7,38)
(7,32)-(7,33)
(8,8)-(8,46)
*)

(* typed spans
bool
'a
'a list
*)

(* typed spans
('a list * 'a list) list -> bool
('a list * 'a list)
'a list
*)
