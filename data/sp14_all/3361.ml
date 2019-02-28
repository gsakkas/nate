
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let x a = a;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [helper [] (h * i)]
       with
       | [] -> []
       | x::y ->
           let rec adder w =
             match w with | [] -> [] | a::b -> bigAdd a (adder b) in
           adder (x :: y));;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(37,6)-(46,26)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ [h * i]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (6,6)-(6,73)) (Var (Just (6,64)-(6,65)) "@") [App (Just (6,6)-(6,63)) (Var (Just (6,7)-(6,17)) "mulByDigit") [Var (Just (6,18)-(6,19)) "i",App (Just (6,20)-(6,62)) (Var (Just (6,21)-(6,29)) "List.rev") [App (Just (6,30)-(6,61)) (Var (Just (6,31)-(6,39)) "List.map") [Lam (Just (6,40)-(6,58)) (VarPat (Just (6,45)-(6,46)) "x") (Bop (Just (6,51)-(6,57)) Times (Var (Just (6,51)-(6,52)) "x") (Lit (Just (6,55)-(6,57)) (LI 10))) Nothing,Var (Just (6,59)-(6,60)) "t"]]],List (Just (6,66)-(6,73)) [Bop (Just (6,67)-(6,72)) Times (Var (Just (6,67)-(6,68)) "h") (Var (Just (6,71)-(6,72)) "i")] Nothing]
*)

(* typed spans
(6,6)-(6,73)
*)

(* correct types
int list
*)

(* bad types
int list
*)
