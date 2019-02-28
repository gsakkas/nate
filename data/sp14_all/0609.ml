
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x c =
      let (s,t) = x in
      let sum = (c + s) + t in List.split (((sum / 10), (sum mod 10)) :: a) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x',x'') = x in
      let (c,s) = a in
      ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,14)-(17,75)
let (x' , x'') = x in
let (c , s) = a in
(((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (16,6)-(18,65)) NonRec [(TuplePat (Just (16,11)-(16,17)) [VarPat (Just (16,11)-(16,13)) "x'",VarPat (Just (16,14)-(16,17)) "x''"],Var (Just (16,21)-(16,22)) "x")] (Let (Just (17,6)-(18,65)) NonRec [(TuplePat (Just (17,11)-(17,14)) [VarPat (Just (17,11)-(17,12)) "c",VarPat (Just (17,13)-(17,14)) "s"],Var (Just (17,18)-(17,19)) "a")] (Tuple (Just (18,6)-(18,65)) [Bop (Just (18,7)-(18,30)) Div (Bop (Just (18,8)-(18,24)) Plus (Bop (Just (18,9)-(18,17)) Plus (Var (Just (18,10)-(18,11)) "c") (Var (Just (18,14)-(18,16)) "x'")) (Var (Just (18,20)-(18,23)) "x''")) (Lit (Just (18,27)-(18,29)) (LI 10)),ConApp (Just (18,32)-(18,64)) "::" (Just (Tuple (Just (18,33)-(18,63)) [Bop (Just (18,33)-(18,58)) Mod (Bop (Just (18,34)-(18,50)) Plus (Bop (Just (18,35)-(18,43)) Plus (Var (Just (18,36)-(18,37)) "c") (Var (Just (18,40)-(18,42)) "x'")) (Var (Just (18,46)-(18,49)) "x''")) (Lit (Just (18,55)-(18,57)) (LI 10)),Var (Just (18,62)-(18,63)) "s"])) Nothing]))
*)

(* typed spans
(16,6)-(18,65)
*)

(* correct types
(int * int list)
*)

(* bad types
int -> (int list * int list)
*)
