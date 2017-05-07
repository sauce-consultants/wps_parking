defmodule Random do
  @on_load :initial_seed

  def initial_seed do
    seed
    :ok
  end

  def rand, do: :rand.uniform

  def rand(:normal), do: :rand.normal
  def rand(n) when is_integer(n), do: :rand.uniform(n)
  def rand(n1..n2) when is_integer(n1) and is_integer(n2) do
    :rand.uniform(n2 - n1 + 1) + n1 - 1
  end
  def rand(state), do: :rand.uniform_s(state)

  def rand(:normal, state), do: :rand.normal_s(state)
  def rand(n, state) when is_integer(n), do: :rand.uniform_s(n, state)
  def rand(n1..n2, state) when is_integer(n1) and is_integer(n2) do
    {n, state} = :rand.uniform_s(n2 - n1, state)
    {n + n1 - 1, state}
  end

  def normal, do: rand(:normal)
  def normal(state), do: rand(:normal, state)

  def seed, do: :rand.seed(:exs1024)
  def seed(algo) when is_atom(algo), do: :rand.seed(algo)
  def seed(state), do: :rand.seed(:rand.export_seed_s(state))
  def seed3(algo, triplet) when is_atom(algo) and is_tuple(triplet), do: :rand.seed(algo, triplet)

  def sample(enum, n \\ 1)
  def sample(n1..n2, n), do: Enum.take_random(n1..n2, n)
  def sample(list, n) when is_list(list), do: Enum.take_random(list, n)

  def shuffle(enum), do: Enum.shuffle(enum)
end
