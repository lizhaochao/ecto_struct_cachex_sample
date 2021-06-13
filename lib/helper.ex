defmodule Helper do
  def make_user do
    user_id = System.unique_integer([:positive])
    role_id = System.unique_integer([:positive])
    parent_id = System.unique_integer([:positive])
    child_id = System.unique_integer([:positive])

    %User{
      id: user_id,
      name: "u_name#{user_id}",
      role: %Role{id: role_id, name: "r_name#{role_id}"},
      parent: %Parent{id: parent_id, name: "parent#{parent_id}", child: %Child{id: child_id}}
    }
  end

  def make_role do
    role_id = System.unique_integer([:positive])
    child_id = System.unique_integer([:positive])
    %Role{id: role_id, name: "r_name#{role_id}", child: %Child{id: child_id}}
  end
end
