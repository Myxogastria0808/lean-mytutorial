/-
引用元
https://speakerdeck.com/unaoya/zheng-ming-zhi-yuan-xi-leanniru-men-siyou?slide=22
-/
-- 以下の問題を考える。
/-
あるお店で、リンゴ、みかん、いちごの3種類の果物が売られている。
- リンゴ: 100円/個
- みかん: 50円/個
- いちご: 200円/個
リンゴとみかんといちごの個数を引数に取り、
合計金額を返す項を作成する。
ただし、レジ袋が必要な場合は、合計金額に10円を加算するものとする。
-/
-- 項totalの型 ... Nat -> Nat -> Nat -> Bool -> Nat
def total (apple orange strawberry : Nat) (needBag : Bool) : Nat :=
  -- let式を使って、レジ袋の金額を計算する。
  -- if-then-else式の型 ... Bool -> Nat
  let bagCost := if needBag then 10 else 0
  -- 合計金額を計算する。
  -- +演算子の型 ... Nat -> Nat -> Nat
  -- *演算子の型  ... Nat -> Nat -> Nat
  apple * 100 + orange * 50 + strawberry * 200 + bagCost
