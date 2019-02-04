
let stringOfList f l =
  ("[" (fun x  -> fun acc  -> x ^ ("; " ^ acc)) List.fold_left (^) ""
     (List.map f l))
    ^ "]";;


(* fix

let stringOfList f l =
  "[" ^
    ((List.fold_left (fun x  -> fun acc  -> x ^ ("; " ^ acc)) ""
        (List.map f l))
       ^ "]");;

*)

(* changed spans
(3,2)-(4,20)
EMPTY
EmptyG

(3,7)-(3,47)
List.fold_left (fun x ->
                  fun acc -> x ^ ("; " ^ acc))
               "" (List.map f l) ^ "]"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(3,48)-(3,62)
EMPTY
EmptyG

(3,63)-(3,66)
EMPTY
EmptyG

*)
