
let stringOfList f l = "[" ^ ((List.map f l) ^ "]");;


(* fix

let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "; " (List.map f l)) ^ "]");;

*)

(* changed spans
(2,17)-(2,51)
fun sep ->
  fun sl ->
    match sl with
    | [] -> ""
    | h :: t -> (let f =
                   fun a -> fun x -> a ^ x in
                 let base = h in
                 let l = t in
                 List.fold_left f base l)
LamG (LamG EmptyG)

(2,31)-(2,39)
List.map f l
AppG (fromList [VarG])

*)
