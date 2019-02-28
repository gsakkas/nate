
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        if List.mem h seen
        then h :: seen'
        else (let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = l in
        if List.mem h l
        then h :: seen'
        else (let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,21)
l
VarG

(8,22)-(8,26)
l
VarG

*)

(* changed exprs
Var (Just (7,20)-(7,21)) "l"
Var (Just (8,22)-(8,23)) "l"
*)

(* typed spans
(7,20)-(7,21)
(8,22)-(8,23)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list
'a list list
*)
