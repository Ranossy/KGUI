--生活技能阅读

function OnReadPage(player)
	player.AddStamina(12) --瞬间回复精力4级
	player.SendSystemMessage(GetEditorString(2, 8074))
	return true;
end;
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com