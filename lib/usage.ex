defmodule CacheDecorator do
  use ESC
end

defmodule API do
  use CacheDecorator

  ### Reformat resp via post_hook/1 callback
  def post_hook(resp) do
    case resp do
      :ok -> :okkk
      _other -> resp
    end
  end

  @decorate cache_put(User)
  def create_user(id, name) do
    _ = {id, name}
    user = Helper.make_user()
    {:ok, user}
  end

  @decorate cache_evict(User)
  def delete_user(conds_or_id) do
    _ = conds_or_id
    :ok
  end

  @decorate cache_evict(User)
  def update_user(conds) do
    _ = conds
    :ok
  end

  @decorate cache_struct(User)
  def get_user(conds) do
    _ = conds
    user = Helper.make_user()
    {:ok, user}
  end

  @decorate cache_struct(Role)
  def get_role_by_id(id) do
    _ = id
    role = Helper.make_role()
    {:ok, role}
  end

  ###
  @decorate cache_put(Role)
  def create_role(id, name) do
    _ = {id, name}
    role = Helper.make_role()
    {:ok, role}
  end

  @decorate cache_evict(Role)
  def delete_role(conds_or_id) do
    _ = conds_or_id
    :ok
  end

  @decorate cache_evict(Role)
  def update_role(conds) do
    _ = conds
    :ok
  end
end
