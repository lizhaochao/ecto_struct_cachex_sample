defmodule User, do: defstruct([:id, :name, :role, :parent])
defmodule Role, do: defstruct([:id, :name, :child])
defmodule Parent, do: defstruct([:id, :name, :child])
defmodule Child, do: defstruct([:id])
