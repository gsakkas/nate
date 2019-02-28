
let rec mulByDigit i l =
  let rec mulHelper l' =
    match l' with
    | [] -> (0, [])
    | h::t ->
        let (carry,rest) = mulHelper t in
        let prod = (i * h) + carry in ((prod / 10), ((prod mod 10) :: rest)) in
  let (_,ans) = (mulHelper 0) :: (List.rev l) in ans;;


(* fix

let rec mulByDigit i l =
  let rec mulHelper l' =
    match l' with
    | [] -> (0, [])
    | h::t ->
        let (carry,rest) = mulHelper t in
        let prod = (i * h) + carry in ((prod / 10), ((prod mod 10) :: rest)) in
  let (_,ans) = mulHelper (0 :: (List.rev l)) in ans;;

*)

(* changed spans
(9,16)-(9,45)
mulHelper (0 :: (List.rev l))
AppG (fromList [ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),LitG])))])

*)

(* changed exprs
App (Just (9,16)-(9,45)) (Var (Just (9,16)-(9,25)) "mulHelper") [ConApp (Just (9,26)-(9,45)) "::" (Just (Tuple (Just (9,27)-(9,44)) [Lit (Just (9,27)-(9,28)) (LI 0),App (Just (9,32)-(9,44)) (Var (Just (9,33)-(9,41)) "List.rev") [Var (Just (9,42)-(9,43)) "l"]])) Nothing]
*)

(* typed spans
(9,16)-(9,45)
*)

(* correct types
(int * int list)
*)

(* bad types
'a list
*)
