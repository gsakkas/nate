
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x / h) > 0
      then
        let asd = x / h in
        let asd2 = (x + h) - (asd * 10) in
        let asd3 = asd :: t in (asd3, (padZero (asd3 asd2)))
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x / h) > 0
      then
        let asd = x / h in
        let asd2 = (x + h) - (asd * 10) in
        let asd3 = asd :: t in
        let (_,asd4) = padZero asd3 (asd2 :: b) in (asd3, asd4)
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,31)-(25,60)
let (_ , asd4) =
  padZero asd3 (asd2 :: b) in
(asd3 , asd4)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(26,12)-(26,13)
(t , (x + h) :: b)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG VarG])))])

*)

(* changed exprs
Let (Just (26,8)-(26,63)) NonRec [(TuplePat (Just (26,13)-(26,19)) [WildPat (Just (26,13)-(26,14)),VarPat (Just (26,15)-(26,19)) "asd4"],App (Just (26,23)-(26,47)) (Var (Just (26,23)-(26,30)) "padZero") [Var (Just (26,31)-(26,35)) "asd3",ConApp (Just (26,36)-(26,47)) "::" (Just (Tuple (Just (26,37)-(26,46)) [Var (Just (26,37)-(26,41)) "asd2",Var (Just (26,45)-(26,46)) "b"])) Nothing])] (Tuple (Just (26,51)-(26,63)) [Var (Just (26,52)-(26,56)) "asd3",Var (Just (26,58)-(26,62)) "asd4"])
Tuple (Just (27,11)-(27,30)) [Var (Just (27,12)-(27,13)) "t",ConApp (Just (27,15)-(27,29)) "::" (Just (Tuple (Just (27,16)-(27,28)) [Bop (Just (27,16)-(27,23)) Plus (Var (Just (27,17)-(27,18)) "x") (Var (Just (27,21)-(27,22)) "h"),Var (Just (27,27)-(27,28)) "b"])) Nothing]
*)

(* typed spans
(26,8)-(26,63)
(27,11)-(27,30)
*)

(* correct types
(int list * int list)
(int list * int list)
*)

(* bad types
(int list * int list -> (int list * int list))
int list
*)
