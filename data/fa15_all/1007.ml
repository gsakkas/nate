
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else (let seen' = [] @ h in let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else
          (let seen' = seen @ [h] in let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;

*)

(* changed spans
(10,26)-(10,28)
seen
VarG

(10,31)-(10,32)
[h]
ListG VarG

*)

(* changed exprs
Var (Just (11,23)-(11,27)) "seen"
List (Just (11,30)-(11,33)) [Var (Just (11,31)-(11,32)) "h"] Nothing
*)

(* typed spans
(11,23)-(11,27)
(11,30)-(11,33)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list
'a list
*)
