
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x' -> [[(x * i) / 10]; ((x * i) mod 10) + [mulByDigit i x']];;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(3,2)-(5,67)
match l with
| [] -> []
| x :: x' :: x'' -> [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                                            [x'] @ x''))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

(5,13)-(5,67)
[(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                        [x'] @ x''))
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

(5,14)-(5,28)
(@)
VarG

(5,30)-(5,66)
[((x * i) mod 10) + x'] @ (mulByDigit i
                                      [x'] @ x'')
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

(5,49)-(5,66)
x'
VarG

(5,50)-(5,60)
mulByDigit i [x']
AppG (fromList [VarG,ListG EmptyG])

(5,63)-(5,65)
[x']
ListG VarG

*)

(* typed spans
int list
int list
int list -> int list -> int list
int list
int
int list
int list
*)
