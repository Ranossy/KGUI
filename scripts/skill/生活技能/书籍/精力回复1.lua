--生活技能阅读

function OnReadPage(player)
	player.AddStamina(6) --瞬间回复精力1级
	player.SendSystemMessage(GetEditorString(2, 8071))
	return true;
end;
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com