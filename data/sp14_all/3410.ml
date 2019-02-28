
let rec removeZero l =
  match l with | x::xs -> if x = 0 then removeZero xs else l | _ -> l;;

let rec mulByDigit i l =
  let lre = List.rev l in
  let rec helper carry accum lrev =
    match lrev with
    | [] -> removeZero accum
    | x::xs ->
        if carry = 1
        then
          (match accum with
           | x1'::xs' ->
               let num = (x * i) + x1' in
               if num < 10
               then helper 0 (num :: xs') xs
               else (helper 1 ((num / 10) mod 10)) :: (num mod 10) ::
                 (xs' xs))
        else
          (let num = x * i in
           if num < 10
           then (helper 0 num) :: (accum xs)
           else (helper 1 ((num / 10) mod 10)) :: (num mod 10) :: (accum xs)) in
  helper 0 [] lre;;


(* fix

let rec removeZero l =
  match l with | x::xs -> if x = 0 then removeZero xs else l | _ -> l;;

let rec mulByDigit i l =
  let lre = List.rev l in
  let rec helper carry accum lrev =
    match lrev with
    | [] -> removeZero accum
    | x::xs ->
        if carry = 1
        then
          (match accum with
           | x1'::xs' ->
               let num = (x * i) + x1' in
               if num < 10
               then helper 0 (num :: xs') xs
               else helper 1 (((num / 10) mod 10) :: (num mod 10) :: xs') xs)
        else
          (let num = x * i in
           if num < 10
           then helper 0 (num :: accum) xs
           else helper 1 (((num / 10) mod 10) :: (num mod 10) :: accum) xs) in
  helper 0 [] lre;;

*)

(* changed spans
(18,20)-(19,25)
helper 1
       (((num / 10) mod 10) :: ((num mod 10) :: xs'))
       xs
AppG (fromList [VarG,LitG,ConAppG (Just (TupleG (fromList [BopG (BopG VarG LitG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG])))])))])

(23,16)-(23,44)
helper 0 (num :: accum) xs
AppG (fromList [VarG,LitG,ConAppG (Just (TupleG (fromList [VarG])))])

(24,16)-(24,76)
helper 1
       (((num / 10) mod 10) :: ((num mod 10) :: accum))
       xs
AppG (fromList [VarG,LitG,ConAppG (Just (TupleG (fromList [BopG (BopG VarG LitG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG])))])))])

*)

(* changed exprs
App (Just (18,20)-(18,76)) (Var (Just (18,20)-(18,26)) "helper") [Lit (Just (18,27)-(18,28)) (LI 1),ConApp (Just (18,29)-(18,73)) "::" (Just (Tuple (Just (18,30)-(18,72)) [Bop (Just (18,30)-(18,49)) Mod (Bop (Just (18,31)-(18,41)) Div (Var (Just (18,32)-(18,35)) "num") (Lit (Just (18,38)-(18,40)) (LI 10))) (Lit (Just (18,46)-(18,48)) (LI 10)),ConApp (Just (18,53)-(18,72)) "::" (Just (Tuple (Just (18,53)-(18,72)) [Bop (Just (18,53)-(18,65)) Mod (Var (Just (18,54)-(18,57)) "num") (Lit (Just (18,62)-(18,64)) (LI 10)),Var (Just (18,69)-(18,72)) "xs'"])) Nothing])) Nothing,Var (Just (18,74)-(18,76)) "xs"]
App (Just (22,16)-(22,42)) (Var (Just (22,16)-(22,22)) "helper") [Lit (Just (22,23)-(22,24)) (LI 0),ConApp (Just (22,25)-(22,39)) "::" (Just (Tuple (Just (22,26)-(22,38)) [Var (Just (22,26)-(22,29)) "num",Var (Just (22,33)-(22,38)) "accum"])) Nothing,Var (Just (22,40)-(22,42)) "xs"]
App (Just (23,16)-(23,74)) (Var (Just (23,16)-(23,22)) "helper") [Lit (Just (23,23)-(23,24)) (LI 1),ConApp (Just (23,25)-(23,71)) "::" (Just (Tuple (Just (23,26)-(23,70)) [Bop (Just (23,26)-(23,45)) Mod (Bop (Just (23,27)-(23,37)) Div (Var (Just (23,28)-(23,31)) "num") (Lit (Just (23,34)-(23,36)) (LI 10))) (Lit (Just (23,42)-(23,44)) (LI 10)),ConApp (Just (23,49)-(23,70)) "::" (Just (Tuple (Just (23,49)-(23,70)) [Bop (Just (23,49)-(23,61)) Mod (Var (Just (23,50)-(23,53)) "num") (Lit (Just (23,58)-(23,60)) (LI 10)),Var (Just (23,65)-(23,70)) "accum"])) Nothing])) Nothing,Var (Just (23,72)-(23,74)) "xs"]
*)

(* typed spans
(18,20)-(18,76)
(22,16)-(22,42)
(23,16)-(23,74)
*)

(* correct types
int list
int list
int list
*)

(* bad types
int list
int list
int list
*)
