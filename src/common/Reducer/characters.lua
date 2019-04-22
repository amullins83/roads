local Common = script.Parent.Parent

local Log = require(Common.Log)
local Dict = require(Common.Dict)

local function characters(state, action)
	if state == nil then
		state = {
			{
				position = Vector3.new(1, 1, 1),
			},
		}
	end

	if action.type == "moveCharacter" then
		local character = state[action.characterId]

		if character == nil then
			Log.warn("Couldn't move character ID %d: it did not exist", action.characterId)
			return state
		end

		return Dict.join(state, {
			[action.characterId] = Dict.join(character, {
				position = action.newPosition,
			}),
		})
	end

	return state
end

return characters