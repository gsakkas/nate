
let rec append_new xs1 xs2 =
  match xs1 with | [] -> xs2 | head::tail -> head :: (append_new tail xs2);;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else append_new h seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else [h] @ seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(2,19)-(3,74)
EMPTY
EmptyG

(2,23)-(3,74)
EMPTY
EmptyG

(3,2)-(3,74)
EMPTY
EmptyG

(3,8)-(3,11)
EMPTY
EmptyG

(3,25)-(3,28)
EMPTY
EmptyG

(3,45)-(3,49)
EMPTY
EmptyG

(3,45)-(3,74)
EMPTY
EmptyG

(3,53)-(3,74)
EMPTY
EmptyG

(3,54)-(3,64)
EMPTY
EmptyG

(3,65)-(3,69)
EMPTY
EmptyG

(3,70)-(3,73)
EMPTY
EmptyG

(10,54)-(10,64)
(@)
VarG

(10,65)-(10,66)
[h]
ListG VarG Nothing

*)
