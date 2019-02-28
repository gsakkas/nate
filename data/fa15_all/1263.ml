
let stringOfList f l =
  let l' = List.map f l in
  match l' with
  | [] -> []
  | _ ->
      let rec makeString res =
        match res with | [] -> "" | h::t -> h ^ (makeString t) in
      makeString l';;


(* fix

let stringOfList f l =
  let l' = List.map f l in
  match l' with
  | [] -> ""
  | _ ->
      let rec makeString res =
        match res with | [] -> "" | h::t -> h ^ (makeString t) in
      makeString l';;

*)

(* changed spans
(5,10)-(5,12)
""
LitG

*)

(* changed exprs
Lit (Just (5,10)-(5,12)) (LS "")
*)

(* typed spans
(5,10)-(5,12)
*)

(* correct types
string
*)

(* bad types
'a list
*)
