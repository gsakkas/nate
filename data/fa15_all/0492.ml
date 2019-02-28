
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in (((x1 + x2) / 10), ((x1 + x2) mod 10)) in
    let base = ([], []) in
    let args = let (l1',l2') = padZero l1 l2 in List.combine l1' l2' in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,sum) = a in
      (((x1 + x2) / 10), ((((x1 + x2) + carry) mod 10) :: sum)) in
    let base = (0, []) in
    let args = let (l1',l2') = padZero l1 l2 in List.combine l1' l2' in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,35)-(16,73)
let (carry , sum) = a in
((x1 + x2) / 10 , (((x1 + x2) + carry) mod 10) :: sum)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(17,16)-(17,18)
0
LitG

*)

(* changed exprs
Let (Just (18,6)-(19,63)) NonRec [(TuplePat (Just (18,11)-(18,20)) [VarPat (Just (18,11)-(18,16)) "carry",VarPat (Just (18,17)-(18,20)) "sum"],Var (Just (18,24)-(18,25)) "a")] (Tuple (Just (19,6)-(19,63)) [Bop (Just (19,7)-(19,23)) Div (Bop (Just (19,8)-(19,17)) Plus (Var (Just (19,9)-(19,11)) "x1") (Var (Just (19,14)-(19,16)) "x2")) (Lit (Just (19,20)-(19,22)) (LI 10)),ConApp (Just (19,25)-(19,62)) "::" (Just (Tuple (Just (19,26)-(19,61)) [Bop (Just (19,26)-(19,54)) Mod (Bop (Just (19,27)-(19,46)) Plus (Bop (Just (19,28)-(19,37)) Plus (Var (Just (19,29)-(19,31)) "x1") (Var (Just (19,34)-(19,36)) "x2")) (Var (Just (19,40)-(19,45)) "carry")) (Lit (Just (19,51)-(19,53)) (LI 10)),Var (Just (19,58)-(19,61)) "sum"])) Nothing])
Lit (Just (20,16)-(20,17)) (LI 0)
*)

(* typed spans
(18,6)-(19,63)
(20,16)-(20,17)
*)

(* correct types
(int * int list)
int
*)

(* bad types
(int * int)
'a list
*)
