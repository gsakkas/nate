
let bigMul l1 l2 =
  let f a x =
    match x with
    | (x1,x2) ->
        (match a with
         | (h1,h2::t2) ->
             let mul = ((x1 * x2) * h1) + h2 in ((h1 + 1), (mul / 10)) ::
               (mul mod 10) :: t2
         | (_,_) -> (0, [0])) in
  let base = (1, [0]) in
  let args = List.rev (List.combine l1 l2) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x =
    match x with
    | (x1,x2) ->
        (match a with
         | (h1,h2::t2) ->
             let mul = ((x1 * x2) * h1) + h2 in
             ((h1 + 1), ((mul / 10) :: (mul mod 10) :: t2))
         | (_,_) -> (0, [0])) in
  let base = (1, [0]) in
  let args = List.rev (List.combine l1 l2) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(8,48)-(9,33)
(h1 + 1 , (mul / 10) :: ((mul mod 10) :: t2))
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG)])

*)

(* changed exprs
Tuple (Just (9,13)-(9,59)) [Bop (Just (9,14)-(9,22)) Plus (Var (Just (9,15)-(9,17)) "h1") (Lit (Just (9,20)-(9,21)) (LI 1)),ConApp (Just (9,24)-(9,58)) "::" (Just (Tuple (Just (9,25)-(9,57)) [Bop (Just (9,25)-(9,35)) Div (Var (Just (9,26)-(9,29)) "mul") (Lit (Just (9,32)-(9,34)) (LI 10)),ConApp (Just (9,39)-(9,57)) "::" (Just (Tuple (Just (9,39)-(9,57)) [Bop (Just (9,39)-(9,51)) Mod (Var (Just (9,40)-(9,43)) "mul") (Lit (Just (9,48)-(9,50)) (LI 10)),Var (Just (9,55)-(9,57)) "t2"])) Nothing])) Nothing]
*)

(* typed spans
(9,13)-(9,59)
*)

(* correct types
(int * int list)
*)

(* bad types
(int * int) list
*)
