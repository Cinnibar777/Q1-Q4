void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId) {
Player* player = g_game.getPlayerByName(recipient);
if (!player) {
	player = new Player(nullptr);
	if (!IOLoginData::loadPlayerByName(player, recipient)) {
		delete player;
		// when the player object gets created on line 4, there is no way for it to be removed if something bugs out
		return;
	}
}

Item* item = Item::CreateItem(itemId);
if (!item) {
	delete item;
	// i dont believe the 'item' object would get deleted either
	return;
}

g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

if (player->isOffline()) {
	IOLoginData::savePlayer(player);
}
// removed extra '}'