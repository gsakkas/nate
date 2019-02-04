
let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  sepConcat ";" (List.map (fun t  -> let g = f t in g :: "]") l);;


(* fix

let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map (fun t  -> f t) l);;

*)

(* changed spans
(10,37)-(10,60)
EMPTY
EmptyG

(10,52)-(10,53)
EMPTY
EmptyG

(10,52)-(10,60)
EMPTY
EmptyG

(10,57)-(10,60)
EMPTY
EmptyG

*)
