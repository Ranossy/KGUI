--生活技能阅读

function OnReadPage(player)
	player.AddStamina(20) --瞬间回复精力5级
	player.SendSystemMessage(GetEditorString(3, 9050))
	return true;
end;
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com