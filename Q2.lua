function printSmallGuildNames(memberCount)
-- this method is supposed to print names of all guilds that have less than memberCount max members
local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
	while resultId:next() do
		local guildName = resultId:get("name")
		print(guildName)
	end
	-- there was no way for it to loop, would only find the first result and be finished
end 
