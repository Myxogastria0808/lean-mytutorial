-- 等式の推移律の証明
/-
-- 定理 (Theorem)
a, b, c を自然数とし、 a = b かつ b = c ならば a = c である。

-- 証明 (Proof)
等式の推移律により、a = b かつ b = c ならば a = c である。
-/
theorem A (a b c : Nat) (h1 : a = b) (h2 : b = c) : a = c :=
  -- 等式の推移律を適用する。
  -- Eq.transの型 ... a = b -> b = c -> a = c
  -- つまり、h1とh2を使って、a = cを導くことができる。
  Eq.trans h1 h2

/-
-- 定理 (Theorem)
a, b を自然数とする。(a + 1) * b = a * b + b が成り立つ。

-- 証明 (Proof)
1. 分配法則より、(a + 1) * b = a * b + 1 * b である。
2. 掛け算の定義より、1 * b = b である。
3. 関数と統合の定義より、a * b + 1 * b = a * b + b である。

4. 等式の推移律を適用する。
ここまでの式を α, β, γ として、以下のように置く。
- α := (a + 1) * b
- β := a * b + 1 * b
- γ := a * b + b

これらの式を使って、等式の推移律を適用する。
α, β, γ の評価結果は全て自然数であり、 α = β かつ β = γ である。
したがって、等式の推移律により、 α = γ である.
-/

theorem B (a b : Nat) : (a + 1) * b = a * b + b :=
  -- 分配法則を適用する。
  -- Nat.mul_addの型 ... Nat -> Nat -> Nat -> Nat
  have h1 : (a + 1) * b = a * b + 1 * b := Nat.add_mul a 1 b
  -- 掛け算の定義を適用する。
  -- Nat.one_mulの型 ... Nat -> Nat
  have h2 : 1 * b = b := Nat.one_mul b
  -- 関数と統合の定義を適用する。
  /-
    congrArgは、以下のように `s t` の形の項を置換するための関数である。
    関数項を第一引数に、置換対象の項を第二引数に取り、
    第一引数の仮引数の項を第二引数に置換してるんだね
  -/
  /-
  variable (h : s = t)
  example : f s = f t := congrArg f h
  -/
  have h3 : a * b + 1 * b = a * b + b := congrArg (fun x => a * b + x) h2
  -- 等式の推移律を適用する
  Eq.trans h1 h3

/-
-- 定理 (Theorem)
a, b を自然数とする。(a + 1) * (b + 1) = a * b + a + b + 1 が成り立つ。

-- 証明 (Proof)
1. 分配法則より、(a + 1) * (b + 1) = (a + 1) * b + (a + 1) * 1 である。
2. 分配法則より、(a + 1) * b = a * b + 1 * b である。
3. 分配法則より、(a + 1) * 1 = a * 1 + 1 * 1 である。
4. 掛け算の定義より、1 * b = b である。
5. 掛け算の定義より、 a * 1 = a である。
6. 掛け算の定義より、 1 * 1 = 1 である。
7. 関数と統合の定義より、 a * b + 1 * b = a * b + b である。
8. 関数と統合の定義より、 a * 1 + 1 * 1 = a + 1 である。
9. 関数と統合の定義より、 (a + 1) * b + (a + 1) * 1 = (a * b + 1 * b) + (a * 1 + 1 * 1) である。
10. 関数と統合の定義より、 (a * b + 1 * b) + (a * 1 + 1 * 1) = (a * b + b) + (a + 1) である。
11. 関数と統合の定義より、 (a * b + b) + (a + 1) = a * b + a + b + 1 である。
-/

theorem C (a b : Nat) : (a + 1) * (b + 1) = a * b + a + b + 1 :=
  -- 分配法則を適用する。
  have h1 : (a + 1) * (b + 1) = (a + 1) * b + (a + 1) * 1 := Nat.mul_add (a + 1) b 1
  -- 分配法則を適用する。
  have h2 : (a + 1) * b = a * b + 1 * b := Nat.add_mul a 1 b
  -- 分配法則を適用する。
  have h3 : (a + 1) * 1 = a * 1 + 1 * 1 := Nat.add_mul a 1 1
  -- 掛け算の定義を適用する。
  have h4 : 1 * b = b := Nat.one_mul b
  -- 掛け算の定義を適用する。
  have h5 : a * 1 = a := Nat.mul_one a
  -- 掛け算の定義を適用する。
  have h6 : 1 * 1 = 1 := Nat.one_mul 1
  -- 関数と統合の定義を適用する。
  have h7 : a * b + 1 * b = a * b + b := congrArg (fun x => a * b + x) h4
  -- 関数と統合の定義を適用する。
  have h8 : a * 1 + 1 * 1 = a + 1 := Eq.trans (congrArg (fun x => x + 1 * 1) h5) (congrArg (fun x => a + x) h6)
  -- 関数と統合の定義を適用する。
  have h9 : (a + 1) * b + (a + 1) * 1 = (a * b + 1 * b) + (a * 1 + 1 * 1) :=
    Eq.trans (congrArg (fun x => x + (a + 1) * 1) h2) (congrArg (fun x => (a * b + 1 * b) + x) h3)
  -- 関数と統合の定義を適用する。
  have h10 : (a * b + 1 * b) + (a * 1 + 1 * 1) = (a * b + b) + (a + 1) :=
    Eq.trans (congrArg (fun x => x + (a * 1 + 1 * 1)) h7) (congrArg (fun x => (a * b + b) + x) h8)
  -- 関数と統合の定義を適用する。
  have h11 : (a * b + b) + (a + 1) = a * b + a + b + 1 := by omega
    Eq.trans h1 (Eq.trans h9 (Eq.trans h10 h11))
