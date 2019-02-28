
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
        let seen' = if 3 > 0 then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,38)
3 > 0
BopG LitG LitG

*)

(* changed exprs
Bop (Just (7,23)-(7,28)) Gt (Lit (Just (7,23)-(7,24)) (LI 3)) (Lit (Just (7,27)-(7,28)) (LI 0))
*)

(* typed spans
(7,23)-(7,28)
*)

(* correct types
bool
*)

(* bad types
('a * 'a list) list -> bool
*)
