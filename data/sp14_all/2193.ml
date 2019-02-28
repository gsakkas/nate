
let rec clone x n =
  let rec helper xs sub depth =
    match depth > 0 with
    | false  -> xs
    | true  -> helper (sub :: xs) sub (depth - 1) in
  helper [] x n;;

let rec padZero l1 l2 =
  let sizeDif = (List.length l1) - (List.length l2) in
  let appendS = clone 0 (abs sizeDif) in
  if sizeDif < 0 then ((appendS @ l1), l2) else (l1, (appendS @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (op1,op2) ->
          let res = op1 + op2 in
          let (p1,p2) = a in
          (match p2 with
           | [] -> [res / 10; res mod 10]
           | a::b ->
               let re = a + (res mod 10) in (re / 10) :: (re mod 10) :: b) in
    let base = ([], []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper xs sub depth =
    match depth > 0 with
    | false  -> xs
    | true  -> helper (sub :: xs) sub (depth - 1) in
  helper [] x n;;

let rec padZero l1 l2 =
  let sizeDif = (List.length l1) - (List.length l2) in
  let appendS = clone 0 (abs sizeDif) in
  if sizeDif < 0 then ((appendS @ l1), l2) else (l1, (appendS @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (op1,op2) ->
          let res = op1 + op2 in
          let (p1,p2) = a in
          (match p2 with
           | [] -> (p1, [res / 10; res mod 10])
           | a::b ->
               let re = a + (res mod 10) in
               (p1, ((re / 10) :: (re mod 10) :: b))) in
    let base = ([], []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,19)-(25,41)
(p1 , [res / 10 ; res mod 10])
TupleG (fromList [VarG,ListG EmptyG])

(27,44)-(27,73)
(p1 , (re / 10) :: ((re mod 10) :: b))
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [BopG VarG LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG])))])))])

*)

(* changed exprs
Tuple (Just (25,19)-(25,47)) [Var (Just (25,20)-(25,22)) "p1",List (Just (25,24)-(25,46)) [Bop (Just (25,25)-(25,33)) Div (Var (Just (25,25)-(25,28)) "res") (Lit (Just (25,31)-(25,33)) (LI 10)),Bop (Just (25,35)-(25,45)) Mod (Var (Just (25,35)-(25,38)) "res") (Lit (Just (25,43)-(25,45)) (LI 10))] Nothing]
Tuple (Just (28,15)-(28,52)) [Var (Just (28,16)-(28,18)) "p1",ConApp (Just (28,20)-(28,51)) "::" (Just (Tuple (Just (28,21)-(28,50)) [Bop (Just (28,21)-(28,30)) Div (Var (Just (28,22)-(28,24)) "re") (Lit (Just (28,27)-(28,29)) (LI 10)),ConApp (Just (28,34)-(28,50)) "::" (Just (Tuple (Just (28,34)-(28,50)) [Bop (Just (28,34)-(28,45)) Mod (Var (Just (28,35)-(28,37)) "re") (Lit (Just (28,42)-(28,44)) (LI 10)),Var (Just (28,49)-(28,50)) "b"])) Nothing])) Nothing]
*)

(* typed spans
(25,19)-(25,47)
(28,15)-(28,52)
*)

(* correct types
('a list * int list)
('a list * int list)
*)

(* bad types
int list
int list
*)
