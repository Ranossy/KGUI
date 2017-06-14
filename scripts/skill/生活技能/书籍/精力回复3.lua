--生活技能阅读

function OnReadPage(player)
	player.AddStamina(10) --瞬间回复精力3级
	player.SendSystemMessage(GetEditorString(2, 8073))
	return true;
end;
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com