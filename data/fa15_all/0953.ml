
let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map (fun t  -> ((f t) ^ "]") l));;


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
(9,37)-(9,75)
List.map (fun t -> f t) l
AppG (fromList [VarG,LamG EmptyG])

(9,58)-(9,71)
EMPTY
EmptyG

(9,59)-(9,64)
EMPTY
EmptyG

(9,65)-(9,66)
EMPTY
EmptyG

(9,67)-(9,70)
EMPTY
EmptyG

*)
