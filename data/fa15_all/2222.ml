
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h, l) then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem h l) then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,31)
not
VarG

(7,23)-(7,31)
List.mem h l
AppG (fromList [VarG])

(7,32)-(7,38)
h
VarG

(7,32)-(7,38)
l
VarG

*)

(* changed exprs
Var (Just (7,23)-(7,26)) "not"
App (Just (7,27)-(7,41)) (Var (Just (7,28)-(7,36)) "List.mem") [Var (Just (7,37)-(7,38)) "h",Var (Just (7,39)-(7,40)) "l"]
Var (Just (7,37)-(7,38)) "h"
Var (Just (7,39)-(7,40)) "l"
*)

(* typed spans
(7,23)-(7,26)
(7,27)-(7,41)
(7,37)-(7,38)
(7,39)-(7,40)
*)

(* correct types
bool -> bool
bool
'a
'a list
*)

(* bad types
('a * 'a list) -> ('a * 'a list) list -> bool
('a * 'a list) -> ('a * 'a list) list -> bool
('a * 'a list)
('a * 'a list)
*)
