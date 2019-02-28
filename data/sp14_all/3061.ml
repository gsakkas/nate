
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
(10,54)-(10,64)
(@)
VarG

(10,54)-(10,64)
[h]
ListG VarG

*)

(* changed exprs
Var (Just (7,58)-(7,59)) "@"
List (Just (7,54)-(7,57)) [Var (Just (7,55)-(7,56)) "h"] Nothing
*)

(* typed spans
(7,58)-(7,59)
(7,54)-(7,57)
*)

(* correct types
'a list -> 'a list -> 'a list
'a list
*)

(* bad types
'a list -> 'a list -> 'a list
'a list -> 'a list -> 'a list
*)
