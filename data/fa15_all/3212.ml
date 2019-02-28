
let rec mulByDigit i l =
  if l = []
  then []
  else
    (let h::t = l in
     if h = [] then [] else (match t with | [] -> h | _ -> [(h * i) / 10]));;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(3,2)-(7,75)
match l with
| [] -> []
| x :: x' :: x'' -> [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                                            [x'] @ x''))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

(7,5)-(7,74)
EMPTY
EmptyG

(7,20)-(7,22)
[(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                        [x'] @ x''))
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

(7,59)-(7,73)
(@)
VarG

(7,61)-(7,62)
x
VarG

*)

(* typed spans
(3,2)-(7,63)
(6,6)-(7,63)
(6,21)-(6,22)
(6,8)-(6,9)
*)

(* typed spans
int list
int list
int list -> int list -> int list
int
*)

(* typed spans
int list
int list
int list
int list
*)
