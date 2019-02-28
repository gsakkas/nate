
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t; [h]);;

*)

(* changed spans
(2,58)-(2,75)
listReverse t; [h]
SeqG (AppG (fromList [EmptyG])) (ListG EmptyG)

*)

(* changed exprs
Seq (Just (3,36)-(3,56)) (App (Just (3,37)-(3,50)) (Var (Just (3,37)-(3,48)) "listReverse") [Var (Just (3,49)-(3,50)) "t"]) (List (Just (3,52)-(3,55)) [Var (Just (3,53)-(3,54)) "h"] Nothing)
*)

(* typed spans
(3,36)-(3,56)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
