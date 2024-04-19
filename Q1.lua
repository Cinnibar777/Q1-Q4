local function releaseStorage(player)
	player:setStorageValue(1000, -1)
end

function onLogout(player)
	if player:getStorageValue(1000) == 0 then -- changing line 6 to a '0' instead of a '1' would free up the storage space if the account is empty, it gets released
												-- dont really want to remove someone's account if they have any items in their inventory
		addEvent(releaseStorage, 1000, player)
	end
	return true
end

-- what i liked about question 2 over this one, is there was a specific comment with a goal in mind of what the code 'should' do, this did not have any direction of where
-- it should be taken, or what purpose this had