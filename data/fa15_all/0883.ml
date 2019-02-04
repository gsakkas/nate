
let stringOfList f l =
  match l with | [] -> "[]" | x::[] -> "[" ^ (x ^ "]") | l -> List.map (f, l);;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::[] -> "[" ^ (x ^ "]")
  | l -> sepConcat "" (List.map f l);;

*)

(* changed spans
(2,17)-(3,77)
fun sep ->
  fun sl ->
    match sl with
    | [] -> ""
    | h :: t -> (let f =
                   fun a ->
                     fun x -> a ^ (sep ^ x) in
                 let base = h in
                 let l = t in
                 List.fold_left f base l)
LamG (LamG EmptyG)

(3,62)-(3,70)
List.map f l
AppG (fromList [VarG])

(3,62)-(3,77)
sepConcat "" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(3,71)-(3,77)
EMPTY
EmptyG

*)
