
let rec mulByDigit i l =
  let rec mulHelper l' =
    match l' with
    | [] -> (0, [])
    | h::t ->
        let (carry,rest) = mulHelper t in
        let prod = (i * h) + carry in ((prod / 10), ((prod mod 10) :: rest)) in
  let (_,ans) = mulHelper List.rev (0 :: l) in ans;;


(* fix

let rec mulByDigit i l =
  let rec mulHelper l' =
    match l' with
    | [] -> (0, [])
    | h::t ->
        let (carry,rest) = mulHelper t in
        let prod = (i * h) + carry in ((prod / 10), ((prod mod 10) :: rest)) in
  let (_,ans) = mulHelper (List.rev (0 :: l)) in ans;;

*)

(* changed spans
(9,16)-(9,43)
mulHelper (List.rev (0 :: l))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (9,16)-(9,45)) (Var (Just (9,16)-(9,25)) "mulHelper") [App (Just (9,26)-(9,45)) (Var (Just (9,27)-(9,35)) "List.rev") [ConApp (Just (9,36)-(9,44)) "::" (Just (Tuple (Just (9,37)-(9,43)) [Lit (Just (9,37)-(9,38)) (LI 0),Var (Just (9,42)-(9,43)) "l"])) Nothing]]
*)

(* typed spans
(9,16)-(9,45)
*)

(* correct types
(int * int list)
*)

(* bad types
('a * 'b)
*)
