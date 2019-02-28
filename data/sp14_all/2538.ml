
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | hd::tl ->
        let seen' = if (List.mem tl 2) = true then seen else hd :: seen in
        let rest' = tl in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | hd::tl ->
        let seen' = if (List.mem hd seen) = true then seen else hd :: seen in
        let rest' = tl in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,36)-(7,37)
hd
VarG

(7,41)-(7,45)
seen
VarG

*)

(* changed exprs
Var (Just (7,33)-(7,35)) "hd"
Var (Just (7,36)-(7,40)) "seen"
*)

(* typed spans
(7,33)-(7,35)
(7,36)-(7,40)
*)

(* correct types
'a
'a list
*)

(* bad types
int
bool
*)
