defmodule UsageTest do
  use ExUnit.Case

  # always create new one with random id & name. See Helper Module.
  # so the following id & name are nonsense
  @nonsense_id 1
  @nonsense_name "any name"

  test "get from cache" do
    {:ok, %User{id: uid}} = API.create_user(@nonsense_id, @nonsense_name)
    {:ok, %User{id: uid2}} = API.get_user(id: uid)
    assert uid == uid2
  end

  test "delete nested struct, then related struct will be deleted" do
    {:ok, %User{id: uid, role: %Role{id: rid}}} = API.create_user(@nonsense_id, @nonsense_name)
    :ok = API.delete_role(rid)

    # two uids should be not equal.
    # cause get_user will create new random one if not found in cache.
    {:ok, %User{id: expected_uid}} = API.get_user(id: uid)
    assert expected_uid != uid
  end
end
